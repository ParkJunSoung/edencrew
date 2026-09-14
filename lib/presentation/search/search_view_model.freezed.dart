// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SearchState implements DiagnosticableTreeMixin {

 String get query; List<StockSearchResult> get results; Set<String> get favoriteSymbols; bool get isSearching; StockDataError? get error;
/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchStateCopyWith<SearchState> get copyWith => _$SearchStateCopyWithImpl<SearchState>(this as SearchState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  final _this = this as SearchState;
  properties
    ..add(DiagnosticsProperty('type', 'SearchState'))
    ..add(DiagnosticsProperty('query', _this.query))..add(DiagnosticsProperty('results', _this.results))..add(DiagnosticsProperty('favoriteSymbols', _this.favoriteSymbols))..add(DiagnosticsProperty('isSearching', _this.isSearching))..add(DiagnosticsProperty('error', _this.error));
}

@override
bool operator ==(Object other) {
  final _this = this as SearchState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchState&&(identical(other.query, _this.query) || other.query == _this.query)&&const DeepCollectionEquality().equals(other.results, _this.results)&&const DeepCollectionEquality().equals(other.favoriteSymbols, _this.favoriteSymbols)&&(identical(other.isSearching, _this.isSearching) || other.isSearching == _this.isSearching)&&(identical(other.error, _this.error) || other.error == _this.error));
}


@override
int get hashCode {
  final _this = this as SearchState;
  return Object.hash(runtimeType,_this.query,const DeepCollectionEquality().hash(_this.results),const DeepCollectionEquality().hash(_this.favoriteSymbols),_this.isSearching,_this.error);
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  final _this = this as SearchState;
  return 'SearchState(query: ${_this.query}, results: ${_this.results}, favoriteSymbols: ${_this.favoriteSymbols}, isSearching: ${_this.isSearching}, error: ${_this.error})';
}


}

/// @nodoc
abstract mixin class $SearchStateCopyWith<$Res>  {
  factory $SearchStateCopyWith(SearchState value, $Res Function(SearchState) _then) = _$SearchStateCopyWithImpl;
@useResult
$Res call({
 String query, List<StockSearchResult> results, Set<String> favoriteSymbols, bool isSearching, StockDataError? error
});




}
/// @nodoc
class _$SearchStateCopyWithImpl<$Res>
    implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._self, this._then);

  final SearchState _self;
  final $Res Function(SearchState) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? query = null,Object? results = null,Object? favoriteSymbols = null,Object? isSearching = null,Object? error = freezed,}) {
  return _then(SearchState(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<StockSearchResult>,favoriteSymbols: null == favoriteSymbols ? _self.favoriteSymbols : favoriteSymbols // ignore: cast_nullable_to_non_nullable
as Set<String>,isSearching: null == isSearching ? _self.isSearching : isSearching // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as StockDataError?,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchState].
extension SearchStatePatterns on SearchState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchState value)  $default,){
final _that = this;
switch (_that) {
case _SearchState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchState value)?  $default,){
final _that = this;
switch (_that) {
case _SearchState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String query,  List<StockSearchResult> results,  Set<String> favoriteSymbols,  bool isSearching,  StockDataError? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchState() when $default != null:
return $default(_that.query,_that.results,_that.favoriteSymbols,_that.isSearching,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String query,  List<StockSearchResult> results,  Set<String> favoriteSymbols,  bool isSearching,  StockDataError? error)  $default,) {final _that = this;
switch (_that) {
case _SearchState():
return $default(_that.query,_that.results,_that.favoriteSymbols,_that.isSearching,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String query,  List<StockSearchResult> results,  Set<String> favoriteSymbols,  bool isSearching,  StockDataError? error)?  $default,) {final _that = this;
switch (_that) {
case _SearchState() when $default != null:
return $default(_that.query,_that.results,_that.favoriteSymbols,_that.isSearching,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _SearchState with DiagnosticableTreeMixin implements SearchState {
  const _SearchState({this.query = '',  List<StockSearchResult> results = const <StockSearchResult>[],  Set<String> favoriteSymbols = const <String>{}, this.isSearching = false, this.error}): _results = results,_favoriteSymbols = favoriteSymbols;
  

@override@JsonKey() final  String query;
 final  List<StockSearchResult> _results;
@override@JsonKey() List<StockSearchResult> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}

 final  Set<String> _favoriteSymbols;
@override@JsonKey() Set<String> get favoriteSymbols {
  if (_favoriteSymbols is EqualUnmodifiableSetView) return _favoriteSymbols;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_favoriteSymbols);
}

@override@JsonKey() final  bool isSearching;
@override final  StockDataError? error;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchStateCopyWith<_SearchState> get copyWith => __$SearchStateCopyWithImpl<_SearchState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
    ..add(DiagnosticsProperty('type', 'SearchState'))
    ..add(DiagnosticsProperty('query', query))..add(DiagnosticsProperty('results', results))..add(DiagnosticsProperty('favoriteSymbols', favoriteSymbols))..add(DiagnosticsProperty('isSearching', isSearching))..add(DiagnosticsProperty('error', error));
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchState&&(identical(other.query, query) || other.query == query)&&const DeepCollectionEquality().equals(other.results, _results)&&const DeepCollectionEquality().equals(other.favoriteSymbols, _favoriteSymbols)&&(identical(other.isSearching, isSearching) || other.isSearching == isSearching)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode {
    return Object.hash(runtimeType,query,const DeepCollectionEquality().hash(_results),const DeepCollectionEquality().hash(_favoriteSymbols),isSearching,error);
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'SearchState(query: $query, results: $results, favoriteSymbols: $favoriteSymbols, isSearching: $isSearching, error: $error)';
}


}

/// @nodoc
abstract mixin class _$SearchStateCopyWith<$Res> implements $SearchStateCopyWith<$Res> {
  factory _$SearchStateCopyWith(_SearchState value, $Res Function(_SearchState) _then) = __$SearchStateCopyWithImpl;
@override @useResult
$Res call({
 String query, List<StockSearchResult> results, Set<String> favoriteSymbols, bool isSearching, StockDataError? error
});




}
/// @nodoc
class __$SearchStateCopyWithImpl<$Res>
    implements _$SearchStateCopyWith<$Res> {
  __$SearchStateCopyWithImpl(this._self, this._then);

  final _SearchState _self;
  final $Res Function(_SearchState) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? query = null,Object? results = null,Object? favoriteSymbols = null,Object? isSearching = null,Object? error = freezed,}) {
  return _then(_SearchState(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<StockSearchResult>,favoriteSymbols: null == favoriteSymbols ? _self._favoriteSymbols : favoriteSymbols // ignore: cast_nullable_to_non_nullable
as Set<String>,isSearching: null == isSearching ? _self.isSearching : isSearching // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as StockDataError?,
  ));
}


}

/// @nodoc
mixin _$SearchAction implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
    ..add(DiagnosticsProperty('type', 'SearchAction'))
    ;
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchAction);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'SearchAction()';
}


}

/// @nodoc
class $SearchActionCopyWith<$Res>  {
$SearchActionCopyWith(SearchAction _, $Res Function(SearchAction) __);
}


/// Adds pattern-matching-related methods to [SearchAction].
extension SearchActionPatterns on SearchAction {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadSearch value)?  load,TResult Function( SearchQueryChanged value)?  queryChanged,TResult Function( ToggleSearchFavorite value)?  toggleFavorite,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadSearch() when load != null:
return load(_that);case SearchQueryChanged() when queryChanged != null:
return queryChanged(_that);case ToggleSearchFavorite() when toggleFavorite != null:
return toggleFavorite(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadSearch value)  load,required TResult Function( SearchQueryChanged value)  queryChanged,required TResult Function( ToggleSearchFavorite value)  toggleFavorite,}){
final _that = this;
switch (_that) {
case LoadSearch():
return load(_that);case SearchQueryChanged():
return queryChanged(_that);case ToggleSearchFavorite():
return toggleFavorite(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadSearch value)?  load,TResult? Function( SearchQueryChanged value)?  queryChanged,TResult? Function( ToggleSearchFavorite value)?  toggleFavorite,}){
final _that = this;
switch (_that) {
case LoadSearch() when load != null:
return load(_that);case SearchQueryChanged() when queryChanged != null:
return queryChanged(_that);case ToggleSearchFavorite() when toggleFavorite != null:
return toggleFavorite(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  load,TResult Function( String query)?  queryChanged,TResult Function( StockSearchResult stock)?  toggleFavorite,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadSearch() when load != null:
return load();case SearchQueryChanged() when queryChanged != null:
return queryChanged(_that.query);case ToggleSearchFavorite() when toggleFavorite != null:
return toggleFavorite(_that.stock);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  load,required TResult Function( String query)  queryChanged,required TResult Function( StockSearchResult stock)  toggleFavorite,}) {final _that = this;
switch (_that) {
case LoadSearch():
return load();case SearchQueryChanged():
return queryChanged(_that.query);case ToggleSearchFavorite():
return toggleFavorite(_that.stock);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  load,TResult? Function( String query)?  queryChanged,TResult? Function( StockSearchResult stock)?  toggleFavorite,}) {final _that = this;
switch (_that) {
case LoadSearch() when load != null:
return load();case SearchQueryChanged() when queryChanged != null:
return queryChanged(_that.query);case ToggleSearchFavorite() when toggleFavorite != null:
return toggleFavorite(_that.stock);case _:
  return null;

}
}

}

/// @nodoc


class LoadSearch with DiagnosticableTreeMixin implements SearchAction {
  const LoadSearch();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
    ..add(DiagnosticsProperty('type', 'SearchAction.load'))
    ;
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadSearch);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'SearchAction.load()';
}


}




/// @nodoc


class SearchQueryChanged with DiagnosticableTreeMixin implements SearchAction {
  const SearchQueryChanged(this.query);
  

 final  String query;

/// Create a copy of SearchAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchQueryChangedCopyWith<SearchQueryChanged> get copyWith => _$SearchQueryChangedCopyWithImpl<SearchQueryChanged>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
    ..add(DiagnosticsProperty('type', 'SearchAction.queryChanged'))
    ..add(DiagnosticsProperty('query', query));
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchQueryChanged&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode {
    return Object.hash(runtimeType,query);
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'SearchAction.queryChanged(query: $query)';
}


}

/// @nodoc
abstract mixin class $SearchQueryChangedCopyWith<$Res> implements $SearchActionCopyWith<$Res> {
  factory $SearchQueryChangedCopyWith(SearchQueryChanged value, $Res Function(SearchQueryChanged) _then) = _$SearchQueryChangedCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class _$SearchQueryChangedCopyWithImpl<$Res>
    implements $SearchQueryChangedCopyWith<$Res> {
  _$SearchQueryChangedCopyWithImpl(this._self, this._then);

  final SearchQueryChanged _self;
  final $Res Function(SearchQueryChanged) _then;

/// Create a copy of SearchAction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(SearchQueryChanged(
null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ToggleSearchFavorite with DiagnosticableTreeMixin implements SearchAction {
  const ToggleSearchFavorite(this.stock);
  

 final  StockSearchResult stock;

/// Create a copy of SearchAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToggleSearchFavoriteCopyWith<ToggleSearchFavorite> get copyWith => _$ToggleSearchFavoriteCopyWithImpl<ToggleSearchFavorite>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
    ..add(DiagnosticsProperty('type', 'SearchAction.toggleFavorite'))
    ..add(DiagnosticsProperty('stock', stock));
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ToggleSearchFavorite&&(identical(other.stock, stock) || other.stock == stock));
}


@override
int get hashCode {
    return Object.hash(runtimeType,stock);
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'SearchAction.toggleFavorite(stock: $stock)';
}


}

/// @nodoc
abstract mixin class $ToggleSearchFavoriteCopyWith<$Res> implements $SearchActionCopyWith<$Res> {
  factory $ToggleSearchFavoriteCopyWith(ToggleSearchFavorite value, $Res Function(ToggleSearchFavorite) _then) = _$ToggleSearchFavoriteCopyWithImpl;
@useResult
$Res call({
 StockSearchResult stock
});


$StockSearchResultCopyWith<$Res> get stock;

}
/// @nodoc
class _$ToggleSearchFavoriteCopyWithImpl<$Res>
    implements $ToggleSearchFavoriteCopyWith<$Res> {
  _$ToggleSearchFavoriteCopyWithImpl(this._self, this._then);

  final ToggleSearchFavorite _self;
  final $Res Function(ToggleSearchFavorite) _then;

/// Create a copy of SearchAction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? stock = null,}) {
  return _then(ToggleSearchFavorite(
null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as StockSearchResult,
  ));
}

/// Create a copy of SearchAction
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StockSearchResultCopyWith<$Res> get stock {
  
  return $StockSearchResultCopyWith<$Res>(_self.stock, (value) {
    return _then(_self.copyWith(stock: value));
  });
}
}

// dart format on
