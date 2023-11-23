// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'alert_builder_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AlertBuilderEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String pair, double currentPrice,
            double targetPrice, String? comment)
        create,
    required TResult Function(String pair) load,
    required TResult Function(String value) changeValue,
    required TResult Function(PriceAlert alert) remove,
    required TResult Function(String pair) removeAll,
    required TResult Function(Alerts alerts) update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String pair, double currentPrice, double targetPrice,
            String? comment)?
        create,
    TResult? Function(String pair)? load,
    TResult? Function(String value)? changeValue,
    TResult? Function(PriceAlert alert)? remove,
    TResult? Function(String pair)? removeAll,
    TResult? Function(Alerts alerts)? update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String pair, double currentPrice, double targetPrice,
            String? comment)?
        create,
    TResult Function(String pair)? load,
    TResult Function(String value)? changeValue,
    TResult Function(PriceAlert alert)? remove,
    TResult Function(String pair)? removeAll,
    TResult Function(Alerts alerts)? update,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateAlert value) create,
    required TResult Function(_LoadAlert value) load,
    required TResult Function(_ChangeValue value) changeValue,
    required TResult Function(_RemoveAlert value) remove,
    required TResult Function(_RemoveAllAlert value) removeAll,
    required TResult Function(_UpdateAlerts value) update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreateAlert value)? create,
    TResult? Function(_LoadAlert value)? load,
    TResult? Function(_ChangeValue value)? changeValue,
    TResult? Function(_RemoveAlert value)? remove,
    TResult? Function(_RemoveAllAlert value)? removeAll,
    TResult? Function(_UpdateAlerts value)? update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateAlert value)? create,
    TResult Function(_LoadAlert value)? load,
    TResult Function(_ChangeValue value)? changeValue,
    TResult Function(_RemoveAlert value)? remove,
    TResult Function(_RemoveAllAlert value)? removeAll,
    TResult Function(_UpdateAlerts value)? update,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlertBuilderEventCopyWith<$Res> {
  factory $AlertBuilderEventCopyWith(
          AlertBuilderEvent value, $Res Function(AlertBuilderEvent) then) =
      _$AlertBuilderEventCopyWithImpl<$Res, AlertBuilderEvent>;
}

/// @nodoc
class _$AlertBuilderEventCopyWithImpl<$Res, $Val extends AlertBuilderEvent>
    implements $AlertBuilderEventCopyWith<$Res> {
  _$AlertBuilderEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CreateAlertImplCopyWith<$Res> {
  factory _$$CreateAlertImplCopyWith(
          _$CreateAlertImpl value, $Res Function(_$CreateAlertImpl) then) =
      __$$CreateAlertImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String pair, double currentPrice, double targetPrice, String? comment});
}

/// @nodoc
class __$$CreateAlertImplCopyWithImpl<$Res>
    extends _$AlertBuilderEventCopyWithImpl<$Res, _$CreateAlertImpl>
    implements _$$CreateAlertImplCopyWith<$Res> {
  __$$CreateAlertImplCopyWithImpl(
      _$CreateAlertImpl _value, $Res Function(_$CreateAlertImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pair = null,
    Object? currentPrice = null,
    Object? targetPrice = null,
    Object? comment = freezed,
  }) {
    return _then(_$CreateAlertImpl(
      pair: null == pair
          ? _value.pair
          : pair // ignore: cast_nullable_to_non_nullable
              as String,
      currentPrice: null == currentPrice
          ? _value.currentPrice
          : currentPrice // ignore: cast_nullable_to_non_nullable
              as double,
      targetPrice: null == targetPrice
          ? _value.targetPrice
          : targetPrice // ignore: cast_nullable_to_non_nullable
              as double,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CreateAlertImpl extends _CreateAlert {
  const _$CreateAlertImpl(
      {required this.pair,
      required this.currentPrice,
      required this.targetPrice,
      this.comment})
      : super._();

  @override
  final String pair;
  @override
  final double currentPrice;
  @override
  final double targetPrice;
  @override
  final String? comment;

  @override
  String toString() {
    return 'AlertBuilderEvent.create(pair: $pair, currentPrice: $currentPrice, targetPrice: $targetPrice, comment: $comment)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateAlertImpl &&
            (identical(other.pair, pair) || other.pair == pair) &&
            (identical(other.currentPrice, currentPrice) ||
                other.currentPrice == currentPrice) &&
            (identical(other.targetPrice, targetPrice) ||
                other.targetPrice == targetPrice) &&
            (identical(other.comment, comment) || other.comment == comment));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, pair, currentPrice, targetPrice, comment);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateAlertImplCopyWith<_$CreateAlertImpl> get copyWith =>
      __$$CreateAlertImplCopyWithImpl<_$CreateAlertImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String pair, double currentPrice,
            double targetPrice, String? comment)
        create,
    required TResult Function(String pair) load,
    required TResult Function(String value) changeValue,
    required TResult Function(PriceAlert alert) remove,
    required TResult Function(String pair) removeAll,
    required TResult Function(Alerts alerts) update,
  }) {
    return create(pair, currentPrice, targetPrice, comment);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String pair, double currentPrice, double targetPrice,
            String? comment)?
        create,
    TResult? Function(String pair)? load,
    TResult? Function(String value)? changeValue,
    TResult? Function(PriceAlert alert)? remove,
    TResult? Function(String pair)? removeAll,
    TResult? Function(Alerts alerts)? update,
  }) {
    return create?.call(pair, currentPrice, targetPrice, comment);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String pair, double currentPrice, double targetPrice,
            String? comment)?
        create,
    TResult Function(String pair)? load,
    TResult Function(String value)? changeValue,
    TResult Function(PriceAlert alert)? remove,
    TResult Function(String pair)? removeAll,
    TResult Function(Alerts alerts)? update,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(pair, currentPrice, targetPrice, comment);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateAlert value) create,
    required TResult Function(_LoadAlert value) load,
    required TResult Function(_ChangeValue value) changeValue,
    required TResult Function(_RemoveAlert value) remove,
    required TResult Function(_RemoveAllAlert value) removeAll,
    required TResult Function(_UpdateAlerts value) update,
  }) {
    return create(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreateAlert value)? create,
    TResult? Function(_LoadAlert value)? load,
    TResult? Function(_ChangeValue value)? changeValue,
    TResult? Function(_RemoveAlert value)? remove,
    TResult? Function(_RemoveAllAlert value)? removeAll,
    TResult? Function(_UpdateAlerts value)? update,
  }) {
    return create?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateAlert value)? create,
    TResult Function(_LoadAlert value)? load,
    TResult Function(_ChangeValue value)? changeValue,
    TResult Function(_RemoveAlert value)? remove,
    TResult Function(_RemoveAllAlert value)? removeAll,
    TResult Function(_UpdateAlerts value)? update,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(this);
    }
    return orElse();
  }
}

abstract class _CreateAlert extends AlertBuilderEvent {
  const factory _CreateAlert(
      {required final String pair,
      required final double currentPrice,
      required final double targetPrice,
      final String? comment}) = _$CreateAlertImpl;
  const _CreateAlert._() : super._();

  String get pair;
  double get currentPrice;
  double get targetPrice;
  String? get comment;
  @JsonKey(ignore: true)
  _$$CreateAlertImplCopyWith<_$CreateAlertImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadAlertImplCopyWith<$Res> {
  factory _$$LoadAlertImplCopyWith(
          _$LoadAlertImpl value, $Res Function(_$LoadAlertImpl) then) =
      __$$LoadAlertImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String pair});
}

/// @nodoc
class __$$LoadAlertImplCopyWithImpl<$Res>
    extends _$AlertBuilderEventCopyWithImpl<$Res, _$LoadAlertImpl>
    implements _$$LoadAlertImplCopyWith<$Res> {
  __$$LoadAlertImplCopyWithImpl(
      _$LoadAlertImpl _value, $Res Function(_$LoadAlertImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pair = null,
  }) {
    return _then(_$LoadAlertImpl(
      pair: null == pair
          ? _value.pair
          : pair // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoadAlertImpl extends _LoadAlert {
  const _$LoadAlertImpl({required this.pair}) : super._();

  @override
  final String pair;

  @override
  String toString() {
    return 'AlertBuilderEvent.load(pair: $pair)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadAlertImpl &&
            (identical(other.pair, pair) || other.pair == pair));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pair);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadAlertImplCopyWith<_$LoadAlertImpl> get copyWith =>
      __$$LoadAlertImplCopyWithImpl<_$LoadAlertImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String pair, double currentPrice,
            double targetPrice, String? comment)
        create,
    required TResult Function(String pair) load,
    required TResult Function(String value) changeValue,
    required TResult Function(PriceAlert alert) remove,
    required TResult Function(String pair) removeAll,
    required TResult Function(Alerts alerts) update,
  }) {
    return load(pair);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String pair, double currentPrice, double targetPrice,
            String? comment)?
        create,
    TResult? Function(String pair)? load,
    TResult? Function(String value)? changeValue,
    TResult? Function(PriceAlert alert)? remove,
    TResult? Function(String pair)? removeAll,
    TResult? Function(Alerts alerts)? update,
  }) {
    return load?.call(pair);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String pair, double currentPrice, double targetPrice,
            String? comment)?
        create,
    TResult Function(String pair)? load,
    TResult Function(String value)? changeValue,
    TResult Function(PriceAlert alert)? remove,
    TResult Function(String pair)? removeAll,
    TResult Function(Alerts alerts)? update,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(pair);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateAlert value) create,
    required TResult Function(_LoadAlert value) load,
    required TResult Function(_ChangeValue value) changeValue,
    required TResult Function(_RemoveAlert value) remove,
    required TResult Function(_RemoveAllAlert value) removeAll,
    required TResult Function(_UpdateAlerts value) update,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreateAlert value)? create,
    TResult? Function(_LoadAlert value)? load,
    TResult? Function(_ChangeValue value)? changeValue,
    TResult? Function(_RemoveAlert value)? remove,
    TResult? Function(_RemoveAllAlert value)? removeAll,
    TResult? Function(_UpdateAlerts value)? update,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateAlert value)? create,
    TResult Function(_LoadAlert value)? load,
    TResult Function(_ChangeValue value)? changeValue,
    TResult Function(_RemoveAlert value)? remove,
    TResult Function(_RemoveAllAlert value)? removeAll,
    TResult Function(_UpdateAlerts value)? update,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class _LoadAlert extends AlertBuilderEvent {
  const factory _LoadAlert({required final String pair}) = _$LoadAlertImpl;
  const _LoadAlert._() : super._();

  String get pair;
  @JsonKey(ignore: true)
  _$$LoadAlertImplCopyWith<_$LoadAlertImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeValueImplCopyWith<$Res> {
  factory _$$ChangeValueImplCopyWith(
          _$ChangeValueImpl value, $Res Function(_$ChangeValueImpl) then) =
      __$$ChangeValueImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$ChangeValueImplCopyWithImpl<$Res>
    extends _$AlertBuilderEventCopyWithImpl<$Res, _$ChangeValueImpl>
    implements _$$ChangeValueImplCopyWith<$Res> {
  __$$ChangeValueImplCopyWithImpl(
      _$ChangeValueImpl _value, $Res Function(_$ChangeValueImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$ChangeValueImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChangeValueImpl extends _ChangeValue {
  const _$ChangeValueImpl({required this.value}) : super._();

  @override
  final String value;

  @override
  String toString() {
    return 'AlertBuilderEvent.changeValue(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeValueImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeValueImplCopyWith<_$ChangeValueImpl> get copyWith =>
      __$$ChangeValueImplCopyWithImpl<_$ChangeValueImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String pair, double currentPrice,
            double targetPrice, String? comment)
        create,
    required TResult Function(String pair) load,
    required TResult Function(String value) changeValue,
    required TResult Function(PriceAlert alert) remove,
    required TResult Function(String pair) removeAll,
    required TResult Function(Alerts alerts) update,
  }) {
    return changeValue(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String pair, double currentPrice, double targetPrice,
            String? comment)?
        create,
    TResult? Function(String pair)? load,
    TResult? Function(String value)? changeValue,
    TResult? Function(PriceAlert alert)? remove,
    TResult? Function(String pair)? removeAll,
    TResult? Function(Alerts alerts)? update,
  }) {
    return changeValue?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String pair, double currentPrice, double targetPrice,
            String? comment)?
        create,
    TResult Function(String pair)? load,
    TResult Function(String value)? changeValue,
    TResult Function(PriceAlert alert)? remove,
    TResult Function(String pair)? removeAll,
    TResult Function(Alerts alerts)? update,
    required TResult orElse(),
  }) {
    if (changeValue != null) {
      return changeValue(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateAlert value) create,
    required TResult Function(_LoadAlert value) load,
    required TResult Function(_ChangeValue value) changeValue,
    required TResult Function(_RemoveAlert value) remove,
    required TResult Function(_RemoveAllAlert value) removeAll,
    required TResult Function(_UpdateAlerts value) update,
  }) {
    return changeValue(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreateAlert value)? create,
    TResult? Function(_LoadAlert value)? load,
    TResult? Function(_ChangeValue value)? changeValue,
    TResult? Function(_RemoveAlert value)? remove,
    TResult? Function(_RemoveAllAlert value)? removeAll,
    TResult? Function(_UpdateAlerts value)? update,
  }) {
    return changeValue?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateAlert value)? create,
    TResult Function(_LoadAlert value)? load,
    TResult Function(_ChangeValue value)? changeValue,
    TResult Function(_RemoveAlert value)? remove,
    TResult Function(_RemoveAllAlert value)? removeAll,
    TResult Function(_UpdateAlerts value)? update,
    required TResult orElse(),
  }) {
    if (changeValue != null) {
      return changeValue(this);
    }
    return orElse();
  }
}

abstract class _ChangeValue extends AlertBuilderEvent {
  const factory _ChangeValue({required final String value}) = _$ChangeValueImpl;
  const _ChangeValue._() : super._();

  String get value;
  @JsonKey(ignore: true)
  _$$ChangeValueImplCopyWith<_$ChangeValueImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveAlertImplCopyWith<$Res> {
  factory _$$RemoveAlertImplCopyWith(
          _$RemoveAlertImpl value, $Res Function(_$RemoveAlertImpl) then) =
      __$$RemoveAlertImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PriceAlert alert});

  $PriceAlertCopyWith<$Res> get alert;
}

/// @nodoc
class __$$RemoveAlertImplCopyWithImpl<$Res>
    extends _$AlertBuilderEventCopyWithImpl<$Res, _$RemoveAlertImpl>
    implements _$$RemoveAlertImplCopyWith<$Res> {
  __$$RemoveAlertImplCopyWithImpl(
      _$RemoveAlertImpl _value, $Res Function(_$RemoveAlertImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? alert = null,
  }) {
    return _then(_$RemoveAlertImpl(
      alert: null == alert
          ? _value.alert
          : alert // ignore: cast_nullable_to_non_nullable
              as PriceAlert,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PriceAlertCopyWith<$Res> get alert {
    return $PriceAlertCopyWith<$Res>(_value.alert, (value) {
      return _then(_value.copyWith(alert: value));
    });
  }
}

/// @nodoc

class _$RemoveAlertImpl extends _RemoveAlert {
  const _$RemoveAlertImpl({required this.alert}) : super._();

  @override
  final PriceAlert alert;

  @override
  String toString() {
    return 'AlertBuilderEvent.remove(alert: $alert)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveAlertImpl &&
            (identical(other.alert, alert) || other.alert == alert));
  }

  @override
  int get hashCode => Object.hash(runtimeType, alert);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveAlertImplCopyWith<_$RemoveAlertImpl> get copyWith =>
      __$$RemoveAlertImplCopyWithImpl<_$RemoveAlertImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String pair, double currentPrice,
            double targetPrice, String? comment)
        create,
    required TResult Function(String pair) load,
    required TResult Function(String value) changeValue,
    required TResult Function(PriceAlert alert) remove,
    required TResult Function(String pair) removeAll,
    required TResult Function(Alerts alerts) update,
  }) {
    return remove(alert);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String pair, double currentPrice, double targetPrice,
            String? comment)?
        create,
    TResult? Function(String pair)? load,
    TResult? Function(String value)? changeValue,
    TResult? Function(PriceAlert alert)? remove,
    TResult? Function(String pair)? removeAll,
    TResult? Function(Alerts alerts)? update,
  }) {
    return remove?.call(alert);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String pair, double currentPrice, double targetPrice,
            String? comment)?
        create,
    TResult Function(String pair)? load,
    TResult Function(String value)? changeValue,
    TResult Function(PriceAlert alert)? remove,
    TResult Function(String pair)? removeAll,
    TResult Function(Alerts alerts)? update,
    required TResult orElse(),
  }) {
    if (remove != null) {
      return remove(alert);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateAlert value) create,
    required TResult Function(_LoadAlert value) load,
    required TResult Function(_ChangeValue value) changeValue,
    required TResult Function(_RemoveAlert value) remove,
    required TResult Function(_RemoveAllAlert value) removeAll,
    required TResult Function(_UpdateAlerts value) update,
  }) {
    return remove(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreateAlert value)? create,
    TResult? Function(_LoadAlert value)? load,
    TResult? Function(_ChangeValue value)? changeValue,
    TResult? Function(_RemoveAlert value)? remove,
    TResult? Function(_RemoveAllAlert value)? removeAll,
    TResult? Function(_UpdateAlerts value)? update,
  }) {
    return remove?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateAlert value)? create,
    TResult Function(_LoadAlert value)? load,
    TResult Function(_ChangeValue value)? changeValue,
    TResult Function(_RemoveAlert value)? remove,
    TResult Function(_RemoveAllAlert value)? removeAll,
    TResult Function(_UpdateAlerts value)? update,
    required TResult orElse(),
  }) {
    if (remove != null) {
      return remove(this);
    }
    return orElse();
  }
}

abstract class _RemoveAlert extends AlertBuilderEvent {
  const factory _RemoveAlert({required final PriceAlert alert}) =
      _$RemoveAlertImpl;
  const _RemoveAlert._() : super._();

  PriceAlert get alert;
  @JsonKey(ignore: true)
  _$$RemoveAlertImplCopyWith<_$RemoveAlertImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveAllAlertImplCopyWith<$Res> {
  factory _$$RemoveAllAlertImplCopyWith(_$RemoveAllAlertImpl value,
          $Res Function(_$RemoveAllAlertImpl) then) =
      __$$RemoveAllAlertImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String pair});
}

/// @nodoc
class __$$RemoveAllAlertImplCopyWithImpl<$Res>
    extends _$AlertBuilderEventCopyWithImpl<$Res, _$RemoveAllAlertImpl>
    implements _$$RemoveAllAlertImplCopyWith<$Res> {
  __$$RemoveAllAlertImplCopyWithImpl(
      _$RemoveAllAlertImpl _value, $Res Function(_$RemoveAllAlertImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pair = null,
  }) {
    return _then(_$RemoveAllAlertImpl(
      pair: null == pair
          ? _value.pair
          : pair // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RemoveAllAlertImpl extends _RemoveAllAlert {
  const _$RemoveAllAlertImpl({required this.pair}) : super._();

  @override
  final String pair;

  @override
  String toString() {
    return 'AlertBuilderEvent.removeAll(pair: $pair)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveAllAlertImpl &&
            (identical(other.pair, pair) || other.pair == pair));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pair);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveAllAlertImplCopyWith<_$RemoveAllAlertImpl> get copyWith =>
      __$$RemoveAllAlertImplCopyWithImpl<_$RemoveAllAlertImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String pair, double currentPrice,
            double targetPrice, String? comment)
        create,
    required TResult Function(String pair) load,
    required TResult Function(String value) changeValue,
    required TResult Function(PriceAlert alert) remove,
    required TResult Function(String pair) removeAll,
    required TResult Function(Alerts alerts) update,
  }) {
    return removeAll(pair);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String pair, double currentPrice, double targetPrice,
            String? comment)?
        create,
    TResult? Function(String pair)? load,
    TResult? Function(String value)? changeValue,
    TResult? Function(PriceAlert alert)? remove,
    TResult? Function(String pair)? removeAll,
    TResult? Function(Alerts alerts)? update,
  }) {
    return removeAll?.call(pair);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String pair, double currentPrice, double targetPrice,
            String? comment)?
        create,
    TResult Function(String pair)? load,
    TResult Function(String value)? changeValue,
    TResult Function(PriceAlert alert)? remove,
    TResult Function(String pair)? removeAll,
    TResult Function(Alerts alerts)? update,
    required TResult orElse(),
  }) {
    if (removeAll != null) {
      return removeAll(pair);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateAlert value) create,
    required TResult Function(_LoadAlert value) load,
    required TResult Function(_ChangeValue value) changeValue,
    required TResult Function(_RemoveAlert value) remove,
    required TResult Function(_RemoveAllAlert value) removeAll,
    required TResult Function(_UpdateAlerts value) update,
  }) {
    return removeAll(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreateAlert value)? create,
    TResult? Function(_LoadAlert value)? load,
    TResult? Function(_ChangeValue value)? changeValue,
    TResult? Function(_RemoveAlert value)? remove,
    TResult? Function(_RemoveAllAlert value)? removeAll,
    TResult? Function(_UpdateAlerts value)? update,
  }) {
    return removeAll?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateAlert value)? create,
    TResult Function(_LoadAlert value)? load,
    TResult Function(_ChangeValue value)? changeValue,
    TResult Function(_RemoveAlert value)? remove,
    TResult Function(_RemoveAllAlert value)? removeAll,
    TResult Function(_UpdateAlerts value)? update,
    required TResult orElse(),
  }) {
    if (removeAll != null) {
      return removeAll(this);
    }
    return orElse();
  }
}

abstract class _RemoveAllAlert extends AlertBuilderEvent {
  const factory _RemoveAllAlert({required final String pair}) =
      _$RemoveAllAlertImpl;
  const _RemoveAllAlert._() : super._();

  String get pair;
  @JsonKey(ignore: true)
  _$$RemoveAllAlertImplCopyWith<_$RemoveAllAlertImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateAlertsImplCopyWith<$Res> {
  factory _$$UpdateAlertsImplCopyWith(
          _$UpdateAlertsImpl value, $Res Function(_$UpdateAlertsImpl) then) =
      __$$UpdateAlertsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Alerts alerts});

  $AlertsCopyWith<$Res> get alerts;
}

/// @nodoc
class __$$UpdateAlertsImplCopyWithImpl<$Res>
    extends _$AlertBuilderEventCopyWithImpl<$Res, _$UpdateAlertsImpl>
    implements _$$UpdateAlertsImplCopyWith<$Res> {
  __$$UpdateAlertsImplCopyWithImpl(
      _$UpdateAlertsImpl _value, $Res Function(_$UpdateAlertsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? alerts = null,
  }) {
    return _then(_$UpdateAlertsImpl(
      alerts: null == alerts
          ? _value.alerts
          : alerts // ignore: cast_nullable_to_non_nullable
              as Alerts,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $AlertsCopyWith<$Res> get alerts {
    return $AlertsCopyWith<$Res>(_value.alerts, (value) {
      return _then(_value.copyWith(alerts: value));
    });
  }
}

/// @nodoc

class _$UpdateAlertsImpl extends _UpdateAlerts {
  const _$UpdateAlertsImpl({required this.alerts}) : super._();

  @override
  final Alerts alerts;

  @override
  String toString() {
    return 'AlertBuilderEvent.update(alerts: $alerts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateAlertsImpl &&
            (identical(other.alerts, alerts) || other.alerts == alerts));
  }

  @override
  int get hashCode => Object.hash(runtimeType, alerts);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateAlertsImplCopyWith<_$UpdateAlertsImpl> get copyWith =>
      __$$UpdateAlertsImplCopyWithImpl<_$UpdateAlertsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String pair, double currentPrice,
            double targetPrice, String? comment)
        create,
    required TResult Function(String pair) load,
    required TResult Function(String value) changeValue,
    required TResult Function(PriceAlert alert) remove,
    required TResult Function(String pair) removeAll,
    required TResult Function(Alerts alerts) update,
  }) {
    return update(alerts);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String pair, double currentPrice, double targetPrice,
            String? comment)?
        create,
    TResult? Function(String pair)? load,
    TResult? Function(String value)? changeValue,
    TResult? Function(PriceAlert alert)? remove,
    TResult? Function(String pair)? removeAll,
    TResult? Function(Alerts alerts)? update,
  }) {
    return update?.call(alerts);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String pair, double currentPrice, double targetPrice,
            String? comment)?
        create,
    TResult Function(String pair)? load,
    TResult Function(String value)? changeValue,
    TResult Function(PriceAlert alert)? remove,
    TResult Function(String pair)? removeAll,
    TResult Function(Alerts alerts)? update,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(alerts);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateAlert value) create,
    required TResult Function(_LoadAlert value) load,
    required TResult Function(_ChangeValue value) changeValue,
    required TResult Function(_RemoveAlert value) remove,
    required TResult Function(_RemoveAllAlert value) removeAll,
    required TResult Function(_UpdateAlerts value) update,
  }) {
    return update(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreateAlert value)? create,
    TResult? Function(_LoadAlert value)? load,
    TResult? Function(_ChangeValue value)? changeValue,
    TResult? Function(_RemoveAlert value)? remove,
    TResult? Function(_RemoveAllAlert value)? removeAll,
    TResult? Function(_UpdateAlerts value)? update,
  }) {
    return update?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateAlert value)? create,
    TResult Function(_LoadAlert value)? load,
    TResult Function(_ChangeValue value)? changeValue,
    TResult Function(_RemoveAlert value)? remove,
    TResult Function(_RemoveAllAlert value)? removeAll,
    TResult Function(_UpdateAlerts value)? update,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class _UpdateAlerts extends AlertBuilderEvent {
  const factory _UpdateAlerts({required final Alerts alerts}) =
      _$UpdateAlertsImpl;
  const _UpdateAlerts._() : super._();

  Alerts get alerts;
  @JsonKey(ignore: true)
  _$$UpdateAlertsImplCopyWith<_$UpdateAlertsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AlertBuilderState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() inProgress,
    required TResult Function() notInitialized,
    required TResult Function(Alerts alerts, String message, String? source,
            dynamic error, StackTrace? stackTrace)
        error,
    required TResult Function(Alerts alerts) successful,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? inProgress,
    TResult? Function()? notInitialized,
    TResult? Function(Alerts alerts, String message, String? source,
            dynamic error, StackTrace? stackTrace)?
        error,
    TResult? Function(Alerts alerts)? successful,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? inProgress,
    TResult Function()? notInitialized,
    TResult Function(Alerts alerts, String message, String? source,
            dynamic error, StackTrace? stackTrace)?
        error,
    TResult Function(Alerts alerts)? successful,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialAlertBuilderState value) initial,
    required TResult Function(_InProgressAlertBuilderState value) inProgress,
    required TResult Function(_NotInitializedState value) notInitialized,
    required TResult Function(_ErrorAlertBuilderState value) error,
    required TResult Function(_SuccessfulAlertBuilderState value) successful,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialAlertBuilderState value)? initial,
    TResult? Function(_InProgressAlertBuilderState value)? inProgress,
    TResult? Function(_NotInitializedState value)? notInitialized,
    TResult? Function(_ErrorAlertBuilderState value)? error,
    TResult? Function(_SuccessfulAlertBuilderState value)? successful,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialAlertBuilderState value)? initial,
    TResult Function(_InProgressAlertBuilderState value)? inProgress,
    TResult Function(_NotInitializedState value)? notInitialized,
    TResult Function(_ErrorAlertBuilderState value)? error,
    TResult Function(_SuccessfulAlertBuilderState value)? successful,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlertBuilderStateCopyWith<$Res> {
  factory $AlertBuilderStateCopyWith(
          AlertBuilderState value, $Res Function(AlertBuilderState) then) =
      _$AlertBuilderStateCopyWithImpl<$Res, AlertBuilderState>;
}

/// @nodoc
class _$AlertBuilderStateCopyWithImpl<$Res, $Val extends AlertBuilderState>
    implements $AlertBuilderStateCopyWith<$Res> {
  _$AlertBuilderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialAlertBuilderStateImplCopyWith<$Res> {
  factory _$$InitialAlertBuilderStateImplCopyWith(
          _$InitialAlertBuilderStateImpl value,
          $Res Function(_$InitialAlertBuilderStateImpl) then) =
      __$$InitialAlertBuilderStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialAlertBuilderStateImplCopyWithImpl<$Res>
    extends _$AlertBuilderStateCopyWithImpl<$Res,
        _$InitialAlertBuilderStateImpl>
    implements _$$InitialAlertBuilderStateImplCopyWith<$Res> {
  __$$InitialAlertBuilderStateImplCopyWithImpl(
      _$InitialAlertBuilderStateImpl _value,
      $Res Function(_$InitialAlertBuilderStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialAlertBuilderStateImpl implements _InitialAlertBuilderState {
  const _$InitialAlertBuilderStateImpl();

  @override
  String toString() {
    return 'AlertBuilderState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialAlertBuilderStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() inProgress,
    required TResult Function() notInitialized,
    required TResult Function(Alerts alerts, String message, String? source,
            dynamic error, StackTrace? stackTrace)
        error,
    required TResult Function(Alerts alerts) successful,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? inProgress,
    TResult? Function()? notInitialized,
    TResult? Function(Alerts alerts, String message, String? source,
            dynamic error, StackTrace? stackTrace)?
        error,
    TResult? Function(Alerts alerts)? successful,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? inProgress,
    TResult Function()? notInitialized,
    TResult Function(Alerts alerts, String message, String? source,
            dynamic error, StackTrace? stackTrace)?
        error,
    TResult Function(Alerts alerts)? successful,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialAlertBuilderState value) initial,
    required TResult Function(_InProgressAlertBuilderState value) inProgress,
    required TResult Function(_NotInitializedState value) notInitialized,
    required TResult Function(_ErrorAlertBuilderState value) error,
    required TResult Function(_SuccessfulAlertBuilderState value) successful,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialAlertBuilderState value)? initial,
    TResult? Function(_InProgressAlertBuilderState value)? inProgress,
    TResult? Function(_NotInitializedState value)? notInitialized,
    TResult? Function(_ErrorAlertBuilderState value)? error,
    TResult? Function(_SuccessfulAlertBuilderState value)? successful,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialAlertBuilderState value)? initial,
    TResult Function(_InProgressAlertBuilderState value)? inProgress,
    TResult Function(_NotInitializedState value)? notInitialized,
    TResult Function(_ErrorAlertBuilderState value)? error,
    TResult Function(_SuccessfulAlertBuilderState value)? successful,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _InitialAlertBuilderState implements AlertBuilderState {
  const factory _InitialAlertBuilderState() = _$InitialAlertBuilderStateImpl;
}

/// @nodoc
abstract class _$$InProgressAlertBuilderStateImplCopyWith<$Res> {
  factory _$$InProgressAlertBuilderStateImplCopyWith(
          _$InProgressAlertBuilderStateImpl value,
          $Res Function(_$InProgressAlertBuilderStateImpl) then) =
      __$$InProgressAlertBuilderStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InProgressAlertBuilderStateImplCopyWithImpl<$Res>
    extends _$AlertBuilderStateCopyWithImpl<$Res,
        _$InProgressAlertBuilderStateImpl>
    implements _$$InProgressAlertBuilderStateImplCopyWith<$Res> {
  __$$InProgressAlertBuilderStateImplCopyWithImpl(
      _$InProgressAlertBuilderStateImpl _value,
      $Res Function(_$InProgressAlertBuilderStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InProgressAlertBuilderStateImpl
    implements _InProgressAlertBuilderState {
  const _$InProgressAlertBuilderStateImpl();

  @override
  String toString() {
    return 'AlertBuilderState.inProgress()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InProgressAlertBuilderStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() inProgress,
    required TResult Function() notInitialized,
    required TResult Function(Alerts alerts, String message, String? source,
            dynamic error, StackTrace? stackTrace)
        error,
    required TResult Function(Alerts alerts) successful,
  }) {
    return inProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? inProgress,
    TResult? Function()? notInitialized,
    TResult? Function(Alerts alerts, String message, String? source,
            dynamic error, StackTrace? stackTrace)?
        error,
    TResult? Function(Alerts alerts)? successful,
  }) {
    return inProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? inProgress,
    TResult Function()? notInitialized,
    TResult Function(Alerts alerts, String message, String? source,
            dynamic error, StackTrace? stackTrace)?
        error,
    TResult Function(Alerts alerts)? successful,
    required TResult orElse(),
  }) {
    if (inProgress != null) {
      return inProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialAlertBuilderState value) initial,
    required TResult Function(_InProgressAlertBuilderState value) inProgress,
    required TResult Function(_NotInitializedState value) notInitialized,
    required TResult Function(_ErrorAlertBuilderState value) error,
    required TResult Function(_SuccessfulAlertBuilderState value) successful,
  }) {
    return inProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialAlertBuilderState value)? initial,
    TResult? Function(_InProgressAlertBuilderState value)? inProgress,
    TResult? Function(_NotInitializedState value)? notInitialized,
    TResult? Function(_ErrorAlertBuilderState value)? error,
    TResult? Function(_SuccessfulAlertBuilderState value)? successful,
  }) {
    return inProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialAlertBuilderState value)? initial,
    TResult Function(_InProgressAlertBuilderState value)? inProgress,
    TResult Function(_NotInitializedState value)? notInitialized,
    TResult Function(_ErrorAlertBuilderState value)? error,
    TResult Function(_SuccessfulAlertBuilderState value)? successful,
    required TResult orElse(),
  }) {
    if (inProgress != null) {
      return inProgress(this);
    }
    return orElse();
  }
}

abstract class _InProgressAlertBuilderState implements AlertBuilderState {
  const factory _InProgressAlertBuilderState() =
      _$InProgressAlertBuilderStateImpl;
}

/// @nodoc
abstract class _$$NotInitializedStateImplCopyWith<$Res> {
  factory _$$NotInitializedStateImplCopyWith(_$NotInitializedStateImpl value,
          $Res Function(_$NotInitializedStateImpl) then) =
      __$$NotInitializedStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NotInitializedStateImplCopyWithImpl<$Res>
    extends _$AlertBuilderStateCopyWithImpl<$Res, _$NotInitializedStateImpl>
    implements _$$NotInitializedStateImplCopyWith<$Res> {
  __$$NotInitializedStateImplCopyWithImpl(_$NotInitializedStateImpl _value,
      $Res Function(_$NotInitializedStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NotInitializedStateImpl implements _NotInitializedState {
  const _$NotInitializedStateImpl();

  @override
  String toString() {
    return 'AlertBuilderState.notInitialized()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotInitializedStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() inProgress,
    required TResult Function() notInitialized,
    required TResult Function(Alerts alerts, String message, String? source,
            dynamic error, StackTrace? stackTrace)
        error,
    required TResult Function(Alerts alerts) successful,
  }) {
    return notInitialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? inProgress,
    TResult? Function()? notInitialized,
    TResult? Function(Alerts alerts, String message, String? source,
            dynamic error, StackTrace? stackTrace)?
        error,
    TResult? Function(Alerts alerts)? successful,
  }) {
    return notInitialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? inProgress,
    TResult Function()? notInitialized,
    TResult Function(Alerts alerts, String message, String? source,
            dynamic error, StackTrace? stackTrace)?
        error,
    TResult Function(Alerts alerts)? successful,
    required TResult orElse(),
  }) {
    if (notInitialized != null) {
      return notInitialized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialAlertBuilderState value) initial,
    required TResult Function(_InProgressAlertBuilderState value) inProgress,
    required TResult Function(_NotInitializedState value) notInitialized,
    required TResult Function(_ErrorAlertBuilderState value) error,
    required TResult Function(_SuccessfulAlertBuilderState value) successful,
  }) {
    return notInitialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialAlertBuilderState value)? initial,
    TResult? Function(_InProgressAlertBuilderState value)? inProgress,
    TResult? Function(_NotInitializedState value)? notInitialized,
    TResult? Function(_ErrorAlertBuilderState value)? error,
    TResult? Function(_SuccessfulAlertBuilderState value)? successful,
  }) {
    return notInitialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialAlertBuilderState value)? initial,
    TResult Function(_InProgressAlertBuilderState value)? inProgress,
    TResult Function(_NotInitializedState value)? notInitialized,
    TResult Function(_ErrorAlertBuilderState value)? error,
    TResult Function(_SuccessfulAlertBuilderState value)? successful,
    required TResult orElse(),
  }) {
    if (notInitialized != null) {
      return notInitialized(this);
    }
    return orElse();
  }
}

abstract class _NotInitializedState implements AlertBuilderState {
  const factory _NotInitializedState() = _$NotInitializedStateImpl;
}

/// @nodoc
abstract class _$$ErrorAlertBuilderStateImplCopyWith<$Res> {
  factory _$$ErrorAlertBuilderStateImplCopyWith(
          _$ErrorAlertBuilderStateImpl value,
          $Res Function(_$ErrorAlertBuilderStateImpl) then) =
      __$$ErrorAlertBuilderStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {Alerts alerts,
      String message,
      String? source,
      dynamic error,
      StackTrace? stackTrace});

  $AlertsCopyWith<$Res> get alerts;
}

/// @nodoc
class __$$ErrorAlertBuilderStateImplCopyWithImpl<$Res>
    extends _$AlertBuilderStateCopyWithImpl<$Res, _$ErrorAlertBuilderStateImpl>
    implements _$$ErrorAlertBuilderStateImplCopyWith<$Res> {
  __$$ErrorAlertBuilderStateImplCopyWithImpl(
      _$ErrorAlertBuilderStateImpl _value,
      $Res Function(_$ErrorAlertBuilderStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? alerts = null,
    Object? message = null,
    Object? source = freezed,
    Object? error = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_$ErrorAlertBuilderStateImpl(
      alerts: null == alerts
          ? _value.alerts
          : alerts // ignore: cast_nullable_to_non_nullable
              as Alerts,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as dynamic,
      stackTrace: freezed == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $AlertsCopyWith<$Res> get alerts {
    return $AlertsCopyWith<$Res>(_value.alerts, (value) {
      return _then(_value.copyWith(alerts: value));
    });
  }
}

/// @nodoc

class _$ErrorAlertBuilderStateImpl implements _ErrorAlertBuilderState {
  const _$ErrorAlertBuilderStateImpl(
      {required this.alerts,
      this.message = 'Error occured',
      this.source,
      this.error,
      this.stackTrace});

  @override
  final Alerts alerts;
  @override
  @JsonKey()
  final String message;
  @override
  final String? source;
  @override
  final dynamic error;
  @override
  final StackTrace? stackTrace;

  @override
  String toString() {
    return 'AlertBuilderState.error(alerts: $alerts, message: $message, source: $source, error: $error, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorAlertBuilderStateImpl &&
            (identical(other.alerts, alerts) || other.alerts == alerts) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.source, source) || other.source == source) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode => Object.hash(runtimeType, alerts, message, source,
      const DeepCollectionEquality().hash(error), stackTrace);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorAlertBuilderStateImplCopyWith<_$ErrorAlertBuilderStateImpl>
      get copyWith => __$$ErrorAlertBuilderStateImplCopyWithImpl<
          _$ErrorAlertBuilderStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() inProgress,
    required TResult Function() notInitialized,
    required TResult Function(Alerts alerts, String message, String? source,
            dynamic error, StackTrace? stackTrace)
        error,
    required TResult Function(Alerts alerts) successful,
  }) {
    return error(alerts, message, source, this.error, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? inProgress,
    TResult? Function()? notInitialized,
    TResult? Function(Alerts alerts, String message, String? source,
            dynamic error, StackTrace? stackTrace)?
        error,
    TResult? Function(Alerts alerts)? successful,
  }) {
    return error?.call(alerts, message, source, this.error, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? inProgress,
    TResult Function()? notInitialized,
    TResult Function(Alerts alerts, String message, String? source,
            dynamic error, StackTrace? stackTrace)?
        error,
    TResult Function(Alerts alerts)? successful,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(alerts, message, source, this.error, stackTrace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialAlertBuilderState value) initial,
    required TResult Function(_InProgressAlertBuilderState value) inProgress,
    required TResult Function(_NotInitializedState value) notInitialized,
    required TResult Function(_ErrorAlertBuilderState value) error,
    required TResult Function(_SuccessfulAlertBuilderState value) successful,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialAlertBuilderState value)? initial,
    TResult? Function(_InProgressAlertBuilderState value)? inProgress,
    TResult? Function(_NotInitializedState value)? notInitialized,
    TResult? Function(_ErrorAlertBuilderState value)? error,
    TResult? Function(_SuccessfulAlertBuilderState value)? successful,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialAlertBuilderState value)? initial,
    TResult Function(_InProgressAlertBuilderState value)? inProgress,
    TResult Function(_NotInitializedState value)? notInitialized,
    TResult Function(_ErrorAlertBuilderState value)? error,
    TResult Function(_SuccessfulAlertBuilderState value)? successful,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ErrorAlertBuilderState implements AlertBuilderState {
  const factory _ErrorAlertBuilderState(
      {required final Alerts alerts,
      final String message,
      final String? source,
      final dynamic error,
      final StackTrace? stackTrace}) = _$ErrorAlertBuilderStateImpl;

  Alerts get alerts;
  String get message;
  String? get source;
  dynamic get error;
  StackTrace? get stackTrace;
  @JsonKey(ignore: true)
  _$$ErrorAlertBuilderStateImplCopyWith<_$ErrorAlertBuilderStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessfulAlertBuilderStateImplCopyWith<$Res> {
  factory _$$SuccessfulAlertBuilderStateImplCopyWith(
          _$SuccessfulAlertBuilderStateImpl value,
          $Res Function(_$SuccessfulAlertBuilderStateImpl) then) =
      __$$SuccessfulAlertBuilderStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Alerts alerts});

  $AlertsCopyWith<$Res> get alerts;
}

/// @nodoc
class __$$SuccessfulAlertBuilderStateImplCopyWithImpl<$Res>
    extends _$AlertBuilderStateCopyWithImpl<$Res,
        _$SuccessfulAlertBuilderStateImpl>
    implements _$$SuccessfulAlertBuilderStateImplCopyWith<$Res> {
  __$$SuccessfulAlertBuilderStateImplCopyWithImpl(
      _$SuccessfulAlertBuilderStateImpl _value,
      $Res Function(_$SuccessfulAlertBuilderStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? alerts = null,
  }) {
    return _then(_$SuccessfulAlertBuilderStateImpl(
      alerts: null == alerts
          ? _value.alerts
          : alerts // ignore: cast_nullable_to_non_nullable
              as Alerts,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $AlertsCopyWith<$Res> get alerts {
    return $AlertsCopyWith<$Res>(_value.alerts, (value) {
      return _then(_value.copyWith(alerts: value));
    });
  }
}

/// @nodoc

class _$SuccessfulAlertBuilderStateImpl
    implements _SuccessfulAlertBuilderState {
  const _$SuccessfulAlertBuilderStateImpl({required this.alerts});

  @override
  final Alerts alerts;

  @override
  String toString() {
    return 'AlertBuilderState.successful(alerts: $alerts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessfulAlertBuilderStateImpl &&
            (identical(other.alerts, alerts) || other.alerts == alerts));
  }

  @override
  int get hashCode => Object.hash(runtimeType, alerts);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessfulAlertBuilderStateImplCopyWith<_$SuccessfulAlertBuilderStateImpl>
      get copyWith => __$$SuccessfulAlertBuilderStateImplCopyWithImpl<
          _$SuccessfulAlertBuilderStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() inProgress,
    required TResult Function() notInitialized,
    required TResult Function(Alerts alerts, String message, String? source,
            dynamic error, StackTrace? stackTrace)
        error,
    required TResult Function(Alerts alerts) successful,
  }) {
    return successful(alerts);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? inProgress,
    TResult? Function()? notInitialized,
    TResult? Function(Alerts alerts, String message, String? source,
            dynamic error, StackTrace? stackTrace)?
        error,
    TResult? Function(Alerts alerts)? successful,
  }) {
    return successful?.call(alerts);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? inProgress,
    TResult Function()? notInitialized,
    TResult Function(Alerts alerts, String message, String? source,
            dynamic error, StackTrace? stackTrace)?
        error,
    TResult Function(Alerts alerts)? successful,
    required TResult orElse(),
  }) {
    if (successful != null) {
      return successful(alerts);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialAlertBuilderState value) initial,
    required TResult Function(_InProgressAlertBuilderState value) inProgress,
    required TResult Function(_NotInitializedState value) notInitialized,
    required TResult Function(_ErrorAlertBuilderState value) error,
    required TResult Function(_SuccessfulAlertBuilderState value) successful,
  }) {
    return successful(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialAlertBuilderState value)? initial,
    TResult? Function(_InProgressAlertBuilderState value)? inProgress,
    TResult? Function(_NotInitializedState value)? notInitialized,
    TResult? Function(_ErrorAlertBuilderState value)? error,
    TResult? Function(_SuccessfulAlertBuilderState value)? successful,
  }) {
    return successful?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialAlertBuilderState value)? initial,
    TResult Function(_InProgressAlertBuilderState value)? inProgress,
    TResult Function(_NotInitializedState value)? notInitialized,
    TResult Function(_ErrorAlertBuilderState value)? error,
    TResult Function(_SuccessfulAlertBuilderState value)? successful,
    required TResult orElse(),
  }) {
    if (successful != null) {
      return successful(this);
    }
    return orElse();
  }
}

abstract class _SuccessfulAlertBuilderState implements AlertBuilderState {
  const factory _SuccessfulAlertBuilderState({required final Alerts alerts}) =
      _$SuccessfulAlertBuilderStateImpl;

  Alerts get alerts;
  @JsonKey(ignore: true)
  _$$SuccessfulAlertBuilderStateImplCopyWith<_$SuccessfulAlertBuilderStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
