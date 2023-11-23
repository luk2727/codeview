part of 'alert_builder_bloc.dart';

@freezed
class AlertBuilderEvent with _$AlertBuilderEvent {
  const AlertBuilderEvent._();

  const factory AlertBuilderEvent.create({
    required String pair,
    required double currentPrice,
    required double targetPrice,
    String? comment,
  }) = _CreateAlert;

  const factory AlertBuilderEvent.load({
    required String pair,
  }) = _LoadAlert;

  const factory AlertBuilderEvent.changeValue({
    required String value,
  }) = _ChangeValue;

  const factory AlertBuilderEvent.remove({
    required PriceAlert alert,
  }) = _RemoveAlert;

  const factory AlertBuilderEvent.removeAll({
    required String pair,
  }) = _RemoveAllAlert;

  const factory AlertBuilderEvent.update({
    required Alerts alerts,
  }) = _UpdateAlerts;
}
