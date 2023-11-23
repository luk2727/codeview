import 'dart:async';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:foundation/services/connectivity_observer.dart';
import 'package:google_api_availability/google_api_availability.dart';
import 'package:localbroadcast/events.dart';
import 'package:localbroadcast/local_broadcast.dart';
import 'package:push_notification/models/cloud_notification.dart';
import 'package:push_notification/models/push_notification.dart';
import 'package:push_notification/storage/push_repository.dart';

mixin PushAlerts{
  String? _fcmToken;
  StreamSubscription? _fcmMessageSubscription;
  StreamSubscription? _fcmTokenSubscription;

  bool isFirstLaunch = false;

  bool _isWaitingForFCM = false;

  void onFcmTokenChanged(String token) {
    _fcmToken = token;
    LocalBroadcast.instance.notifyOnly(Events.FCM_TOKEN_CHANGED);
  }


  @protected
  bool get isWaitingForFCM => _isWaitingForFCM;

  String? get fcmToken => _fcmToken;

  bool get isFcmAvailable => _fcmToken?.isNotEmpty ?? false;

  Future setUpFCM(ConnectivityObserver connectivity) async {
    bool isGoogleServicesAvailable = true;

    if (Platform.isAndroid) {
      final status = await GoogleApiAvailability.instance
          .checkGooglePlayServicesAvailability();

      isGoogleServicesAvailable =
          GooglePlayServicesAvailability.byValue(status.value) ==
              GooglePlayServicesAvailability.success;
    }

    if (isGoogleServicesAvailable) {
      try {
        final messaging = FirebaseMessaging.instance;
        _fcmToken = await messaging.getToken();

        _fcmTokenSubscription =
            messaging.onTokenRefresh.listen(onFcmTokenChanged);
        _fcmTokenSubscription?.onError(_onFcmTokenError);
        _fcmMessageSubscription =
            FirebaseMessaging.onMessage.listen(onFcmMessageReceiver);
        _fcmMessageSubscription?.onError(_onFcmMessageError);

        final initMessage =
        await FirebaseMessaging.instance.getInitialMessage();
        if (initMessage != null) {
          onFcmMessageOpened(initMessage);
        }

        FirebaseMessaging.onMessageOpenedApp.listen(onFcmMessageOpened);

        if (_isWaitingForFCM) {
          onFcmTokenChanged(_fcmToken ?? '');
          _isWaitingForFCM = false;
        }
      } catch (_) {
        if (!connectivity.isOnline) {
          _isWaitingForFCM = true;
        }
      }
    }
  }

  void onSubscription(){
    _fcmMessageSubscription?.cancel();
    _fcmTokenSubscription?.cancel();
  }

  Future onFcmMessageOpened(RemoteMessage message);

  Future onFcmMessageReceiver(RemoteMessage message);


  void _onFcmTokenError(dynamic error, [StackTrace? stackTrace]) {
    _fcmToken = null;
    LocalBroadcast.instance.notifyOnly(Events.FCM_TOKEN_CHANGED);
  }

  void _onFcmMessageError(dynamic error, [StackTrace? stackTrace]) {
    print('Error: fcm notification: $error');
  }

  Future<PushNotification?> convertFcmToPush(
      int jobId,
      String channelId,
      CloudPushBuilder cloudNotificationBuilder,
      RemoteMessage message, {
        String? data,
      }) async {
    PushNotification? push;

    final title = message.notification?.title;
    final text = message.notification?.body;

    if (title != null && text != null) {
      final image = message.notification?.android?.imageUrl;
      if (image != null && image.isNotEmpty) {
        try {
          String fileId;

          if (image.contains('/')) {
            final idIndex = image.lastIndexOf('/') + 1;
            final fileName = image.substring(idIndex, image.length);
            fileId = fileName.substring(0, fileName.lastIndexOf('.'));
          } else {
            fileId = image;
          }

          push = await cloudNotificationBuilder.convertCloudToLocal(
            id: jobId,
            channelId: channelId,
            key: 'push_alert_$fileId',
            data: data,
            source: CloudNotification(title: title, text: text, icon: image),
          );
        } catch (_) {}
      }

      push ??= PushNotification(
          jobId,
          channelId,
          title,
          text,
          data: data,
          darwinDetails: const DarwinPushDetails(
            presentAlert: true,
            presentBadge: true,
            interruptionLevel: 1,
          ),
        );
    }

    return push;
  }
}