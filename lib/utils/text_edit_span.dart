import 'package:flutter/material.dart';
import 'package:localization_helper/localization.dart';
import 'package:server_alerts/widgets/theme.dart';

class PriceTextEditingController extends TextEditingController {
  final TextStyle wholeStyle;
  final TextStyle fractionalStyle;

  PriceTextEditingController({
    required this.wholeStyle,
    required this.fractionalStyle,
  });

  @override
  TextSpan buildTextSpan({
    required BuildContext context,
    TextStyle? style,
    required bool withComposing,
  }) {
    final spans = <InlineSpan>[];
    final parts = text.split('.');
    final wholeSpan =
        TextSpan(text: parts[0].toLocalNumbers(), style: wholeStyle);
    spans.add(wholeSpan);

    if (parts.length > 1) {
      final decimalSpan = TextSpan(
        text: '.${parts[1].toLocalNumbers()}',
        style: fractionalStyle,
      );
      spans.add(decimalSpan);
    }

    return TextSpan(
      children: spans,
      style: style,
    );
  }
}

class PercentTextEditingController extends TextEditingController {
  final PercentTextInputTheme theme;

  double _percent = 0.0;

  PercentTextEditingController({
    super.text,
    this.theme = const PercentTextInputTheme(),
  });

  @override
  TextSpan buildTextSpan({
    required BuildContext context,
    TextStyle? style,
    required bool withComposing,
  }) {
    /// Удаляем все символы, кроме цифр, точки и запятой
    final numbersOnly = text
        .toDefaultNumbers()
        .replaceAll(',', '.')
        .replaceAll(RegExp(r'(?<=\d)[%]|[%](?=\d)'), '');

    _percent = 0.0;
    if (numbersOnly.isNotEmpty) {
      _percent = double.tryParse(numbersOnly) ?? 0.0;
    }

    final Color color;
    if (percent > 0) {
      color = theme.textColorPositive;
    } else {
      if (percent == 0) {
        color = theme.textColorNeutral;
      } else {
        color = theme.textColorNegative;
      }
    }

    return TextSpan(
      text: (text.isEmpty ? '0 %' : '$text %').toLocalNumbers(),
      style: style?.copyWith(color: color),
    );
  }

  double get percent => _percent;
}
