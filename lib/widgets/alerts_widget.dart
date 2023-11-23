import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foundation/foundation.dart';
import 'package:localbroadcast/localbroadcast.dart';
import 'package:localization_helper/localization.dart';
import 'package:server_alerts/bloc/alert_builder_bloc.dart';
import 'package:server_alerts/bloc/app_bloc_observer.dart';
import 'package:server_alerts/generated/assets/image.g.dart';
import 'package:server_alerts/generated/strings/strings_consts.g.dart';
import 'package:server_alerts/consts.dart';
import 'package:server_alerts/models/alert.dart';
import 'package:server_alerts/repository/alert_repository.dart';
import 'package:server_alerts/utils/text_edit_span.dart';
import 'package:server_alerts/widgets/theme.dart';
import 'package:widgets/widgets.dart';

const int minPercent = -100;

class AlertsWidget extends StatefulWidget {
  final AlertsTheme theme;
  final PricedPair pair;
  final AlertsRepository alertsRepository;

  final int maxCountAlerts;

  final TextInputType textInputType;
  final AlertsListener? eventsListener;

  const AlertsWidget({
    super.key,
    required this.pair,
    required this.alertsRepository,
    this.theme = const AlertsTheme(),
    this.maxCountAlerts = 6,
    this.eventsListener,
    this.textInputType = const TextInputType.numberWithOptions(
      decimal: true,
    ),
  });

  @override
  State<StatefulWidget> createState() => _AlertsWidgetState();
}

class _AlertsWidgetState extends State<AlertsWidget> {
  late final PriceTextEditingController _controllerValue;
  late final PercentTextEditingController _controllerPercent;

  final _controllerComment = TextEditingController();
  late final digits = widget.pair.digits.toFractionalDigits();

  @override
  void initState() {
    super.initState();
    widget.eventsListener?.onStarted();
    widget.alertsRepository.initialize();
    _controllerValue = PriceTextEditingController(
        wholeStyle: widget.theme.inputWholeTextStyle,
        fractionalStyle: widget.theme.inputDecimalTextStyle);
    _controllerValue.text = widget.pair.lastPrice.toStringAsFixed(digits);
    _controllerValue.addListener(_valueListener);

    _controllerPercent = PercentTextEditingController(
      theme: widget.theme.percentTextInputTheme,
    );
    _controllerPercent.addListener(_percentListener);
  }

  void _percentListener() {
    _controllerValue.removeListener(_valueListener);
    final text = _controllerPercent.text
        .replaceAll(',', '.')
        .replaceAll(RegExp(r'(?<=\d)[%]|[%](?=\d)'), '');

    if (text.contains(".") && text.lastIndexOf(".") != text.indexOf(".")) {
      // Если текст содержит более одной точки, удаляем последнюю введенную точку
      final newCursorPosition = text.length - 1;
      _controllerPercent.value = _controllerPercent.value.copyWith(
        text: text.substring(0, text.length - 1),
        selection:
            TextSelection.fromPosition(TextPosition(offset: newCursorPosition)),
      );
    }
    final param = text.toDefaultNumbers();
    final percentValue = double.tryParse(param);

    if (percentValue != null) {
      final value = _valuePercent(percentValue);
      _controllerValue.text = value.toStringAsFixed(digits);
    }

    if (percentValue != null) {
      String sign = '';
      if (!(text.startsWith("+") || text.startsWith("-"))) {
        sign = percentValue >= 0 ? "+" : "-";
      }

      String newText = text;
      final position = _controllerPercent.selection.baseOffset;
      newText = newText.substring(0, position < 0 ? newText.length : position);
      newText = '$sign$newText';
      _controllerPercent.value = TextEditingValue(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length),
      );
    }
    _controllerValue.addListener(_valueListener);
  }

  void _valueListener() {
    _controllerPercent.removeListener(_percentListener);
    final value = double.tryParse(_controllerValue.value.text);
    final percent = _percentValue(value ?? 0);
    final val = percent.toStringAsFixed(2);
    _controllerPercent.text = percent > 0 ? "+$val" : val;
    _controllerPercent.addListener(_percentListener);
  }

  double _valuePercent(double percent) {
    final price = widget.pair.lastPrice;
    final value = price + ((price * percent) / 100);
    return value.isNaN ? 0.0 : value;
  }

  double _percentValue(double value) {
    final percentValue = ((value / widget.pair.lastPrice) * 100) - 100;
    return percentValue.isNaN ? 0.0 : percentValue.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.eventsListener is BlocObserver) {
      Bloc.observer = widget.eventsListener as BlocObserver;
    }

    return BlocProvider(
      create: (_) => AlertBuilderBloc(
        repository: widget.alertsRepository,
        maxAlertsCount: widget.maxCountAlerts,
      ),
      child: BlocBuilder<AlertBuilderBloc, AlertBuilderState>(
        builder: (context, state) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                child: Container(
                  height: 58,
                  decoration: widget.theme.pairDecoration,
                  child: Row(
                    children: [
                      const SizedBox(width: 14.0),
                      SizedBox(
                        height: 26,
                        width: 26,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: DynamicImageEx(
                            path: widget.pair.icon ?? '',
                            fit: BoxFit.fill,
                            placeholder: Image.asset(ImageAssets.sa_plh_pair),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: AutoSizeText(
                          widget.pair.title.toString(),
                          maxLines: 1,
                          minFontSize: 12,
                          style: widget.theme.pairTextStyle,
                        ),
                      ),
                      const Spacer(),
                      AnimatedBuilder(
                        animation: widget.pair,
                        builder: (_, __) => AutoSizeText(
                          widget.pair.lastPrice.toStringAsFixed(digits),
                          style: widget.theme.priceTextStyle,
                        ),
                      ),
                      const SizedBox(width: 14.0),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 42.0),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22.0),
                  child: _viewAlerts(context, state),
                ),
              ),
              const SizedBox(height: 42.0),
              _viewControl(state, widget.theme, context),
            ],
          );
        },
      ),
    );
  }

  Widget _viewControl(
      AlertBuilderState state, AlertsTheme theme, BuildContext context) {
    final subtitleTextStyle = theme.subtitleTextStyle;

    return Container(
      decoration: theme.inputAreaDecoration,
      child: Column(
        children: [
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              children: [
                const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 20.0,
                ),
                const SizedBox(width: 10),
                Text(
                  Strings.sa_new_notice,
                  style: subtitleTextStyle,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              children: [
                _PercentageButton(
                  theme: theme,
                  value: -10,
                  onTap: (value) => _onFastPercentTap(context, value),
                ),
                const SizedBox(width: 10),
                _PercentageButton(
                  theme: theme,
                  value: -5,
                  onTap: (value) => _onFastPercentTap(context, value),
                ),
                const SizedBox(width: 10),
                _PercentageButton(
                  theme: theme,
                  value: 5,
                  onTap: (value) => _onFastPercentTap(context, value),
                ),
                const SizedBox(width: 10),
                _PercentageButton(
                  theme: theme,
                  value: 10,
                  onTap: (value) => _onFastPercentTap(context, value),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Strings.sa_price,
                        style: theme.labelTextStyle,
                      ),
                      const SizedBox(height: 6),
                      TextField(
                        controller: _controllerValue,
                        decoration: theme.inputDecoration,
                        style: theme.inputTextStyle,
                        textAlign: TextAlign.start,
                        keyboardType: widget.textInputType,
                        onChanged: (_) {
                          context.read<AlertBuilderBloc>().add(
                                AlertBuilderEvent.changeValue(
                                  value: _controllerValue.text,
                                ),
                              );
                        },
                        inputFormatters: [
                          // заменяет запятые на точки для разделителя дробной части
                          CommaTextInputFormatter(),
                          // запрет ввода любых симxволов кроме чисел (в масиве храняться числа нескольких видов) и .
                          FilteringTextInputFormatter.allow(
                              RegExpBuilder.instance.localizedNumbers()),
                          // // ограничение количества символов после точки
                          FilteringTextInputFormatter.allow(RegExpBuilder
                              .instance
                              .localizedFractional(digits)),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 24),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Strings.sa_price_change,
                        style: theme.labelTextStyle,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      TextField(
                        controller: _controllerPercent,
                        decoration: theme.inputDecoration,
                        inputFormatters: [
                          // заменяет запятые на точки для разделителя дробной части
                          CommaTextInputFormatter(),
                          TextInputFormatter.withFunction((oldValue, newValue) {
                            // Разрешить вводить отрицательное число, если оно начинается с "-"
                            if (newValue.text.startsWith('-')) {
                              if (newValue.text.contains(' ') ||
                                  newValue.text.contains('-', 1)) {
                                return oldValue;
                              }
                              if (newValue.text.isNotEmpty) {
                                final parsedValue =
                                    double.tryParse(newValue.text);
                                if (parsedValue != null &&
                                    parsedValue < minPercent) {
                                  // Значение превышает -100, поэтому вернем предыдущее значение
                                  return oldValue;
                                }
                              }
                              return newValue;
                            }
                            if (newValue.text.contains(' ') ||
                                newValue.text.contains('-')) {
                              return oldValue;
                            }
                            return newValue;
                          })
                        ],
                        onChanged: (_) {
                          context.read<AlertBuilderBloc>().add(
                                AlertBuilderEvent.changeValue(
                                  value: _controllerValue.text,
                                ),
                              );
                        },
                        textAlign: TextAlign.start,
                        keyboardType: widget.textInputType,
                        style: theme.percentTextInputTheme.textStyle,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: _commentWidget(theme),
          ),
          const SizedBox(height: 36),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child:
                state.whenOrNull(error: (alerts, message, request, error, _) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(message, style: theme.errorTextStyle),
                      );
                    }) ??
                    const SizedBox.shrink(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: _buildButton(context, theme, state),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _commentWidget(AlertsTheme theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Strings.sa_comment,
          style: theme.labelTextStyle,
        ),
        const SizedBox(height: 6),
        TextField(
          controller: _controllerComment,
          decoration: theme.inputDecoration.copyWith(
            hintText: Strings.sa_comment_notify,
            hintStyle: theme.inputHintTextStyle,
          ),
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }

  void _onFastPercentTap(BuildContext context, int value) {
    final price = _controllerPercent.percent + value;
    if (price > minPercent) {
      final val = price < minPercent ? minPercent.toString() : price.toString();

      _controllerPercent.text = val;
      context.read<AlertBuilderBloc>().add(
            AlertBuilderEvent.changeValue(
              value: value.toString(),
            ),
          );
    }
  }

  Widget _buildButton(
      BuildContext context, AlertsTheme theme, AlertBuilderState state) {
    bool show = widget.alertsRepository.isInitialize();
    show = state.maybeWhen(
        error: (alerts, message, request, error, _) {
          return false;
        },
        orElse: () => show);

    return ElevatedButton(
      onPressed: show ? () => _onCreateTap(context) : null,
      style: theme.actionButton,
      child: Text(
        Strings.sa_add_notice,
      ),
    );
  }

  Widget _viewAlerts(BuildContext context, AlertBuilderState state) =>
      state.whenOrNull(
        initial: () {
          context.read<AlertBuilderBloc>().add(
                AlertBuilderEvent.load(
                  pair: widget.pair.uri,
                ),
              );
          return const JumpingDots(color: Colors.white);
        },
        successful: (alerts) => _buildChipList(context, alerts.list ?? []),
        error: (alerts, message, request, error, _) =>
            _buildChipList(context, alerts.list ?? []),
        inProgress: () => const JumpingDots(color: Colors.white),
      ) ??
      const SizedBox.shrink();

  Widget _buildChipList(BuildContext context, List<PriceAlert> alerts) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = (constraints.maxWidth - 6) / (context.isPhone ? 2 : 3);
        final widgets = alerts
            .map(
              (alert) => ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxWidth),
                child: _buildChip(context, alert),
              ),
            )
            .toList();

        return Wrap(
          spacing: 6.0,
          runSpacing: 6.0,
          alignment: WrapAlignment.start,
          children: widgets,
        );
      },
    );
  }

  Widget _buildChip(BuildContext context, PriceAlert alert) {
    final theme = widget.theme;

    return Container(
      decoration: theme.alertItemBackground,
      constraints: const BoxConstraints(minHeight: 48.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(width: 12.0),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Image.asset(
              ImageAssets.sa_notif,
              width: 20,
              height: 20,
            ),
          ),
          const SizedBox(width: 10),
          Flexible(
            fit: FlexFit.loose,
            child: FundsWidget(
              Funds(amount: alert.value, fractionDigits: digits),
              style: FundsWidgetStyle(
                isSigned: false,
                symbolPosition: SymbolPosition.none,
                integerPartStyle: theme.alertItemWholeTextStyle,
                decimalPartStyle: theme.alertItemDecimalTextStyle,
                decimalSeparatorStyle: theme.alertItemDecimalTextStyle,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Container(
            width: 1.0,
            height: 48.0,
            color: theme.alertItemDividerColor,
          ),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => _onRemoveTap(context, alert),
            child: Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(10.0, 12.0, 12.0, 12.0),
              child: Image.asset(
                ImageAssets.sa_garbage,
                width: 20,
                height: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controllerComment.dispose();
    _controllerPercent.dispose();
    _controllerValue.dispose();
    super.dispose();
  }

  void _onCreateTap(BuildContext context) {
    final value = double.parse(_controllerValue.text);
    if (value > 0) {
      context.read<AlertBuilderBloc>().add(
            AlertBuilderEvent.create(
              pair: widget.pair.uri,
              targetPrice: value,
              currentPrice: widget.pair.lastPrice,
              comment: _controllerComment.text,
            ),
          );
    }
  }

  void _onRemoveTap(BuildContext context, PriceAlert alert) {
    LocalBroadcast.instance.send(AlertsEvents.PRICE_ALERT_REMOVED, null);

    context
        .read<AlertBuilderBloc>()
        .add(AlertBuilderEvent.remove(alert: alert));
  }
}

class _PercentageButton extends StatelessWidget {
  final AlertsTheme theme;
  final int value;

  final Function(int value)? onTap;

  const _PercentageButton({
    required this.value,
    this.theme = const AlertsTheme(),
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => onTap?.call(value),
      child: SizedBox(
        width: 48.0,
        height: 48.0,
        child: Center(
          child: Container(
            width: 40.0,
            height: 40.0,
            alignment: Alignment.center,
            decoration: theme.fastButtonDecoration,
            child: Text(
              (value >= 0 ? '+ $value%' : '- ${value * -1}%').toLocalNumbers(),
              style: theme.fastButtonTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}
