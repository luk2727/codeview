// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'alerts.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Alerts {
  List<PriceAlert>? get list => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AlertsCopyWith<Alerts> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlertsCopyWith<$Res> {
  factory $AlertsCopyWith(Alerts value, $Res Function(Alerts) then) =
      _$AlertsCopyWithImpl<$Res, Alerts>;
  @useResult
  $Res call({List<PriceAlert>? list});
}

/// @nodoc
class _$AlertsCopyWithImpl<$Res, $Val extends Alerts>
    implements $AlertsCopyWith<$Res> {
  _$AlertsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = freezed,
  }) {
    return _then(_value.copyWith(
      list: freezed == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<PriceAlert>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AlertsImplCopyWith<$Res> implements $AlertsCopyWith<$Res> {
  factory _$$AlertsImplCopyWith(
          _$AlertsImpl value, $Res Function(_$AlertsImpl) then) =
      __$$AlertsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<PriceAlert>? list});
}

/// @nodoc
class __$$AlertsImplCopyWithImpl<$Res>
    extends _$AlertsCopyWithImpl<$Res, _$AlertsImpl>
    implements _$$AlertsImplCopyWith<$Res> {
  __$$AlertsImplCopyWithImpl(
      _$AlertsImpl _value, $Res Function(_$AlertsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = freezed,
  }) {
    return _then(_$AlertsImpl(
      freezed == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<PriceAlert>?,
    ));
  }
}

/// @nodoc

class _$AlertsImpl implements _Alerts {
  _$AlertsImpl(this.list);

  @override
  final List<PriceAlert>? list;

  @override
  String toString() {
    return 'Alerts(list: $list)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlertsImpl &&
            const DeepCollectionEquality().equals(other.list, list));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(list));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AlertsImplCopyWith<_$AlertsImpl> get copyWith =>
      __$$AlertsImplCopyWithImpl<_$AlertsImpl>(this, _$identity);
}

abstract class _Alerts implements Alerts {
  factory _Alerts(final List<PriceAlert>? list) = _$AlertsImpl;

  @override
  List<PriceAlert>? get list;
  @override
  @JsonKey(ignore: true)
  _$$AlertsImplCopyWith<_$AlertsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
