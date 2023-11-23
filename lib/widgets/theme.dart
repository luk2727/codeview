import 'package:flutter/material.dart';

///настройка виджета для алертов
class AlertsTheme {
  /// Стили виджета пары
  final BoxDecoration? pairDecoration;
  final TextStyle pairTextStyle;
  final TextStyle priceTextStyle;

  final BoxDecoration alertItemBackground;
  final Color alertItemDividerColor;
  final TextStyle alertItemWholeTextStyle;
  final TextStyle alertItemDecimalTextStyle;

  final TextStyle subtitleTextStyle;
  final TextStyle labelTextStyle;
  final TextStyle errorTextStyle;

  ///стили для кнопок быстрого изменения процента
  final BoxDecoration fastButtonDecoration;
  final TextStyle fastButtonTextStyle;

  final BoxDecoration inputAreaDecoration;
  final InputDecoration inputDecoration;
  final TextStyle inputTextStyle;
  final TextStyle inputHintTextStyle;

  /// Стили для полей ввода цены
  final TextStyle inputWholeTextStyle;
  final TextStyle inputDecimalTextStyle;

  final PercentTextInputTheme percentTextInputTheme;

  ///настройки для кнопки
  final Color actionButtonColor;
  final TextStyle actionButtonTextStyle;
  final BorderRadius actionButtonBorderRadius;
  final EdgeInsetsGeometry actionButtonPadding;

  const AlertsTheme({
    this.pairDecoration = const BoxDecoration(
      color: Color(0xFF122736),
      borderRadius: BorderRadius.all(Radius.circular(12.0)),
    ),
    this.pairTextStyle = const TextStyle(
      color: Color(0xFFFFFFFF),
      fontSize: 16,
      fontWeight: FontWeight.w700,
    ),
    this.priceTextStyle = const TextStyle(
      color: Color(0xFFFFFFFF),
      fontSize: 16,
    ),
    this.alertItemBackground = const BoxDecoration(
      color: Color(0xFF122736),
      borderRadius: BorderRadius.all(Radius.circular(12.0)),
    ),
    this.alertItemDividerColor = const Color(0xFF31424F),
    this.alertItemWholeTextStyle = const TextStyle(
      color: Color(0xFFFFFFFF),
    ),
    this.alertItemDecimalTextStyle = const TextStyle(
      color: Color(0xFF9495AB),
      fontWeight: FontWeight.w500,
    ),
    this.subtitleTextStyle = const TextStyle(
      color: Color(0xFFFFFFFF),
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    this.labelTextStyle = const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w300,
      color: Color(0x99FFFFFF),
    ),
    this.errorTextStyle = const TextStyle(
      fontSize: 12,
      color: Color(0xFFDE3503),
    ),
    this.fastButtonDecoration = const BoxDecoration(
      shape: BoxShape.circle,
      color: Color(0xFF1C3649),
    ),
    this.fastButtonTextStyle = const TextStyle(
      color: Color(0xFFFFFFFF),
      fontWeight: FontWeight.w500,
      fontSize: 11,
    ),
    this.inputAreaDecoration = const BoxDecoration(
      color: Color(0xFF122736),
    ),
    this.inputWholeTextStyle = const TextStyle(
      fontSize: 14,
      color: Color(0xFFFFFFFF),
    ),
    this.inputDecimalTextStyle = const TextStyle(
      fontSize: 14,
      color: Color(0xFF9094AB),
    ),
    this.inputDecoration = const InputDecoration(
      filled: true,
      fillColor: Color(0xFF091E29),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xFF104352),
        ),
      ),
    ),
    this.inputTextStyle = const TextStyle(
      fontSize: 14,
      color: Color(0xFFFFFFFF),
      fontWeight: FontWeight.w400,
    ),
    this.inputHintTextStyle = const TextStyle(
      fontSize: 14,
      fontStyle: FontStyle.italic,
      color: Color(0x4DFFFFFF),
    ),
    this.percentTextInputTheme = const PercentTextInputTheme(),
    this.actionButtonPadding = const EdgeInsets.symmetric(
      vertical: 16.0,
      horizontal: 24.0,
    ),
    this.actionButtonBorderRadius = const BorderRadius.all(
      Radius.circular(10.0),
    ),
    this.actionButtonColor = const Color(0xFF269240),
    this.actionButtonTextStyle = const TextStyle(
      fontSize: 16.0,
      color: Color(0xFFFFFFFF),
      fontWeight: FontWeight.w500,
    ),
  });

  ButtonStyle get actionButton => ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 48.0),
        padding: actionButtonPadding,
        backgroundColor: actionButtonColor,
        disabledBackgroundColor: actionButtonColor.withOpacity(0.4),
        shape: RoundedRectangleBorder(
          borderRadius: actionButtonBorderRadius,
        ),
        textStyle: actionButtonTextStyle,
      );
}

class PercentTextInputTheme {
  final TextStyle textStyle;

  final Color textColorPositive;
  final Color textColorNegative;
  final Color textColorNeutral;

  const PercentTextInputTheme({
    this.textStyle = const TextStyle(
      color: Color(0xFFFFFFFF),
      fontWeight: FontWeight.w500,
      fontSize: 14.0,
    ),
    this.textColorPositive = const Color(0xFF2D912D),
    this.textColorNegative = const Color(0xFFDE3503),
    this.textColorNeutral = const Color(0xFFFFFFFF),
  });
}
