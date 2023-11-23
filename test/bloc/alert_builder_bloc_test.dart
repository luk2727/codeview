import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:localization_helper/utils/locale_manager.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:server_alerts/bloc/alert_builder_bloc.dart';
import 'package:server_alerts/generated/strings/strings_consts.g.dart';
import 'package:server_alerts/models/alert.dart';
import 'package:server_alerts/models/alerts.dart';
import 'package:server_alerts/repository/alert_repository.dart';

import 'alert_builder_bloc_test.mocks.dart';

class MockAlertRepositoryImpl extends MockAlertsRepository {
  MockAlertRepositoryImpl(this._listAnswer) : super();

  final List<PriceAlert> _listAnswer;

  @override
  Future<void> sendAlert(
      String? pair, double? currentPrice, PriceAlert? alert) async {
    alertsNotifier.value = _listAnswer;
  }

  @override
  Future<void> loadAlerts(String? pair, [int? maxCount = 100]) async {
    alertsNotifier.value = _listAnswer;
  }

  @override
  Future<void> removeAlert(PriceAlert? alert) async {
    alertsNotifier.value = [];
  }

  @override
  Future<void> deleteAllAlerts() async {
    alertsNotifier.value = [];
  }
}

class CustomStackTrace implements StackTrace {}

@GenerateMocks([AlertsRepository])
void main() {
  int maxAlertsCount = 6;
  late AlertBuilderBloc alertBuilderBloc;
  late AlertsRepository alertRepository;

  setUp(() {
    alertRepository = MockAlertRepositoryImpl([]);
    LocaleManager.instance.init(const Locale('ru', 'RU'), {
      "sa_error_duplicate": "Такое уведомление уже существует",
      "sa_error_no_connection": "Пожалуйста, проверьте соединение с интернетом",
      "sa_error_unexpected": "Произошла ошибка. Пожалуйста, попробуйте позже."
    });
    when(alertRepository.alertsNotifier).thenReturn(ValueNotifier([]));
  });

  group('AlertBuilderBloc', () {
    test('initial state is correct', () {
      alertBuilderBloc = AlertBuilderBloc(
          repository: alertRepository, maxAlertsCount: maxAlertsCount);
      expect(alertBuilderBloc.state, equals(const AlertBuilderState.initial()));
    });

    group('send', () {
      const value = 10.0;
      const comment = 'test comment';
      const idPair = 'test_id_pair';

      tearDown(() {
        alertBuilderBloc.close();
      });

      test('initial state is correct', () {
        alertBuilderBloc = AlertBuilderBloc(
            repository: alertRepository, maxAlertsCount: maxAlertsCount);
        expect(alertBuilderBloc.state, const AlertBuilderState.initial());
      });

      test('emits [inProgress, successful] when successful', () async {
        final response = PriceAlert(
          id: 'test_id',
          value: value,
          comment: comment,
        );

        alertRepository = MockAlertRepositoryImpl([response]);
        when(alertRepository.alertsNotifier).thenReturn(ValueNotifier([]));
        alertBuilderBloc = AlertBuilderBloc(
            repository: alertRepository, maxAlertsCount: maxAlertsCount);
        final alerts = Alerts([response]);
        final expectedStates = [
          const AlertBuilderState.inProgress(),
          AlertBuilderState.successful(alerts: alerts),
        ];

        expectLater(alertBuilderBloc.stream, emitsInOrder(expectedStates));

        alertBuilderBloc.add(const AlertBuilderEvent.create(
          pair: idPair,
          targetPrice: value,
          currentPrice: value - 1,
          comment: comment,
        ));
      });

      test('emits successful when updating alerts', () async {
        final response = PriceAlert(
          id: 'test_id',
          value: value,
          comment: comment,
        );

        final alerts = Alerts([response]);
        alertRepository = MockAlertRepositoryImpl([response]);
        when(alertRepository.alertsNotifier).thenReturn(ValueNotifier([]));
        alertBuilderBloc = AlertBuilderBloc(
            repository: alertRepository, maxAlertsCount: maxAlertsCount);

        expectLater(
          alertBuilderBloc.stream,
          emitsInOrder([
            const AlertBuilderState.inProgress(),
            AlertBuilderState.successful(alerts: alerts),
          ]),
        );

        alertBuilderBloc.add(AlertBuilderEvent.update(alerts: alerts));
      });

      test('emits [inProgress, error] when value already exists', () async {
        final response = PriceAlert(
          id: 'test_id',
          value: value,
          comment: comment,
        );
        final alerts = Alerts([response]);

        final expectedStates = [
          //const AlertBuilderState.inProgress(),
          AlertBuilderState.error(
            message: Strings.sa_error_duplicate,
            alerts: alerts,
          ),
        ];

        alertRepository = MockAlertRepositoryImpl([response]);
        when(alertRepository.alertsNotifier).thenReturn(ValueNotifier([]));
        alertBuilderBloc = AlertBuilderBloc(
            repository: alertRepository, maxAlertsCount: maxAlertsCount);

        alertBuilderBloc.add(const AlertBuilderEvent.create(
          pair: idPair,
          targetPrice: value,
          currentPrice: value - 1,
          comment: comment,
        ));
        expectLater(alertBuilderBloc.stream, emitsInOrder(expectedStates));
        alertBuilderBloc.add(const AlertBuilderEvent.create(
          pair: idPair,
          targetPrice: value,
          currentPrice: value - 1,
          comment: comment,
        ));
      });

      test('emits [inProgress, error] when error is thrown', () async {
        final alert = PriceAlert(value: value, comment: comment);

        alertRepository = MockAlertsRepository();
        when(alertRepository.alertsNotifier).thenReturn(ValueNotifier([]));
        alertBuilderBloc = AlertBuilderBloc(
            repository: alertRepository, maxAlertsCount: maxAlertsCount);
        final stream = alertBuilderBloc.stream;
        //Invalid argument потому что был вызов ArgumentError
        stream.listen((event) {
          expect(event.toString().contains('error: Invalid argument(s)'), true);
        });
        when(alertRepository.sendAlert(idPair, value - 1, alert))
            .thenAnswer((_) => throw ArgumentError());

        alertBuilderBloc.add(const AlertBuilderEvent.create(
          pair: idPair,
          targetPrice: value,
          currentPrice: value - 1,
          comment: comment,
        ));
      });
    });

    group('load', () {
      const idPair = 'test_id_pair';

      test('emits [inProgress, successful] when successful', () async {
        final list = [
          PriceAlert(id: 'test_id_1', value: 10.0, comment: 'test comment 1'),
          PriceAlert(id: 'test_id_2', value: 20.0, comment: 'test comment 2'),
        ];
        final response = Alerts(list);
        final expectedStates = [
          const AlertBuilderState.inProgress(),
          AlertBuilderState.successful(
            alerts: response,
          ),
        ];
        alertRepository = MockAlertRepositoryImpl(list);
        when(alertRepository.alertsNotifier).thenReturn(ValueNotifier([]));
        when(alertRepository.isInitialize()).thenReturn(true);
        alertBuilderBloc = AlertBuilderBloc(
            repository: alertRepository, maxAlertsCount: maxAlertsCount);

        expectLater(
          alertBuilderBloc.stream,
          emitsInOrder(expectedStates),
        );

        alertBuilderBloc.add(const AlertBuilderEvent.load(pair: idPair));
      });

      test('emits [inProgress, error] when fails', () async {
        final error = Strings.sa_error_unexpected;
        // final expectedStates = [
        //   const AlertBuilderState.inProgress(),
        //   AlertBuilderState.error(
        //     message: Strings.sa_error_unexpected,
        //     alerts: Alerts([]),
        //   ),
        // ];

        alertRepository = MockAlertsRepository();
        when(alertRepository.alertsNotifier).thenReturn(ValueNotifier([]));
        when(alertRepository.isInitialize()).thenReturn(true);
        when(alertRepository.loadAlerts(idPair, 6)).thenThrow(error);
        alertBuilderBloc = AlertBuilderBloc(
            repository: alertRepository, maxAlertsCount: maxAlertsCount);

        final stream = alertBuilderBloc.stream;
        //Invalid argument потому что был вызов ArgumentError
        stream.listen((event) {
          if (event.toString().contains('AlertBuilderState.error')) {
            expect(event.toString().contains('LOAD_ALERTS'), true);
          }
        });
        alertBuilderBloc.add(const AlertBuilderEvent.load(pair: idPair));
      });
    });

    group('remove', () {
      final alert =
          PriceAlert(id: 'test_id', value: 10.0, comment: 'test comment');

      test('emits [inProgress, successful] when successful', () async {
        final expectedStates = [
          const AlertBuilderState.inProgress(),
          AlertBuilderState.successful(alerts: Alerts([])),
        ];

        alertRepository = MockAlertRepositoryImpl([]);
        when(alertRepository.alertsNotifier).thenReturn(ValueNotifier([]));
        when(alertRepository.isInitialize()).thenReturn(true);
        alertBuilderBloc = AlertBuilderBloc(
            repository: alertRepository, maxAlertsCount: maxAlertsCount);

        expectLater(
          alertBuilderBloc.stream,
          emitsInOrder(expectedStates),
        );

        alertBuilderBloc.add(AlertBuilderEvent.remove(alert: alert));
      });

      test('emits [inProgress, error] when fails', () async {
        alertRepository = MockAlertsRepository();
        when(alertRepository.alertsNotifier).thenReturn(ValueNotifier([]));
        when(alertRepository.removeAlert(alert))
            .thenThrow(Strings.sa_error_unexpected);
        alertBuilderBloc = AlertBuilderBloc(
            repository: alertRepository, maxAlertsCount: maxAlertsCount);

        final stream = alertBuilderBloc.stream;
        stream.listen((event) {
          if (event.toString().contains('AlertBuilderState.error')) {
            expect(event.toString().contains('REMOVE_ALERT'), true);
          }
        });

        alertBuilderBloc.add(AlertBuilderEvent.remove(alert: alert));
      });
    });

    group('removeAll', () {
      const idPair = 'test_id_pair';
      final expectedStates = [
        const AlertBuilderState.inProgress(),
        AlertBuilderState.successful(alerts: Alerts([])),
      ];

      test('emits [inProgress, successful] when successful', () async {
        alertBuilderBloc = AlertBuilderBloc(
            repository: alertRepository, maxAlertsCount: maxAlertsCount);

        expectLater(
          alertBuilderBloc.stream,
          emitsInOrder(expectedStates),
        );

        alertBuilderBloc.add(const AlertBuilderEvent.removeAll(pair: idPair));
      });

      test('emits [inProgress, error] when fails', () async {
        const idPair = 'test_id_pair';
        alertRepository = MockAlertsRepository();
        when(alertRepository.deleteAllAlerts())
            .thenThrow(Strings.sa_error_unexpected);
        when(alertRepository.alertsNotifier).thenReturn(ValueNotifier([]));
        alertBuilderBloc = AlertBuilderBloc(
            repository: alertRepository, maxAlertsCount: maxAlertsCount);

        final stream = alertBuilderBloc.stream;
        stream.listen((event) {
          if (event.toString().contains('AlertBuilderState.error')) {
            expect(event.toString().contains('REMOVE_ALL_ALERTS'), true);
          }
        });
        alertBuilderBloc.add(const AlertBuilderEvent.removeAll(pair: idPair));
      });
    });
  });
}
