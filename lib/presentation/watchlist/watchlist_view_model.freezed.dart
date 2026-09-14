// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'watchlist_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WatchlistState implements DiagnosticableTreeMixin {

 List<StockMetadata> get stocks; Map<String, RealtimeQuote> get quotes; WatchlistSort get sort; bool get isRefreshing; StockDataError? get error;
/// Create a copy of WatchlistState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WatchlistStateCopyWith<WatchlistState> get copyWith => _$WatchlistStateCopyWithImpl<WatchlistState>(this as WatchlistState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  final _this = this as WatchlistState;
  properties
    ..add(DiagnosticsProperty('type', 'WatchlistState'))
    ..add(DiagnosticsProperty('stocks', _this.stocks))..add(DiagnosticsProperty('quotes', _this.quotes))..add(DiagnosticsProperty('sort', _this.sort))..add(DiagnosticsProperty('isRefreshing', _this.isRefreshing))..add(DiagnosticsProperty('error', _this.error));
}

@override
bool operator ==(Object other) {
  final _this = this as WatchlistState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WatchlistState&&const DeepCollectionEquality().equals(other.stocks, _this.stocks)&&const DeepCollectionEquality().equals(other.quotes, _this.quotes)&&(identical(other.sort, _this.sort) || other.sort == _this.sort)&&(identical(other.isRefreshing, _this.isRefreshing) || other.isRefreshing == _this.isRefreshing)&&(identical(other.error, _this.error) || other.error == _this.error));
}


@override
int get hashCode {
  final _this = this as WatchlistState;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.stocks),const DeepCollectionEquality().hash(_this.quotes),_this.sort,_this.isRefreshing,_this.error);
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  final _this = this as WatchlistState;
  return 'WatchlistState(stocks: ${_this.stocks}, quotes: ${_this.quotes}, sort: ${_this.sort}, isRefreshing: ${_this.isRefreshing}, error: ${_this.error})';
}


}

/// @nodoc
abstract mixin class $WatchlistStateCopyWith<$Res>  {
  factory $WatchlistStateCopyWith(WatchlistState value, $Res Function(WatchlistState) _then) = _$WatchlistStateCopyWithImpl;
@useResult
$Res call({
 List<StockMetadata> stocks, Map<String, RealtimeQuote> quotes, WatchlistSort sort, bool isRefreshing, StockDataError? error
});




}
/// @nodoc
class _$WatchlistStateCopyWithImpl<$Res>
    implements $WatchlistStateCopyWith<$Res> {
  _$WatchlistStateCopyWithImpl(this._self, this._then);

  final WatchlistState _self;
  final $Res Function(WatchlistState) _then;

/// Create a copy of WatchlistState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stocks = null,Object? quotes = null,Object? sort = null,Object? isRefreshing = null,Object? error = freezed,}) {
  return _then(WatchlistState(
stocks: null == stocks ? _self.stocks : stocks // ignore: cast_nullable_to_non_nullable
as List<StockMetadata>,quotes: null == quotes ? _self.quotes : quotes // ignore: cast_nullable_to_non_nullable
as Map<String, RealtimeQuote>,sort: null == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as WatchlistSort,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as StockDataError?,
  ));
}

}


/// Adds pattern-matching-related methods to [WatchlistState].
extension WatchlistStatePatterns on WatchlistState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WatchlistState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WatchlistState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WatchlistState value)  $default,){
final _that = this;
switch (_that) {
case _WatchlistState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WatchlistState value)?  $default,){
final _that = this;
switch (_that) {
case _WatchlistState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<StockMetadata> stocks,  Map<String, RealtimeQuote> quotes,  WatchlistSort sort,  bool isRefreshing,  StockDataError? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WatchlistState() when $default != null:
return $default(_that.stocks,_that.quotes,_that.sort,_that.isRefreshing,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<StockMetadata> stocks,  Map<String, RealtimeQuote> quotes,  WatchlistSort sort,  bool isRefreshing,  StockDataError? error)  $default,) {final _that = this;
switch (_that) {
case _WatchlistState():
return $default(_that.stocks,_that.quotes,_that.sort,_that.isRefreshing,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<StockMetadata> stocks,  Map<String, RealtimeQuote> quotes,  WatchlistSort sort,  bool isRefreshing,  StockDataError? error)?  $default,) {final _that = this;
switch (_that) {
case _WatchlistState() when $default != null:
return $default(_that.stocks,_that.quotes,_that.sort,_that.isRefreshing,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _WatchlistState with DiagnosticableTreeMixin implements WatchlistState {
  const _WatchlistState({ List<StockMetadata> stocks = const <StockMetadata>[],  Map<String, RealtimeQuote> quotes = const <String, RealtimeQuote>{}, this.sort = WatchlistSort.name, this.isRefreshing = false, this.error}): _stocks = stocks,_quotes = quotes;
  

 final  List<StockMetadata> _stocks;
@override@JsonKey() List<StockMetadata> get stocks {
  if (_stocks is EqualUnmodifiableListView) return _stocks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_stocks);
}

 final  Map<String, RealtimeQuote> _quotes;
@override@JsonKey() Map<String, RealtimeQuote> get quotes {
  if (_quotes is EqualUnmodifiableMapView) return _quotes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_quotes);
}

@override@JsonKey() final  WatchlistSort sort;
@override@JsonKey() final  bool isRefreshing;
@override final  StockDataError? error;

/// Create a copy of WatchlistState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WatchlistStateCopyWith<_WatchlistState> get copyWith => __$WatchlistStateCopyWithImpl<_WatchlistState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
    ..add(DiagnosticsProperty('type', 'WatchlistState'))
    ..add(DiagnosticsProperty('stocks', stocks))..add(DiagnosticsProperty('quotes', quotes))..add(DiagnosticsProperty('sort', sort))..add(DiagnosticsProperty('isRefreshing', isRefreshing))..add(DiagnosticsProperty('error', error));
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _WatchlistState&&const DeepCollectionEquality().equals(other.stocks, _stocks)&&const DeepCollectionEquality().equals(other.quotes, _quotes)&&(identical(other.sort, sort) || other.sort == sort)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_stocks),const DeepCollectionEquality().hash(_quotes),sort,isRefreshing,error);
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'WatchlistState(stocks: $stocks, quotes: $quotes, sort: $sort, isRefreshing: $isRefreshing, error: $error)';
}


}

/// @nodoc
abstract mixin class _$WatchlistStateCopyWith<$Res> implements $WatchlistStateCopyWith<$Res> {
  factory _$WatchlistStateCopyWith(_WatchlistState value, $Res Function(_WatchlistState) _then) = __$WatchlistStateCopyWithImpl;
@override @useResult
$Res call({
 List<StockMetadata> stocks, Map<String, RealtimeQuote> quotes, WatchlistSort sort, bool isRefreshing, StockDataError? error
});




}
/// @nodoc
class __$WatchlistStateCopyWithImpl<$Res>
    implements _$WatchlistStateCopyWith<$Res> {
  __$WatchlistStateCopyWithImpl(this._self, this._then);

  final _WatchlistState _self;
  final $Res Function(_WatchlistState) _then;

/// Create a copy of WatchlistState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stocks = null,Object? quotes = null,Object? sort = null,Object? isRefreshing = null,Object? error = freezed,}) {
  return _then(_WatchlistState(
stocks: null == stocks ? _self._stocks : stocks // ignore: cast_nullable_to_non_nullable
as List<StockMetadata>,quotes: null == quotes ? _self._quotes : quotes // ignore: cast_nullable_to_non_nullable
as Map<String, RealtimeQuote>,sort: null == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as WatchlistSort,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as StockDataError?,
  ));
}


}

/// @nodoc
mixin _$WatchlistAction implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
    ..add(DiagnosticsProperty('type', 'WatchlistAction'))
    ;
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is WatchlistAction);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'WatchlistAction()';
}


}

/// @nodoc
class $WatchlistActionCopyWith<$Res>  {
$WatchlistActionCopyWith(WatchlistAction _, $Res Function(WatchlistAction) __);
}


/// Adds pattern-matching-related methods to [WatchlistAction].
extension WatchlistActionPatterns on WatchlistAction {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadWatchlist value)?  load,TResult Function( RefreshWatchlist value)?  refresh,TResult Function( SelectWatchlistSort value)?  selectSort,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadWatchlist() when load != null:
return load(_that);case RefreshWatchlist() when refresh != null:
return refresh(_that);case SelectWatchlistSort() when selectSort != null:
return selectSort(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadWatchlist value)  load,required TResult Function( RefreshWatchlist value)  refresh,required TResult Function( SelectWatchlistSort value)  selectSort,}){
final _that = this;
switch (_that) {
case LoadWatchlist():
return load(_that);case RefreshWatchlist():
return refresh(_that);case SelectWatchlistSort():
return selectSort(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadWatchlist value)?  load,TResult? Function( RefreshWatchlist value)?  refresh,TResult? Function( SelectWatchlistSort value)?  selectSort,}){
final _that = this;
switch (_that) {
case LoadWatchlist() when load != null:
return load(_that);case RefreshWatchlist() when refresh != null:
return refresh(_that);case SelectWatchlistSort() when selectSort != null:
return selectSort(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  load,TResult Function()?  refresh,TResult Function( WatchlistSort sort)?  selectSort,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadWatchlist() when load != null:
return load();case RefreshWatchlist() when refresh != null:
return refresh();case SelectWatchlistSort() when selectSort != null:
return selectSort(_that.sort);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  load,required TResult Function()  refresh,required TResult Function( WatchlistSort sort)  selectSort,}) {final _that = this;
switch (_that) {
case LoadWatchlist():
return load();case RefreshWatchlist():
return refresh();case SelectWatchlistSort():
return selectSort(_that.sort);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  load,TResult? Function()?  refresh,TResult? Function( WatchlistSort sort)?  selectSort,}) {final _that = this;
switch (_that) {
case LoadWatchlist() when load != null:
return load();case RefreshWatchlist() when refresh != null:
return refresh();case SelectWatchlistSort() when selectSort != null:
return selectSort(_that.sort);case _:
  return null;

}
}

}

/// @nodoc


class LoadWatchlist with DiagnosticableTreeMixin implements WatchlistAction {
  const LoadWatchlist();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
    ..add(DiagnosticsProperty('type', 'WatchlistAction.load'))
    ;
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadWatchlist);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'WatchlistAction.load()';
}


}




/// @nodoc


class RefreshWatchlist with DiagnosticableTreeMixin implements WatchlistAction {
  const RefreshWatchlist();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
    ..add(DiagnosticsProperty('type', 'WatchlistAction.refresh'))
    ;
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is RefreshWatchlist);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'WatchlistAction.refresh()';
}


}




/// @nodoc


class SelectWatchlistSort with DiagnosticableTreeMixin implements WatchlistAction {
  const SelectWatchlistSort(this.sort);
  

 final  WatchlistSort sort;

/// Create a copy of WatchlistAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectWatchlistSortCopyWith<SelectWatchlistSort> get copyWith => _$SelectWatchlistSortCopyWithImpl<SelectWatchlistSort>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
    ..add(DiagnosticsProperty('type', 'WatchlistAction.selectSort'))
    ..add(DiagnosticsProperty('sort', sort));
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectWatchlistSort&&(identical(other.sort, sort) || other.sort == sort));
}


@override
int get hashCode {
    return Object.hash(runtimeType,sort);
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'WatchlistAction.selectSort(sort: $sort)';
}


}

/// @nodoc
abstract mixin class $SelectWatchlistSortCopyWith<$Res> implements $WatchlistActionCopyWith<$Res> {
  factory $SelectWatchlistSortCopyWith(SelectWatchlistSort value, $Res Function(SelectWatchlistSort) _then) = _$SelectWatchlistSortCopyWithImpl;
@useResult
$Res call({
 WatchlistSort sort
});




}
/// @nodoc
class _$SelectWatchlistSortCopyWithImpl<$Res>
    implements $SelectWatchlistSortCopyWith<$Res> {
  _$SelectWatchlistSortCopyWithImpl(this._self, this._then);

  final SelectWatchlistSort _self;
  final $Res Function(SelectWatchlistSort) _then;

/// Create a copy of WatchlistAction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? sort = null,}) {
  return _then(SelectWatchlistSort(
null == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as WatchlistSort,
  ));
}


}

// dart format on
