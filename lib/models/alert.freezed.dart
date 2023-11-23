// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'alert.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PriceAlert {
  String? get id => throw _privateConstructorUsedError;
  double get value => throw _privateConstructorUsedError;
  String? get comment => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PriceAlertCopyWith<PriceAlert> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceAlertCopyWith<$Res> {
  factory $PriceAlertCopyWith(
          PriceAlert value, $Res Function(PriceAlert) then) =
      _$PriceAlertCopyWithImpl<$Res, PriceAlert>;
  @useResult
  $Res call({String? id, double value, String? comment});
}

/// @nodoc
class _$PriceAlertCopyWithImpl<$Res, $Val extends PriceAlert>
    implements $PriceAlertCopyWith<$Res> {
  _$PriceAlertCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? value = null,
    Object? comment = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PriceAlertImplCopyWith<$Res>
    implements $PriceAlertCopyWith<$Res> {
  factory _$$PriceAlertImplCopyWith(
          _$PriceAlertImpl value, $Res Function(_$PriceAlertImpl) then) =
      __$$PriceAlertImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, double value, String? comment});
}

/// @nodoc
class __$$PriceAlertImplCopyWithImpl<$Res>
    extends _$PriceAlertCopyWithImpl<$Res, _$PriceAlertImpl>
    implements _$$PriceAlertImplCopyWith<$Res> {
  __$$PriceAlertImplCopyWithImpl(
      _$PriceAlertImpl _value, $Res Function(_$PriceAlertImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? value = null,
    Object? comment = freezed,
  }) {
    return _then(_$PriceAlertImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$PriceAlertImpl implements _PriceAlert {
  _$PriceAlertImpl({this.id, required this.value, this.comment});

  @override
  final String? id;
  @override
  final double value;
  @override
  final String? comment;

  @override
  String toString() {
    return 'PriceAlert(id: $id, value: $value, comment: $comment)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PriceAlertImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.comment, comment) || other.comment == comment));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, value, comment);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PriceAlertImplCopyWith<_$PriceAlertImpl> get copyWith =>
      __$$PriceAlertImplCopyWithImpl<_$PriceAlertImpl>(this, _$identity);
}

abstract class _PriceAlert implements PriceAlert {
  factory _PriceAlert(
      {final String? id,
      required final double value,
      final String? comment}) = _$PriceAlertImpl;

  @override
  String? get id;
  @override
  double get value;
  @override
  String? get comment;
  @override
  @JsonKey(ignore: true)
  _$$PriceAlertImplCopyWith<_$PriceAlertImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
