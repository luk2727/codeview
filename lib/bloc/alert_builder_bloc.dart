import 'dart:async';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foundation/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:server/server.dart';
import 'package:server_alerts/generated/strings/strings_consts.g.dart';
import 'package:server_alerts/server_alerts.dart';
import 'package:server_alerts/utils/error_alerts.dart';

part 'alert_builder_event.dart';
part 'alert_builder_state.dart';
part 'alert_builder_bloc.freezed.dart';

class AlertBuilderBloc extends Bloc<AlertBuilderEvent, AlertBuilderState> {
  static const _timeout = Duration(seconds: 5);

  final _alerts = Alerts([]);

  final int maxAlertsCount;
  final AlertsRepository repository;

  AlertBuilderBloc({required this.maxAlertsCount, required this.repository})
      : super(const AlertBuilderState.initial()) {
    on<AlertBuilderEvent>((event, emit) async {
      return event.map<Future<void>>(
          remove: (event) => _remove(event, emit),
          create: (event) => _create(event, emit),
          load: (event) => _load(event, emit),
          removeAll: (event) => _removeAll(event, emit),
          changeValue: (event) => _changeValue(event, emit),
          update: (event) => _updateAlerts(event, emit));
    });
    repository.alertsNotifier.addListener(_onAlertsChanged);
  }


  @override
  Future<void> close() async {
    super.close();
    repository.alertsNotifier.removeListener(_onAlertsChanged);
  }


  //обработчик подписки на изменения в репозитории, репозиторий у нас один для всех
  //а объектов блока может быть больше одного соответственно для обновления состояния во всех блоках
  //мы обновляем так
  void _onAlertsChanged() {
    //инициализация связано с id юзера получаемого через сервисы гугла
    final alerts = repository.alertsNotifier.value;
    _alerts.list?.clear();
    _alerts.list?.addAll(alerts);
    add(AlertBuilderEvent.update(alerts: _alerts));
  }

  Future<void> _changeValue(
      _ChangeValue event, Emitter<AlertBuilderState> emit) async {
    final alerts = _alerts.list;
    final valueExists =
        alerts?.any((alert) => alert.value.toString() == event.value);

    if (valueExists ?? false) {
      // Значение уже присутствует в списке
      emit(AlertBuilderState.error(
          message: Strings.sa_error_duplicate, alerts: _alerts));
    } else {
      final val = double.tryParse(event.value) ?? 0;
      if (val == 0) {
        emit(AlertBuilderState.error(
            message: Strings.sa_error_input, alerts: _alerts));
      } else {
        // Значение отсутствует в списке
        add(AlertBuilderEvent.update(alerts: _alerts));
      }
    }
  }

  Future<void> _updateAlerts(
      _UpdateAlerts event, Emitter<AlertBuilderState> emit) async {
    final list = event.alerts.list;
    final count = list != null ? list.length : 0;

    if (count >= maxAlertsCount) {
      emit(const AlertBuilderState.inProgress());
      emit(AlertBuilderState.error(
          message: Strings.sa_error_max_count, alerts: event.alerts));
    } else {
      emit(const AlertBuilderState.inProgress());
      emit(AlertBuilderState.successful(alerts: event.alerts));
    }
  }

  Future<void> _create(
      _CreateAlert event, Emitter<AlertBuilderState> emit) async {
    final alerts = _alerts.list;
    if (alerts != null &&
        alerts.any((item) => item.value == event.targetPrice)) {
      emit(AlertBuilderState.error(
          message: Strings.sa_error_duplicate, alerts: _alerts));
      return;
    }

    final alert = PriceAlert(
      value: event.targetPrice,
      comment: event.comment.orIfEmpty(' '),
    );
    await _tryProcess(
      () => repository
          .sendAlert(event.pair, event.currentPrice, alert)
          .timeout(_timeout),
      AlertsRepository.create,
      emit,
    );
  }

  Future<void> _load(_LoadAlert event, Emitter<AlertBuilderState> emit) async {
    emit(const AlertBuilderState.inProgress());
    await _tryProcess(
      () => repository.loadAlerts(event.pair, maxAlertsCount),
      AlertsRepository.load,
      emit,
    );
  }

  Future<void> _remove(
      _RemoveAlert event, Emitter<AlertBuilderState> emit) async {
    await _tryProcess(
      () => repository.removeAlert(event.alert).timeout(_timeout),
      AlertsRepository.remove,
      emit,
    );
  }

  Future<void> _removeAll(
      _RemoveAllAlert event, Emitter<AlertBuilderState> emit) async {
    emit(const AlertBuilderState.inProgress());
    await _tryProcess(
      () => repository.deleteAllAlerts().timeout(_timeout),
      AlertsRepository.removeAll,
      emit,
    );
  }

  Future<void> _tryProcess<T>(
    Future<T> Function() operation,
    String request,
    Emitter<AlertBuilderState> emit, {
    bool isSilent = false,
  }) async {
    try {
      await operation();
    } on TimeoutException catch (error, stack) {
      _onError(emit, request, Strings.sa_error_no_connection, error, stack);
    } on SocketException catch (error, stack) {
      _onError(emit, request, Strings.sa_error_no_connection, error, stack);
    } on HttpException catch (error, stack) {
      _onError(emit, request, Strings.sa_error_unexpected, error, stack);
    } on FormatException catch (error, stack) {
      _onError(emit, request, Strings.sa_error_unexpected, error, stack);
    } on UserIdException catch (error, stack) {
      _onError(emit, request, Strings.sa_error_initialization, error, stack);
    } on GrpcError catch (error, stack) {
      final String message;
      switch (error.code) {
        case StatusCode.unavailable:
          message = Strings.sa_error_no_connection;
          break;
        case StatusCode.alreadyExists:
          message = Strings.sa_error_duplicate;
          break;
        case StatusCode.deadlineExceeded:
          message = Strings.sa_error_initialization;
          break;
        case StatusCode.permissionDenied:
          message = Strings.sa_error_initialization;
          break;
        case StatusCode.invalidArgument:
          message = Strings.sa_error_input;
          break;
        default:
          message = Strings.sa_error_unexpected;
          break;
      }

      _onError(emit, request, message, error, stack);
    } catch (error, stack) {
      _onError(emit, request, Strings.sa_error_unexpected, error, stack);
    }
  }

  void _onError(
    Emitter<AlertBuilderState> emit,
    String source,
    String message,
    dynamic error, [
    StackTrace? stack,
  ]) {
    final state = AlertBuilderState.error(
      message: message,
      alerts: _alerts,
      error: error,
      stackTrace: stack,
      source: source,
    );

    // emit обновляет состояние на экране
    // onError запускает аналитику
    emit(state);
    onError(AlertError(error, source), stack ?? StackTrace.current);
  }
}
