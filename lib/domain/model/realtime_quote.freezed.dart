// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'realtime_quote.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RealtimeQuote {

 String get symbol; int get currentPrice; int? get previousClose; int get openPrice; int get highPrice; int get lowPrice; int get accumulatedTradingVolume; int get countOfListedStock;
/// Create a copy of RealtimeQuote
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RealtimeQuoteCopyWith<RealtimeQuote> get copyWith => _$RealtimeQuoteCopyWithImpl<RealtimeQuote>(this as RealtimeQuote, _$identity);

  /// Serializes this RealtimeQuote to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as RealtimeQuote;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RealtimeQuote&&(identical(other.symbol, _this.symbol) || other.symbol == _this.symbol)&&(identical(other.currentPrice, _this.currentPrice) || other.currentPrice == _this.currentPrice)&&(identical(other.previousClose, _this.previousClose) || other.previousClose == _this.previousClose)&&(identical(other.openPrice, _this.openPrice) || other.openPrice == _this.openPrice)&&(identical(other.highPrice, _this.highPrice) || other.highPrice == _this.highPrice)&&(identical(other.lowPrice, _this.lowPrice) || other.lowPrice == _this.lowPrice)&&(identical(other.accumulatedTradingVolume, _this.accumulatedTradingVolume) || other.accumulatedTradingVolume == _this.accumulatedTradingVolume)&&(identical(other.countOfListedStock, _this.countOfListedStock) || other.countOfListedStock == _this.countOfListedStock));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as RealtimeQuote;
  return Object.hash(runtimeType,_this.symbol,_this.currentPrice,_this.previousClose,_this.openPrice,_this.highPrice,_this.lowPrice,_this.accumulatedTradingVolume,_this.countOfListedStock);
}

@override
String toString() {
  final _this = this as RealtimeQuote;
  return 'RealtimeQuote(symbol: ${_this.symbol}, currentPrice: ${_this.currentPrice}, previousClose: ${_this.previousClose}, openPrice: ${_this.openPrice}, highPrice: ${_this.highPrice}, lowPrice: ${_this.lowPrice}, accumulatedTradingVolume: ${_this.accumulatedTradingVolume}, countOfListedStock: ${_this.countOfListedStock})';
}


}

/// @nodoc
abstract mixin class $RealtimeQuoteCopyWith<$Res>  {
  factory $RealtimeQuoteCopyWith(RealtimeQuote value, $Res Function(RealtimeQuote) _then) = _$RealtimeQuoteCopyWithImpl;
@useResult
$Res call({
 String symbol, int currentPrice, int? previousClose, int openPrice, int highPrice, int lowPrice, int accumulatedTradingVolume, int countOfListedStock
});




}
/// @nodoc
class _$RealtimeQuoteCopyWithImpl<$Res>
    implements $RealtimeQuoteCopyWith<$Res> {
  _$RealtimeQuoteCopyWithImpl(this._self, this._then);

  final RealtimeQuote _self;
  final $Res Function(RealtimeQuote) _then;

/// Create a copy of RealtimeQuote
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? symbol = null,Object? currentPrice = null,Object? previousClose = freezed,Object? openPrice = null,Object? highPrice = null,Object? lowPrice = null,Object? accumulatedTradingVolume = null,Object? countOfListedStock = null,}) {
  return _then(RealtimeQuote(
symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,currentPrice: null == currentPrice ? _self.currentPrice : currentPrice // ignore: cast_nullable_to_non_nullable
as int,previousClose: freezed == previousClose ? _self.previousClose : previousClose // ignore: cast_nullable_to_non_nullable
as int?,openPrice: null == openPrice ? _self.openPrice : openPrice // ignore: cast_nullable_to_non_nullable
as int,highPrice: null == highPrice ? _self.highPrice : highPrice // ignore: cast_nullable_to_non_nullable
as int,lowPrice: null == lowPrice ? _self.lowPrice : lowPrice // ignore: cast_nullable_to_non_nullable
as int,accumulatedTradingVolume: null == accumulatedTradingVolume ? _self.accumulatedTradingVolume : accumulatedTradingVolume // ignore: cast_nullable_to_non_nullable
as int,countOfListedStock: null == countOfListedStock ? _self.countOfListedStock : countOfListedStock // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [RealtimeQuote].
extension RealtimeQuotePatterns on RealtimeQuote {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RealtimeQuote value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RealtimeQuote() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RealtimeQuote value)  $default,){
final _that = this;
switch (_that) {
case _RealtimeQuote():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RealtimeQuote value)?  $default,){
final _that = this;
switch (_that) {
case _RealtimeQuote() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String symbol,  int currentPrice,  int? previousClose,  int openPrice,  int highPrice,  int lowPrice,  int accumulatedTradingVolume,  int countOfListedStock)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RealtimeQuote() when $default != null:
return $default(_that.symbol,_that.currentPrice,_that.previousClose,_that.openPrice,_that.highPrice,_that.lowPrice,_that.accumulatedTradingVolume,_that.countOfListedStock);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String symbol,  int currentPrice,  int? previousClose,  int openPrice,  int highPrice,  int lowPrice,  int accumulatedTradingVolume,  int countOfListedStock)  $default,) {final _that = this;
switch (_that) {
case _RealtimeQuote():
return $default(_that.symbol,_that.currentPrice,_that.previousClose,_that.openPrice,_that.highPrice,_that.lowPrice,_that.accumulatedTradingVolume,_that.countOfListedStock);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String symbol,  int currentPrice,  int? previousClose,  int openPrice,  int highPrice,  int lowPrice,  int accumulatedTradingVolume,  int countOfListedStock)?  $default,) {final _that = this;
switch (_that) {
case _RealtimeQuote() when $default != null:
return $default(_that.symbol,_that.currentPrice,_that.previousClose,_that.openPrice,_that.highPrice,_that.lowPrice,_that.accumulatedTradingVolume,_that.countOfListedStock);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RealtimeQuote extends RealtimeQuote {
  const _RealtimeQuote({required this.symbol, required this.currentPrice, this.previousClose, required this.openPrice, required this.highPrice, required this.lowPrice, required this.accumulatedTradingVolume, required this.countOfListedStock}): super._();
  factory _RealtimeQuote.fromJson(Map<String, dynamic> json) => _$RealtimeQuoteFromJson(json);

@override final  String symbol;
@override final  int currentPrice;
@override final  int? previousClose;
@override final  int openPrice;
@override final  int highPrice;
@override final  int lowPrice;
@override final  int accumulatedTradingVolume;
@override final  int countOfListedStock;

/// Create a copy of RealtimeQuote
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RealtimeQuoteCopyWith<_RealtimeQuote> get copyWith => __$RealtimeQuoteCopyWithImpl<_RealtimeQuote>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RealtimeQuoteToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RealtimeQuote&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.currentPrice, currentPrice) || other.currentPrice == currentPrice)&&(identical(other.previousClose, previousClose) || other.previousClose == previousClose)&&(identical(other.openPrice, openPrice) || other.openPrice == openPrice)&&(identical(other.highPrice, highPrice) || other.highPrice == highPrice)&&(identical(other.lowPrice, lowPrice) || other.lowPrice == lowPrice)&&(identical(other.accumulatedTradingVolume, accumulatedTradingVolume) || other.accumulatedTradingVolume == accumulatedTradingVolume)&&(identical(other.countOfListedStock, countOfListedStock) || other.countOfListedStock == countOfListedStock));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,symbol,currentPrice,previousClose,openPrice,highPrice,lowPrice,accumulatedTradingVolume,countOfListedStock);
}

@override
String toString() {
    return 'RealtimeQuote(symbol: $symbol, currentPrice: $currentPrice, previousClose: $previousClose, openPrice: $openPrice, highPrice: $highPrice, lowPrice: $lowPrice, accumulatedTradingVolume: $accumulatedTradingVolume, countOfListedStock: $countOfListedStock)';
}


}

/// @nodoc
abstract mixin class _$RealtimeQuoteCopyWith<$Res> implements $RealtimeQuoteCopyWith<$Res> {
  factory _$RealtimeQuoteCopyWith(_RealtimeQuote value, $Res Function(_RealtimeQuote) _then) = __$RealtimeQuoteCopyWithImpl;
@override @useResult
$Res call({
 String symbol, int currentPrice, int? previousClose, int openPrice, int highPrice, int lowPrice, int accumulatedTradingVolume, int countOfListedStock
});




}
/// @nodoc
class __$RealtimeQuoteCopyWithImpl<$Res>
    implements _$RealtimeQuoteCopyWith<$Res> {
  __$RealtimeQuoteCopyWithImpl(this._self, this._then);

  final _RealtimeQuote _self;
  final $Res Function(_RealtimeQuote) _then;

/// Create a copy of RealtimeQuote
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? symbol = null,Object? currentPrice = null,Object? previousClose = freezed,Object? openPrice = null,Object? highPrice = null,Object? lowPrice = null,Object? accumulatedTradingVolume = null,Object? countOfListedStock = null,}) {
  return _then(_RealtimeQuote(
symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,currentPrice: null == currentPrice ? _self.currentPrice : currentPrice // ignore: cast_nullable_to_non_nullable
as int,previousClose: freezed == previousClose ? _self.previousClose : previousClose // ignore: cast_nullable_to_non_nullable
as int?,openPrice: null == openPrice ? _self.openPrice : openPrice // ignore: cast_nullable_to_non_nullable
as int,highPrice: null == highPrice ? _self.highPrice : highPrice // ignore: cast_nullable_to_non_nullable
as int,lowPrice: null == lowPrice ? _self.lowPrice : lowPrice // ignore: cast_nullable_to_non_nullable
as int,accumulatedTradingVolume: null == accumulatedTradingVolume ? _self.accumulatedTradingVolume : accumulatedTradingVolume // ignore: cast_nullable_to_non_nullable
as int,countOfListedStock: null == countOfListedStock ? _self.countOfListedStock : countOfListedStock // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
