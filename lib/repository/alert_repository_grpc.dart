import 'package:localbroadcast/broadcast_receiver.dart';
import 'package:localbroadcast/events.dart';
import 'package:localbroadcast/local_broadcast.dart';
import 'package:server/server.dart';
import 'package:server_alerts/models/alert.dart';
import 'package:server_alerts/repository/alert_repository.dart';
import 'package:server_alerts/utils/alert_mapper.dart';
import 'package:server_alerts/utils/error_alerts.dart';

class AlertsRepositoryGrpc extends AlertsRepository {
  final _mapper = AlertsMapper();
  final _service = AlertsDataServiceGrpc();

  final _receiver = BroadcastReceiver();

  AlertsRepositoryGrpc(super.connection, super.uid);

  @override
  Future initialize() async {
    if (connection.isValid) {
      _initReceiverAlert();
      return _service
          .initialize(connection.host!, connection.port!)
          .then((value) {
        isInitialized = true;
        return value;
      });
    }

  }

  void _initReceiverAlert(){
    _receiver.add(
      Events.ALERT_NOTIFICATION_CHANGE,
          (String pair) {
        return loadAlerts(pair, 100);
      },
    );
    LocalBroadcast.instance.register(_receiver);
  }

  @override
  void dispose() {
    LocalBroadcast.instance.unregister(_receiver);
  }

  @override
  bool isInitialize() => uid.isNotEmpty;

  @override
  Future<void> loadAlerts(String pair, [int maxCount = 100]) async {
    if (isInitialize()) {
      final instrument = Instrument()
        ..ticker = pair;
      final request = GetAlertsRequest()
        ..userId = uid
        ..instrument = instrument
        ..size = maxCount
        ..after = '';

      final response =
      await _service.getAlerts(_service.serviceCall(), request);
      final list = _mapper
          .parseAlertsFrom(response)
          .list ?? [];
      alertsNotifier.value = list;
    } else {
      throw UserIdException('No user_id');
    }
  }

  @override
  Future<void> removeAlert(PriceAlert alert) async {
    final request = DeleteAlertRequest()
      ..alertId = alert.id!
      ..userId = uid;

    await _service.deleteAlert(_service.serviceCall(), request);
    final updatedAlertsList = [...alertsNotifier.value];
    updatedAlertsList.remove(alert);
    alertsNotifier.value = updatedAlertsList;
  }

  @override
  Future<void> sendAlert(String pair, double currentPrice,
      PriceAlert alert) async {
    final instrument = Instrument()
      ..ticker = pair;
    final request = CreateAlertRequest()
      ..userId = uid
      ..thresholdPrice = alert.value
      ..currentPrice = currentPrice
      ..instrument = instrument
      ..comment = alert.comment ?? '';

    final response =
    await _service.createAlert(_service.serviceCall(), request);
    final alertPrice = _mapper.parseAlertFrom(response);
    final updatedAlertsList = [...alertsNotifier.value, alertPrice];
    print('alertsNotifier.value = $updatedAlertsList');
    alertsNotifier.value = updatedAlertsList;
  }

  @override
  Future<void> deleteAllAlerts() async {
    final request = DeleteAllAlertsRequest()
      ..userId = uid;

    await _service.deleteAllAlerts(_service.serviceCall(), request);
    alertsNotifier.value = [];
  }

  @override
  Future reset() async {
    await _service.terminate();
    return super.reset();
  }
}
