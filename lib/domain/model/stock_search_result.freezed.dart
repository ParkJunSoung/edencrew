// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stock_search_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StockSearchResult {

 String get id; String get symbol; String get name; String get exchangeName; String get category;
/// Create a copy of StockSearchResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StockSearchResultCopyWith<StockSearchResult> get copyWith => _$StockSearchResultCopyWithImpl<StockSearchResult>(this as StockSearchResult, _$identity);

  /// Serializes this StockSearchResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as StockSearchResult;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StockSearchResult&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.symbol, _this.symbol) || other.symbol == _this.symbol)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.exchangeName, _this.exchangeName) || other.exchangeName == _this.exchangeName)&&(identical(other.category, _this.category) || other.category == _this.category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as StockSearchResult;
  return Object.hash(runtimeType,_this.id,_this.symbol,_this.name,_this.exchangeName,_this.category);
}

@override
String toString() {
  final _this = this as StockSearchResult;
  return 'StockSearchResult(id: ${_this.id}, symbol: ${_this.symbol}, name: ${_this.name}, exchangeName: ${_this.exchangeName}, category: ${_this.category})';
}


}

/// @nodoc
abstract mixin class $StockSearchResultCopyWith<$Res>  {
  factory $StockSearchResultCopyWith(StockSearchResult value, $Res Function(StockSearchResult) _then) = _$StockSearchResultCopyWithImpl;
@useResult
$Res call({
 String id, String symbol, String name, String exchangeName, String category
});




}
/// @nodoc
class _$StockSearchResultCopyWithImpl<$Res>
    implements $StockSearchResultCopyWith<$Res> {
  _$StockSearchResultCopyWithImpl(this._self, this._then);

  final StockSearchResult _self;
  final $Res Function(StockSearchResult) _then;

/// Create a copy of StockSearchResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? symbol = null,Object? name = null,Object? exchangeName = null,Object? category = null,}) {
  return _then(StockSearchResult(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,exchangeName: null == exchangeName ? _self.exchangeName : exchangeName // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [StockSearchResult].
extension StockSearchResultPatterns on StockSearchResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StockSearchResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StockSearchResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StockSearchResult value)  $default,){
final _that = this;
switch (_that) {
case _StockSearchResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StockSearchResult value)?  $default,){
final _that = this;
switch (_that) {
case _StockSearchResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String symbol,  String name,  String exchangeName,  String category)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StockSearchResult() when $default != null:
return $default(_that.id,_that.symbol,_that.name,_that.exchangeName,_that.category);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String symbol,  String name,  String exchangeName,  String category)  $default,) {final _that = this;
switch (_that) {
case _StockSearchResult():
return $default(_that.id,_that.symbol,_that.name,_that.exchangeName,_that.category);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String symbol,  String name,  String exchangeName,  String category)?  $default,) {final _that = this;
switch (_that) {
case _StockSearchResult() when $default != null:
return $default(_that.id,_that.symbol,_that.name,_that.exchangeName,_that.category);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StockSearchResult implements StockSearchResult {
  const _StockSearchResult({required this.id, required this.symbol, required this.name, required this.exchangeName, required this.category});
  factory _StockSearchResult.fromJson(Map<String, dynamic> json) => _$StockSearchResultFromJson(json);

@override final  String id;
@override final  String symbol;
@override final  String name;
@override final  String exchangeName;
@override final  String category;

/// Create a copy of StockSearchResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StockSearchResultCopyWith<_StockSearchResult> get copyWith => __$StockSearchResultCopyWithImpl<_StockSearchResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StockSearchResultToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _StockSearchResult&&(identical(other.id, id) || other.id == id)&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.name, name) || other.name == name)&&(identical(other.exchangeName, exchangeName) || other.exchangeName == exchangeName)&&(identical(other.category, category) || other.category == category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,symbol,name,exchangeName,category);
}

@override
String toString() {
    return 'StockSearchResult(id: $id, symbol: $symbol, name: $name, exchangeName: $exchangeName, category: $category)';
}


}

/// @nodoc
abstract mixin class _$StockSearchResultCopyWith<$Res> implements $StockSearchResultCopyWith<$Res> {
  factory _$StockSearchResultCopyWith(_StockSearchResult value, $Res Function(_StockSearchResult) _then) = __$StockSearchResultCopyWithImpl;
@override @useResult
$Res call({
 String id, String symbol, String name, String exchangeName, String category
});




}
/// @nodoc
class __$StockSearchResultCopyWithImpl<$Res>
    implements _$StockSearchResultCopyWith<$Res> {
  __$StockSearchResultCopyWithImpl(this._self, this._then);

  final _StockSearchResult _self;
  final $Res Function(_StockSearchResult) _then;

/// Create a copy of StockSearchResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? symbol = null,Object? name = null,Object? exchangeName = null,Object? category = null,}) {
  return _then(_StockSearchResult(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,exchangeName: null == exchangeName ? _self.exchangeName : exchangeName // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
