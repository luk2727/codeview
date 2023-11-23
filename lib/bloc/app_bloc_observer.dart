import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foundation/foundation.dart';
import 'package:localbroadcast/localbroadcast.dart';
import 'package:server/server.dart';
import 'package:server_alerts/consts.dart';
import 'package:server_alerts/utils/error_alerts.dart';

import 'alert_builder_bloc.dart';

/// Общий интерфейс для обработчиков событий алертов.
abstract class AlertsListener {

  void onStarted();

  void onAlertCreated();

  void onAlertRemoved();

  ///метод для аналитики
  void onAlertError(
    dynamic error, [
    String? source,
    StackTrace? stackTrace,
  ]);
}

class AlertsBlockListener extends BlocObserver implements AlertsListener {
  @protected
  final Analytics? analytics;

  AlertsBlockListener(this.analytics);

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    if (event == null || bloc.state == null) return;
    if (event is AlertBuilderEvent) {
      event.mapOrNull(
        create: (_) => onAlertCreated(),
        remove: (_) => onAlertRemoved(),
      );
    }
  }

  @override
  void onTransition(
      Bloc<dynamic, dynamic> bloc,
      Transition<dynamic, dynamic> transition,
      ) {
        super.onTransition(bloc, transition);

  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);

    if (error is AlertError) {
      // Отсекаем ошибки соединения.
      if (!error.isConnectionError) {
        onAlertError(error.reason, error.source, stackTrace);
      }
    } else {
      onAlertError(error, null, stackTrace);
    }
  }

  // -------------------------------------------------------------------------------
  // Базовые события аналитики.
  // При необходимости можно расширить в классе-наследнике.

  @override
  void onStarted() {
    analytics?.logEvent(
      event: AlertsEvents.ALERTS_SCREEN_SHOWED,
    );
  }

  @override
  void onAlertCreated() {
    analytics?.logEvent(
      event: AlertsEvents.PRICE_ALERT_CREATED,
    );
  }

  @override
  void onAlertRemoved() {
    analytics?.logEvent(
      event: AlertsEvents.PRICE_ALERT_REMOVED,
    );
  }

  @override
  void onAlertError(
    dynamic error, [
    String? source,
    StackTrace? stackTrace,
  ]) {
    analytics?.logEvent(
      event: AlertsEvents.PRICE_ALERT_ERROR,
      parameters: {
        EventParameters.SOURCE: source,
        EventParameters.ERROR: error.runtimeType.toString(),
        if (error is GrpcError) ...{
          EventParameters.ERROR_CODE: error.code,
          EventParameters.ERROR_NAME: error.codeName,
        }
      },
    );
  }
}
