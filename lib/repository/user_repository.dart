import 'package:flutter/foundation.dart';
import 'package:server/server.dart';

abstract class AlertsUserRepository {
  bool _isInitialized = false;

  AlertsUserRepository();

  Future initialize(ServiceConnection connection);

  @mustCallSuper
  Future reset() async {
    _isInitialized = false;
  }

  @protected
  set isInitialized(bool value) {
    _isInitialized = value;
  }

  bool get isInitialized => _isInitialized;

  Future sendUser({
    required String userId,
    required String fcmToken,
    required String localCode,
    required String timeZoneOffset,
  });
}

class AlertsUserRepositoryGrpc extends AlertsUserRepository {
  final _service = AlertsUsersServiceGrpc();

  AlertsUserRepositoryGrpc();

  @override
  Future initialize(ServiceConnection connection) async {
    if (connection.isValid) {
      return _service
          .initialize(connection.host!, connection.port!)
          .then((value) {
        isInitialized = true;
        return value;
      });
    }
  }

  @override
  Future<SendUserDataResponse> sendUser({
    required String userId,
    required String fcmToken,
    required String localCode,
    required String timeZoneOffset,
  }) async {
    if (!isInitialized) {
      throw StateError('AlertsUserRepository isn\'t initialized');
    }

    final data = SendUserDataRequest()
      ..userId = userId
      ..fcmRegistrationToken = fcmToken
      ..locale = localCode
      ..timeZoneOffset = timeZoneOffset;

    return _service.sendUserData(_service.serviceCall(), data);
  }

  @override
  Future reset() async {
    await _service.terminate();
    return super.reset();
  }
}
