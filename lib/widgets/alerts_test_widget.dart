import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foundation/foundation.dart';
import 'package:server_alerts/bloc/alert_builder_bloc.dart';
import 'package:server_alerts/repository/alert_repository.dart';
import 'package:server_alerts/widgets/theme.dart';

class AlertsTestWidget extends StatefulWidget {
  final double value;
  final Pair pair;
  final AlertsRepository alertRepository;
  final int? maxAlertsCount;
  final AlertsTheme theme;

  const AlertsTestWidget({
    super.key,
    this.maxAlertsCount,
    required this.alertRepository,
    required this.pair,
    required this.value,
    this.theme = const AlertsTheme(),
  });

  @override
  State<StatefulWidget> createState() => _AlertsTestWidgetState();
}

class _AlertsTestWidgetState extends State<AlertsTestWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = widget.theme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: BlocProvider(
        create: (_) => AlertBuilderBloc(
            repository: widget.alertRepository,
            maxAlertsCount: widget.maxAlertsCount ?? 0),
        child: BlocBuilder<AlertBuilderBloc, AlertBuilderState>(
          builder: (context, state) {
            final show = widget.alertRepository.isInitialize();

            return Column(
              children: [
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: show ? () => _generateTestAlerts(context) : null,
                  style: theme.actionButton,
                  child: const Text(
                    'Набор тестовых алертов',
                  ),
                ),
                const SizedBox(height: 12.0),
                ElevatedButton(
                  onPressed: show ? () => _removeAllAlerts(context) : null,
                  style: theme.actionButton,
                  child: const Text(
                    'Удалить все алерты',
                  ),
                ),
                const SizedBox(height: 16.0),
              ],
            );
          },
        ),
      ),
    );
  }

  void _generateTestAlerts(BuildContext context) {
    final uri = widget.pair.uri;
    final currentPrice = widget.value;
    final bloc = context.read<AlertBuilderBloc>();

    for (int i = 1; i <= 20; i++) {
      final percentage = i.toDouble(); // процент изменения цены

      // расчет новых цен
      final decreasePrice = currentPrice * (1 - percentage / 100);
      final increasePrice = currentPrice * (1 + percentage / 100);

      bloc.add(AlertBuilderEvent.create(
        pair: uri,
        targetPrice: decreasePrice,
        currentPrice: currentPrice,
        comment: 'For test',
      ));
      bloc.add(AlertBuilderEvent.create(
        pair: uri,
        targetPrice: increasePrice,
        currentPrice: currentPrice,
        comment: 'For test',
      ));
    }
  }

  void _removeAllAlerts(BuildContext context) {
    context.read<AlertBuilderBloc>().add(
          AlertBuilderEvent.removeAll(pair: widget.pair.uri),
        );
  }
}
