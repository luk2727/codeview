import 'package:server_alerts/models/alert.dart';
import 'package:server_alerts/models/alerts.dart';
import 'package:server/generated/alerts.pb.dart';

class AlertsMapper {
  Alerts parseAlertsFrom(GetAlertsResponse response) => Alerts(response.alerts
      .map((item) => PriceAlert(
            id: item.id,
            value: item.thresholdPrice,
            comment: item.comment,
          ))
      .toList());

  PriceAlert parseAlertFrom(CreateAlertResponse response) => PriceAlert(
        id: response.alert.id,
        value: response.alert.thresholdPrice,
        comment: response.alert.comment,
      );
}
