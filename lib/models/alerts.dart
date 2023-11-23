import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:server_alerts/models/alert.dart';

part 'alerts.freezed.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class Alerts with _$Alerts {
  factory Alerts(List<PriceAlert>? list) = _Alerts;
}
