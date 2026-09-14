// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_price.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DailyPrice {

 String get localDate; int get closePrice; int get openPrice; int get highPrice; int get lowPrice; int get accumulatedTradingVolume;
/// Create a copy of DailyPrice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyPriceCopyWith<DailyPrice> get copyWith => _$DailyPriceCopyWithImpl<DailyPrice>(this as DailyPrice, _$identity);

  /// Serializes this DailyPrice to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as DailyPrice;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyPrice&&(identical(other.localDate, _this.localDate) || other.localDate == _this.localDate)&&(identical(other.closePrice, _this.closePrice) || other.closePrice == _this.closePrice)&&(identical(other.openPrice, _this.openPrice) || other.openPrice == _this.openPrice)&&(identical(other.highPrice, _this.highPrice) || other.highPrice == _this.highPrice)&&(identical(other.lowPrice, _this.lowPrice) || other.lowPrice == _this.lowPrice)&&(identical(other.accumulatedTradingVolume, _this.accumulatedTradingVolume) || other.accumulatedTradingVolume == _this.accumulatedTradingVolume));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as DailyPrice;
  return Object.hash(runtimeType,_this.localDate,_this.closePrice,_this.openPrice,_this.highPrice,_this.lowPrice,_this.accumulatedTradingVolume);
}

@override
String toString() {
  final _this = this as DailyPrice;
  return 'DailyPrice(localDate: ${_this.localDate}, closePrice: ${_this.closePrice}, openPrice: ${_this.openPrice}, highPrice: ${_this.highPrice}, lowPrice: ${_this.lowPrice}, accumulatedTradingVolume: ${_this.accumulatedTradingVolume})';
}


}

/// @nodoc
abstract mixin class $DailyPriceCopyWith<$Res>  {
  factory $DailyPriceCopyWith(DailyPrice value, $Res Function(DailyPrice) _then) = _$DailyPriceCopyWithImpl;
@useResult
$Res call({
 String localDate, int closePrice, int openPrice, int highPrice, int lowPrice, int accumulatedTradingVolume
});




}
/// @nodoc
class _$DailyPriceCopyWithImpl<$Res>
    implements $DailyPriceCopyWith<$Res> {
  _$DailyPriceCopyWithImpl(this._self, this._then);

  final DailyPrice _self;
  final $Res Function(DailyPrice) _then;

/// Create a copy of DailyPrice
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? localDate = null,Object? closePrice = null,Object? openPrice = null,Object? highPrice = null,Object? lowPrice = null,Object? accumulatedTradingVolume = null,}) {
  return _then(DailyPrice(
localDate: null == localDate ? _self.localDate : localDate // ignore: cast_nullable_to_non_nullable
as String,closePrice: null == closePrice ? _self.closePrice : closePrice // ignore: cast_nullable_to_non_nullable
as int,openPrice: null == openPrice ? _self.openPrice : openPrice // ignore: cast_nullable_to_non_nullable
as int,highPrice: null == highPrice ? _self.highPrice : highPrice // ignore: cast_nullable_to_non_nullable
as int,lowPrice: null == lowPrice ? _self.lowPrice : lowPrice // ignore: cast_nullable_to_non_nullable
as int,accumulatedTradingVolume: null == accumulatedTradingVolume ? _self.accumulatedTradingVolume : accumulatedTradingVolume // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DailyPrice].
extension DailyPricePatterns on DailyPrice {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailyPrice value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailyPrice() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailyPrice value)  $default,){
final _that = this;
switch (_that) {
case _DailyPrice():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailyPrice value)?  $default,){
final _that = this;
switch (_that) {
case _DailyPrice() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String localDate,  int closePrice,  int openPrice,  int highPrice,  int lowPrice,  int accumulatedTradingVolume)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailyPrice() when $default != null:
return $default(_that.localDate,_that.closePrice,_that.openPrice,_that.highPrice,_that.lowPrice,_that.accumulatedTradingVolume);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String localDate,  int closePrice,  int openPrice,  int highPrice,  int lowPrice,  int accumulatedTradingVolume)  $default,) {final _that = this;
switch (_that) {
case _DailyPrice():
return $default(_that.localDate,_that.closePrice,_that.openPrice,_that.highPrice,_that.lowPrice,_that.accumulatedTradingVolume);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String localDate,  int closePrice,  int openPrice,  int highPrice,  int lowPrice,  int accumulatedTradingVolume)?  $default,) {final _that = this;
switch (_that) {
case _DailyPrice() when $default != null:
return $default(_that.localDate,_that.closePrice,_that.openPrice,_that.highPrice,_that.lowPrice,_that.accumulatedTradingVolume);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DailyPrice implements DailyPrice {
  const _DailyPrice({required this.localDate, required this.closePrice, required this.openPrice, required this.highPrice, required this.lowPrice, required this.accumulatedTradingVolume});
  factory _DailyPrice.fromJson(Map<String, dynamic> json) => _$DailyPriceFromJson(json);

@override final  String localDate;
@override final  int closePrice;
@override final  int openPrice;
@override final  int highPrice;
@override final  int lowPrice;
@override final  int accumulatedTradingVolume;

/// Create a copy of DailyPrice
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyPriceCopyWith<_DailyPrice> get copyWith => __$DailyPriceCopyWithImpl<_DailyPrice>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DailyPriceToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyPrice&&(identical(other.localDate, localDate) || other.localDate == localDate)&&(identical(other.closePrice, closePrice) || other.closePrice == closePrice)&&(identical(other.openPrice, openPrice) || other.openPrice == openPrice)&&(identical(other.highPrice, highPrice) || other.highPrice == highPrice)&&(identical(other.lowPrice, lowPrice) || other.lowPrice == lowPrice)&&(identical(other.accumulatedTradingVolume, accumulatedTradingVolume) || other.accumulatedTradingVolume == accumulatedTradingVolume));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,localDate,closePrice,openPrice,highPrice,lowPrice,accumulatedTradingVolume);
}

@override
String toString() {
    return 'DailyPrice(localDate: $localDate, closePrice: $closePrice, openPrice: $openPrice, highPrice: $highPrice, lowPrice: $lowPrice, accumulatedTradingVolume: $accumulatedTradingVolume)';
}


}

/// @nodoc
abstract mixin class _$DailyPriceCopyWith<$Res> implements $DailyPriceCopyWith<$Res> {
  factory _$DailyPriceCopyWith(_DailyPrice value, $Res Function(_DailyPrice) _then) = __$DailyPriceCopyWithImpl;
@override @useResult
$Res call({
 String localDate, int closePrice, int openPrice, int highPrice, int lowPrice, int accumulatedTradingVolume
});




}
/// @nodoc
class __$DailyPriceCopyWithImpl<$Res>
    implements _$DailyPriceCopyWith<$Res> {
  __$DailyPriceCopyWithImpl(this._self, this._then);

  final _DailyPrice _self;
  final $Res Function(_DailyPrice) _then;

/// Create a copy of DailyPrice
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? localDate = null,Object? closePrice = null,Object? openPrice = null,Object? highPrice = null,Object? lowPrice = null,Object? accumulatedTradingVolume = null,}) {
  return _then(_DailyPrice(
localDate: null == localDate ? _self.localDate : localDate // ignore: cast_nullable_to_non_nullable
as String,closePrice: null == closePrice ? _self.closePrice : closePrice // ignore: cast_nullable_to_non_nullable
as int,openPrice: null == openPrice ? _self.openPrice : openPrice // ignore: cast_nullable_to_non_nullable
as int,highPrice: null == highPrice ? _self.highPrice : highPrice // ignore: cast_nullable_to_non_nullable
as int,lowPrice: null == lowPrice ? _self.lowPrice : lowPrice // ignore: cast_nullable_to_non_nullable
as int,accumulatedTradingVolume: null == accumulatedTradingVolume ? _self.accumulatedTradingVolume : accumulatedTradingVolume // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
