import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:server/server.dart';
import 'package:server_alerts/models/alert.dart';

abstract class AlertsRepository {
  static const create = 'CREATE_ALERT';
  static const remove = 'REMOVE_ALERT';
  static const load = 'LOAD_ALERTS';
  static const removeAll = 'REMOVE_ALL_ALERTS';

  final ServiceConnection connection;
  final String uid;

  final alertsNotifier = ValueNotifier<List<PriceAlert>>([]);

  bool _isInitialized = false;

  AlertsRepository(this.connection, this.uid);

  Future initialize();

  bool isInitialize();

  @protected
  set isInitialized(bool value) {
    _isInitialized = value;
  }

  bool get isInitialized => _isInitialized;

  @mustCallSuper
  Future reset() async {
    _isInitialized = false;
  }

  Future<void> sendAlert(String pair, double currentPrice, PriceAlert alert);

  Future<void> loadAlerts(String pair, [int maxCount = 100]);

  Future<void> removeAlert(PriceAlert alert);

  Future<void> deleteAllAlerts();

  void dispose();
}
