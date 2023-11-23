part of 'alert_builder_bloc.dart';

@freezed
class AlertBuilderState with _$AlertBuilderState {
  const factory AlertBuilderState.initial() = _InitialAlertBuilderState;

  /// В обработке
  const factory AlertBuilderState.inProgress() = _InProgressAlertBuilderState;

  /// Нет инициализации
  const factory AlertBuilderState.notInitialized() = _NotInitializedState;

  /// Ошибка
  const factory AlertBuilderState.error({
    required final Alerts alerts,
    @Default('Error occured') String message,
    String? source,
    dynamic error,
    StackTrace? stackTrace,
  }) = _ErrorAlertBuilderState;

  /// Успех с возвратом списка алертов
  const factory AlertBuilderState.successful({
    required final Alerts alerts,
  }) = _SuccessfulAlertBuilderState;
}
