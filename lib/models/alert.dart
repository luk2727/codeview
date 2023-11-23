import 'package:freezed_annotation/freezed_annotation.dart';

part 'alert.freezed.dart';

@freezed
class PriceAlert with _$PriceAlert {
  factory PriceAlert({
    String? id,
    required double value,
    String? comment,
  }) = _PriceAlert;
}
