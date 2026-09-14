// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_prices_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DailyPricesResult {

 List<DailyPrice> get prices; int get lastPage; int get loadedPages; bool get hasMore;
/// Create a copy of DailyPricesResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyPricesResultCopyWith<DailyPricesResult> get copyWith => _$DailyPricesResultCopyWithImpl<DailyPricesResult>(this as DailyPricesResult, _$identity);

  /// Serializes this DailyPricesResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as DailyPricesResult;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyPricesResult&&const DeepCollectionEquality().equals(other.prices, _this.prices)&&(identical(other.lastPage, _this.lastPage) || other.lastPage == _this.lastPage)&&(identical(other.loadedPages, _this.loadedPages) || other.loadedPages == _this.loadedPages)&&(identical(other.hasMore, _this.hasMore) || other.hasMore == _this.hasMore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as DailyPricesResult;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.prices),_this.lastPage,_this.loadedPages,_this.hasMore);
}

@override
String toString() {
  final _this = this as DailyPricesResult;
  return 'DailyPricesResult(prices: ${_this.prices}, lastPage: ${_this.lastPage}, loadedPages: ${_this.loadedPages}, hasMore: ${_this.hasMore})';
}


}

/// @nodoc
abstract mixin class $DailyPricesResultCopyWith<$Res>  {
  factory $DailyPricesResultCopyWith(DailyPricesResult value, $Res Function(DailyPricesResult) _then) = _$DailyPricesResultCopyWithImpl;
@useResult
$Res call({
 List<DailyPrice> prices, int lastPage, int loadedPages, bool hasMore
});




}
/// @nodoc
class _$DailyPricesResultCopyWithImpl<$Res>
    implements $DailyPricesResultCopyWith<$Res> {
  _$DailyPricesResultCopyWithImpl(this._self, this._then);

  final DailyPricesResult _self;
  final $Res Function(DailyPricesResult) _then;

/// Create a copy of DailyPricesResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? prices = null,Object? lastPage = null,Object? loadedPages = null,Object? hasMore = null,}) {
  return _then(DailyPricesResult(
prices: null == prices ? _self.prices : prices // ignore: cast_nullable_to_non_nullable
as List<DailyPrice>,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,loadedPages: null == loadedPages ? _self.loadedPages : loadedPages // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [DailyPricesResult].
extension DailyPricesResultPatterns on DailyPricesResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailyPricesResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailyPricesResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailyPricesResult value)  $default,){
final _that = this;
switch (_that) {
case _DailyPricesResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailyPricesResult value)?  $default,){
final _that = this;
switch (_that) {
case _DailyPricesResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<DailyPrice> prices,  int lastPage,  int loadedPages,  bool hasMore)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailyPricesResult() when $default != null:
return $default(_that.prices,_that.lastPage,_that.loadedPages,_that.hasMore);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<DailyPrice> prices,  int lastPage,  int loadedPages,  bool hasMore)  $default,) {final _that = this;
switch (_that) {
case _DailyPricesResult():
return $default(_that.prices,_that.lastPage,_that.loadedPages,_that.hasMore);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<DailyPrice> prices,  int lastPage,  int loadedPages,  bool hasMore)?  $default,) {final _that = this;
switch (_that) {
case _DailyPricesResult() when $default != null:
return $default(_that.prices,_that.lastPage,_that.loadedPages,_that.hasMore);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DailyPricesResult implements DailyPricesResult {
  const _DailyPricesResult({required  List<DailyPrice> prices, required this.lastPage, required this.loadedPages, required this.hasMore}): _prices = prices;
  factory _DailyPricesResult.fromJson(Map<String, dynamic> json) => _$DailyPricesResultFromJson(json);

 final  List<DailyPrice> _prices;
@override List<DailyPrice> get prices {
  if (_prices is EqualUnmodifiableListView) return _prices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_prices);
}

@override final  int lastPage;
@override final  int loadedPages;
@override final  bool hasMore;

/// Create a copy of DailyPricesResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyPricesResultCopyWith<_DailyPricesResult> get copyWith => __$DailyPricesResultCopyWithImpl<_DailyPricesResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DailyPricesResultToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyPricesResult&&const DeepCollectionEquality().equals(other.prices, _prices)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage)&&(identical(other.loadedPages, loadedPages) || other.loadedPages == loadedPages)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_prices),lastPage,loadedPages,hasMore);
}

@override
String toString() {
    return 'DailyPricesResult(prices: $prices, lastPage: $lastPage, loadedPages: $loadedPages, hasMore: $hasMore)';
}


}

/// @nodoc
abstract mixin class _$DailyPricesResultCopyWith<$Res> implements $DailyPricesResultCopyWith<$Res> {
  factory _$DailyPricesResultCopyWith(_DailyPricesResult value, $Res Function(_DailyPricesResult) _then) = __$DailyPricesResultCopyWithImpl;
@override @useResult
$Res call({
 List<DailyPrice> prices, int lastPage, int loadedPages, bool hasMore
});




}
/// @nodoc
class __$DailyPricesResultCopyWithImpl<$Res>
    implements _$DailyPricesResultCopyWith<$Res> {
  __$DailyPricesResultCopyWithImpl(this._self, this._then);

  final _DailyPricesResult _self;
  final $Res Function(_DailyPricesResult) _then;

/// Create a copy of DailyPricesResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? prices = null,Object? lastPage = null,Object? loadedPages = null,Object? hasMore = null,}) {
  return _then(_DailyPricesResult(
prices: null == prices ? _self._prices : prices // ignore: cast_nullable_to_non_nullable
as List<DailyPrice>,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,loadedPages: null == loadedPages ? _self.loadedPages : loadedPages // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
