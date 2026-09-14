// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stock_metadata.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StockMetadata {

 String get symbol; String get name; String get exchangeName;
/// Create a copy of StockMetadata
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StockMetadataCopyWith<StockMetadata> get copyWith => _$StockMetadataCopyWithImpl<StockMetadata>(this as StockMetadata, _$identity);

  /// Serializes this StockMetadata to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as StockMetadata;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StockMetadata&&(identical(other.symbol, _this.symbol) || other.symbol == _this.symbol)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.exchangeName, _this.exchangeName) || other.exchangeName == _this.exchangeName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as StockMetadata;
  return Object.hash(runtimeType,_this.symbol,_this.name,_this.exchangeName);
}

@override
String toString() {
  final _this = this as StockMetadata;
  return 'StockMetadata(symbol: ${_this.symbol}, name: ${_this.name}, exchangeName: ${_this.exchangeName})';
}


}

/// @nodoc
abstract mixin class $StockMetadataCopyWith<$Res>  {
  factory $StockMetadataCopyWith(StockMetadata value, $Res Function(StockMetadata) _then) = _$StockMetadataCopyWithImpl;
@useResult
$Res call({
 String symbol, String name, String exchangeName
});




}
/// @nodoc
class _$StockMetadataCopyWithImpl<$Res>
    implements $StockMetadataCopyWith<$Res> {
  _$StockMetadataCopyWithImpl(this._self, this._then);

  final StockMetadata _self;
  final $Res Function(StockMetadata) _then;

/// Create a copy of StockMetadata
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? symbol = null,Object? name = null,Object? exchangeName = null,}) {
  return _then(StockMetadata(
symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,exchangeName: null == exchangeName ? _self.exchangeName : exchangeName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [StockMetadata].
extension StockMetadataPatterns on StockMetadata {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StockMetadata value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StockMetadata() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StockMetadata value)  $default,){
final _that = this;
switch (_that) {
case _StockMetadata():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StockMetadata value)?  $default,){
final _that = this;
switch (_that) {
case _StockMetadata() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String symbol,  String name,  String exchangeName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StockMetadata() when $default != null:
return $default(_that.symbol,_that.name,_that.exchangeName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String symbol,  String name,  String exchangeName)  $default,) {final _that = this;
switch (_that) {
case _StockMetadata():
return $default(_that.symbol,_that.name,_that.exchangeName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String symbol,  String name,  String exchangeName)?  $default,) {final _that = this;
switch (_that) {
case _StockMetadata() when $default != null:
return $default(_that.symbol,_that.name,_that.exchangeName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StockMetadata implements StockMetadata {
  const _StockMetadata({required this.symbol, required this.name, required this.exchangeName});
  factory _StockMetadata.fromJson(Map<String, dynamic> json) => _$StockMetadataFromJson(json);

@override final  String symbol;
@override final  String name;
@override final  String exchangeName;

/// Create a copy of StockMetadata
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StockMetadataCopyWith<_StockMetadata> get copyWith => __$StockMetadataCopyWithImpl<_StockMetadata>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StockMetadataToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _StockMetadata&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.name, name) || other.name == name)&&(identical(other.exchangeName, exchangeName) || other.exchangeName == exchangeName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,symbol,name,exchangeName);
}

@override
String toString() {
    return 'StockMetadata(symbol: $symbol, name: $name, exchangeName: $exchangeName)';
}


}

/// @nodoc
abstract mixin class _$StockMetadataCopyWith<$Res> implements $StockMetadataCopyWith<$Res> {
  factory _$StockMetadataCopyWith(_StockMetadata value, $Res Function(_StockMetadata) _then) = __$StockMetadataCopyWithImpl;
@override @useResult
$Res call({
 String symbol, String name, String exchangeName
});




}
/// @nodoc
class __$StockMetadataCopyWithImpl<$Res>
    implements _$StockMetadataCopyWith<$Res> {
  __$StockMetadataCopyWithImpl(this._self, this._then);

  final _StockMetadata _self;
  final $Res Function(_StockMetadata) _then;

/// Create a copy of StockMetadata
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? symbol = null,Object? name = null,Object? exchangeName = null,}) {
  return _then(_StockMetadata(
symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,exchangeName: null == exchangeName ? _self.exchangeName : exchangeName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
