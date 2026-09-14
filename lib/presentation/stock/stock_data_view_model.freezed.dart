// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stock_data_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StockDataState implements DiagnosticableTreeMixin {

 String get searchQuery; List<StockSearchResult> get searchResults; Map<String, RealtimeQuote> get quotes; StockMetadata? get metadata; List<DailyPrice> get dailyPrices; DailyPricePeriod get selectedPeriod; bool get isSearching; bool get isLoadingQuotes; bool get isLoadingMetadata; bool get isLoadingDailyPrices; StockDataError? get error;
/// Create a copy of StockDataState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StockDataStateCopyWith<StockDataState> get copyWith => _$StockDataStateCopyWithImpl<StockDataState>(this as StockDataState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  final _this = this as StockDataState;
  properties
    ..add(DiagnosticsProperty('type', 'StockDataState'))
    ..add(DiagnosticsProperty('searchQuery', _this.searchQuery))..add(DiagnosticsProperty('searchResults', _this.searchResults))..add(DiagnosticsProperty('quotes', _this.quotes))..add(DiagnosticsProperty('metadata', _this.metadata))..add(DiagnosticsProperty('dailyPrices', _this.dailyPrices))..add(DiagnosticsProperty('selectedPeriod', _this.selectedPeriod))..add(DiagnosticsProperty('isSearching', _this.isSearching))..add(DiagnosticsProperty('isLoadingQuotes', _this.isLoadingQuotes))..add(DiagnosticsProperty('isLoadingMetadata', _this.isLoadingMetadata))..add(DiagnosticsProperty('isLoadingDailyPrices', _this.isLoadingDailyPrices))..add(DiagnosticsProperty('error', _this.error));
}

@override
bool operator ==(Object other) {
  final _this = this as StockDataState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StockDataState&&(identical(other.searchQuery, _this.searchQuery) || other.searchQuery == _this.searchQuery)&&const DeepCollectionEquality().equals(other.searchResults, _this.searchResults)&&const DeepCollectionEquality().equals(other.quotes, _this.quotes)&&(identical(other.metadata, _this.metadata) || other.metadata == _this.metadata)&&const DeepCollectionEquality().equals(other.dailyPrices, _this.dailyPrices)&&(identical(other.selectedPeriod, _this.selectedPeriod) || other.selectedPeriod == _this.selectedPeriod)&&(identical(other.isSearching, _this.isSearching) || other.isSearching == _this.isSearching)&&(identical(other.isLoadingQuotes, _this.isLoadingQuotes) || other.isLoadingQuotes == _this.isLoadingQuotes)&&(identical(other.isLoadingMetadata, _this.isLoadingMetadata) || other.isLoadingMetadata == _this.isLoadingMetadata)&&(identical(other.isLoadingDailyPrices, _this.isLoadingDailyPrices) || other.isLoadingDailyPrices == _this.isLoadingDailyPrices)&&(identical(other.error, _this.error) || other.error == _this.error));
}


@override
int get hashCode {
  final _this = this as StockDataState;
  return Object.hash(runtimeType,_this.searchQuery,const DeepCollectionEquality().hash(_this.searchResults),const DeepCollectionEquality().hash(_this.quotes),_this.metadata,const DeepCollectionEquality().hash(_this.dailyPrices),_this.selectedPeriod,_this.isSearching,_this.isLoadingQuotes,_this.isLoadingMetadata,_this.isLoadingDailyPrices,_this.error);
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  final _this = this as StockDataState;
  return 'StockDataState(searchQuery: ${_this.searchQuery}, searchResults: ${_this.searchResults}, quotes: ${_this.quotes}, metadata: ${_this.metadata}, dailyPrices: ${_this.dailyPrices}, selectedPeriod: ${_this.selectedPeriod}, isSearching: ${_this.isSearching}, isLoadingQuotes: ${_this.isLoadingQuotes}, isLoadingMetadata: ${_this.isLoadingMetadata}, isLoadingDailyPrices: ${_this.isLoadingDailyPrices}, error: ${_this.error})';
}


}

/// @nodoc
abstract mixin class $StockDataStateCopyWith<$Res>  {
  factory $StockDataStateCopyWith(StockDataState value, $Res Function(StockDataState) _then) = _$StockDataStateCopyWithImpl;
@useResult
$Res call({
 String searchQuery, List<StockSearchResult> searchResults, Map<String, RealtimeQuote> quotes, StockMetadata? metadata, List<DailyPrice> dailyPrices, DailyPricePeriod selectedPeriod, bool isSearching, bool isLoadingQuotes, bool isLoadingMetadata, bool isLoadingDailyPrices, StockDataError? error
});


$StockMetadataCopyWith<$Res>? get metadata;

}
/// @nodoc
class _$StockDataStateCopyWithImpl<$Res>
    implements $StockDataStateCopyWith<$Res> {
  _$StockDataStateCopyWithImpl(this._self, this._then);

  final StockDataState _self;
  final $Res Function(StockDataState) _then;

/// Create a copy of StockDataState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? searchQuery = null,Object? searchResults = null,Object? quotes = null,Object? metadata = freezed,Object? dailyPrices = null,Object? selectedPeriod = null,Object? isSearching = null,Object? isLoadingQuotes = null,Object? isLoadingMetadata = null,Object? isLoadingDailyPrices = null,Object? error = freezed,}) {
  return _then(StockDataState(
searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,searchResults: null == searchResults ? _self.searchResults : searchResults // ignore: cast_nullable_to_non_nullable
as List<StockSearchResult>,quotes: null == quotes ? _self.quotes : quotes // ignore: cast_nullable_to_non_nullable
as Map<String, RealtimeQuote>,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as StockMetadata?,dailyPrices: null == dailyPrices ? _self.dailyPrices : dailyPrices // ignore: cast_nullable_to_non_nullable
as List<DailyPrice>,selectedPeriod: null == selectedPeriod ? _self.selectedPeriod : selectedPeriod // ignore: cast_nullable_to_non_nullable
as DailyPricePeriod,isSearching: null == isSearching ? _self.isSearching : isSearching // ignore: cast_nullable_to_non_nullable
as bool,isLoadingQuotes: null == isLoadingQuotes ? _self.isLoadingQuotes : isLoadingQuotes // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMetadata: null == isLoadingMetadata ? _self.isLoadingMetadata : isLoadingMetadata // ignore: cast_nullable_to_non_nullable
as bool,isLoadingDailyPrices: null == isLoadingDailyPrices ? _self.isLoadingDailyPrices : isLoadingDailyPrices // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as StockDataError?,
  ));
}
/// Create a copy of StockDataState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StockMetadataCopyWith<$Res>? get metadata {
    if (_self.metadata == null) {
    return null;
  }

  return $StockMetadataCopyWith<$Res>(_self.metadata!, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}
}


/// Adds pattern-matching-related methods to [StockDataState].
extension StockDataStatePatterns on StockDataState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StockDataState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StockDataState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StockDataState value)  $default,){
final _that = this;
switch (_that) {
case _StockDataState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StockDataState value)?  $default,){
final _that = this;
switch (_that) {
case _StockDataState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String searchQuery,  List<StockSearchResult> searchResults,  Map<String, RealtimeQuote> quotes,  StockMetadata? metadata,  List<DailyPrice> dailyPrices,  DailyPricePeriod selectedPeriod,  bool isSearching,  bool isLoadingQuotes,  bool isLoadingMetadata,  bool isLoadingDailyPrices,  StockDataError? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StockDataState() when $default != null:
return $default(_that.searchQuery,_that.searchResults,_that.quotes,_that.metadata,_that.dailyPrices,_that.selectedPeriod,_that.isSearching,_that.isLoadingQuotes,_that.isLoadingMetadata,_that.isLoadingDailyPrices,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String searchQuery,  List<StockSearchResult> searchResults,  Map<String, RealtimeQuote> quotes,  StockMetadata? metadata,  List<DailyPrice> dailyPrices,  DailyPricePeriod selectedPeriod,  bool isSearching,  bool isLoadingQuotes,  bool isLoadingMetadata,  bool isLoadingDailyPrices,  StockDataError? error)  $default,) {final _that = this;
switch (_that) {
case _StockDataState():
return $default(_that.searchQuery,_that.searchResults,_that.quotes,_that.metadata,_that.dailyPrices,_that.selectedPeriod,_that.isSearching,_that.isLoadingQuotes,_that.isLoadingMetadata,_that.isLoadingDailyPrices,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String searchQuery,  List<StockSearchResult> searchResults,  Map<String, RealtimeQuote> quotes,  StockMetadata? metadata,  List<DailyPrice> dailyPrices,  DailyPricePeriod selectedPeriod,  bool isSearching,  bool isLoadingQuotes,  bool isLoadingMetadata,  bool isLoadingDailyPrices,  StockDataError? error)?  $default,) {final _that = this;
switch (_that) {
case _StockDataState() when $default != null:
return $default(_that.searchQuery,_that.searchResults,_that.quotes,_that.metadata,_that.dailyPrices,_that.selectedPeriod,_that.isSearching,_that.isLoadingQuotes,_that.isLoadingMetadata,_that.isLoadingDailyPrices,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _StockDataState with DiagnosticableTreeMixin implements StockDataState {
  const _StockDataState({this.searchQuery = '',  List<StockSearchResult> searchResults = const <StockSearchResult>[],  Map<String, RealtimeQuote> quotes = const <String, RealtimeQuote>{}, this.metadata,  List<DailyPrice> dailyPrices = const <DailyPrice>[], this.selectedPeriod = DailyPricePeriod.oneMonth, this.isSearching = false, this.isLoadingQuotes = false, this.isLoadingMetadata = false, this.isLoadingDailyPrices = false, this.error}): _searchResults = searchResults,_quotes = quotes,_dailyPrices = dailyPrices;
  

@override@JsonKey() final  String searchQuery;
 final  List<StockSearchResult> _searchResults;
@override@JsonKey() List<StockSearchResult> get searchResults {
  if (_searchResults is EqualUnmodifiableListView) return _searchResults;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_searchResults);
}

 final  Map<String, RealtimeQuote> _quotes;
@override@JsonKey() Map<String, RealtimeQuote> get quotes {
  if (_quotes is EqualUnmodifiableMapView) return _quotes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_quotes);
}

@override final  StockMetadata? metadata;
 final  List<DailyPrice> _dailyPrices;
@override@JsonKey() List<DailyPrice> get dailyPrices {
  if (_dailyPrices is EqualUnmodifiableListView) return _dailyPrices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dailyPrices);
}

@override@JsonKey() final  DailyPricePeriod selectedPeriod;
@override@JsonKey() final  bool isSearching;
@override@JsonKey() final  bool isLoadingQuotes;
@override@JsonKey() final  bool isLoadingMetadata;
@override@JsonKey() final  bool isLoadingDailyPrices;
@override final  StockDataError? error;

/// Create a copy of StockDataState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StockDataStateCopyWith<_StockDataState> get copyWith => __$StockDataStateCopyWithImpl<_StockDataState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
    ..add(DiagnosticsProperty('type', 'StockDataState'))
    ..add(DiagnosticsProperty('searchQuery', searchQuery))..add(DiagnosticsProperty('searchResults', searchResults))..add(DiagnosticsProperty('quotes', quotes))..add(DiagnosticsProperty('metadata', metadata))..add(DiagnosticsProperty('dailyPrices', dailyPrices))..add(DiagnosticsProperty('selectedPeriod', selectedPeriod))..add(DiagnosticsProperty('isSearching', isSearching))..add(DiagnosticsProperty('isLoadingQuotes', isLoadingQuotes))..add(DiagnosticsProperty('isLoadingMetadata', isLoadingMetadata))..add(DiagnosticsProperty('isLoadingDailyPrices', isLoadingDailyPrices))..add(DiagnosticsProperty('error', error));
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _StockDataState&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&const DeepCollectionEquality().equals(other.searchResults, _searchResults)&&const DeepCollectionEquality().equals(other.quotes, _quotes)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&const DeepCollectionEquality().equals(other.dailyPrices, _dailyPrices)&&(identical(other.selectedPeriod, selectedPeriod) || other.selectedPeriod == selectedPeriod)&&(identical(other.isSearching, isSearching) || other.isSearching == isSearching)&&(identical(other.isLoadingQuotes, isLoadingQuotes) || other.isLoadingQuotes == isLoadingQuotes)&&(identical(other.isLoadingMetadata, isLoadingMetadata) || other.isLoadingMetadata == isLoadingMetadata)&&(identical(other.isLoadingDailyPrices, isLoadingDailyPrices) || other.isLoadingDailyPrices == isLoadingDailyPrices)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode {
    return Object.hash(runtimeType,searchQuery,const DeepCollectionEquality().hash(_searchResults),const DeepCollectionEquality().hash(_quotes),metadata,const DeepCollectionEquality().hash(_dailyPrices),selectedPeriod,isSearching,isLoadingQuotes,isLoadingMetadata,isLoadingDailyPrices,error);
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'StockDataState(searchQuery: $searchQuery, searchResults: $searchResults, quotes: $quotes, metadata: $metadata, dailyPrices: $dailyPrices, selectedPeriod: $selectedPeriod, isSearching: $isSearching, isLoadingQuotes: $isLoadingQuotes, isLoadingMetadata: $isLoadingMetadata, isLoadingDailyPrices: $isLoadingDailyPrices, error: $error)';
}


}

/// @nodoc
abstract mixin class _$StockDataStateCopyWith<$Res> implements $StockDataStateCopyWith<$Res> {
  factory _$StockDataStateCopyWith(_StockDataState value, $Res Function(_StockDataState) _then) = __$StockDataStateCopyWithImpl;
@override @useResult
$Res call({
 String searchQuery, List<StockSearchResult> searchResults, Map<String, RealtimeQuote> quotes, StockMetadata? metadata, List<DailyPrice> dailyPrices, DailyPricePeriod selectedPeriod, bool isSearching, bool isLoadingQuotes, bool isLoadingMetadata, bool isLoadingDailyPrices, StockDataError? error
});


@override $StockMetadataCopyWith<$Res>? get metadata;

}
/// @nodoc
class __$StockDataStateCopyWithImpl<$Res>
    implements _$StockDataStateCopyWith<$Res> {
  __$StockDataStateCopyWithImpl(this._self, this._then);

  final _StockDataState _self;
  final $Res Function(_StockDataState) _then;

/// Create a copy of StockDataState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? searchQuery = null,Object? searchResults = null,Object? quotes = null,Object? metadata = freezed,Object? dailyPrices = null,Object? selectedPeriod = null,Object? isSearching = null,Object? isLoadingQuotes = null,Object? isLoadingMetadata = null,Object? isLoadingDailyPrices = null,Object? error = freezed,}) {
  return _then(_StockDataState(
searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,searchResults: null == searchResults ? _self._searchResults : searchResults // ignore: cast_nullable_to_non_nullable
as List<StockSearchResult>,quotes: null == quotes ? _self._quotes : quotes // ignore: cast_nullable_to_non_nullable
as Map<String, RealtimeQuote>,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as StockMetadata?,dailyPrices: null == dailyPrices ? _self._dailyPrices : dailyPrices // ignore: cast_nullable_to_non_nullable
as List<DailyPrice>,selectedPeriod: null == selectedPeriod ? _self.selectedPeriod : selectedPeriod // ignore: cast_nullable_to_non_nullable
as DailyPricePeriod,isSearching: null == isSearching ? _self.isSearching : isSearching // ignore: cast_nullable_to_non_nullable
as bool,isLoadingQuotes: null == isLoadingQuotes ? _self.isLoadingQuotes : isLoadingQuotes // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMetadata: null == isLoadingMetadata ? _self.isLoadingMetadata : isLoadingMetadata // ignore: cast_nullable_to_non_nullable
as bool,isLoadingDailyPrices: null == isLoadingDailyPrices ? _self.isLoadingDailyPrices : isLoadingDailyPrices // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as StockDataError?,
  ));
}

/// Create a copy of StockDataState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StockMetadataCopyWith<$Res>? get metadata {
    if (_self.metadata == null) {
    return null;
  }

  return $StockMetadataCopyWith<$Res>(_self.metadata!, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}
}

/// @nodoc
mixin _$StockDataAction implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
    ..add(DiagnosticsProperty('type', 'StockDataAction'))
    ;
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is StockDataAction);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'StockDataAction()';
}


}

/// @nodoc
class $StockDataActionCopyWith<$Res>  {
$StockDataActionCopyWith(StockDataAction _, $Res Function(StockDataAction) __);
}


/// Adds pattern-matching-related methods to [StockDataAction].
extension StockDataActionPatterns on StockDataAction {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SearchStocks value)?  search,TResult Function( LoadRealtimeQuotes value)?  loadRealtimeQuotes,TResult Function( LoadMetadata value)?  loadMetadata,TResult Function( LoadDailyPrices value)?  loadDailyPrices,TResult Function( ClearStockDataError value)?  clearError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SearchStocks() when search != null:
return search(_that);case LoadRealtimeQuotes() when loadRealtimeQuotes != null:
return loadRealtimeQuotes(_that);case LoadMetadata() when loadMetadata != null:
return loadMetadata(_that);case LoadDailyPrices() when loadDailyPrices != null:
return loadDailyPrices(_that);case ClearStockDataError() when clearError != null:
return clearError(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SearchStocks value)  search,required TResult Function( LoadRealtimeQuotes value)  loadRealtimeQuotes,required TResult Function( LoadMetadata value)  loadMetadata,required TResult Function( LoadDailyPrices value)  loadDailyPrices,required TResult Function( ClearStockDataError value)  clearError,}){
final _that = this;
switch (_that) {
case SearchStocks():
return search(_that);case LoadRealtimeQuotes():
return loadRealtimeQuotes(_that);case LoadMetadata():
return loadMetadata(_that);case LoadDailyPrices():
return loadDailyPrices(_that);case ClearStockDataError():
return clearError(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SearchStocks value)?  search,TResult? Function( LoadRealtimeQuotes value)?  loadRealtimeQuotes,TResult? Function( LoadMetadata value)?  loadMetadata,TResult? Function( LoadDailyPrices value)?  loadDailyPrices,TResult? Function( ClearStockDataError value)?  clearError,}){
final _that = this;
switch (_that) {
case SearchStocks() when search != null:
return search(_that);case LoadRealtimeQuotes() when loadRealtimeQuotes != null:
return loadRealtimeQuotes(_that);case LoadMetadata() when loadMetadata != null:
return loadMetadata(_that);case LoadDailyPrices() when loadDailyPrices != null:
return loadDailyPrices(_that);case ClearStockDataError() when clearError != null:
return clearError(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String query)?  search,TResult Function( List<String> symbols)?  loadRealtimeQuotes,TResult Function( String symbol)?  loadMetadata,TResult Function( String symbol,  DailyPricePeriod period)?  loadDailyPrices,TResult Function()?  clearError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SearchStocks() when search != null:
return search(_that.query);case LoadRealtimeQuotes() when loadRealtimeQuotes != null:
return loadRealtimeQuotes(_that.symbols);case LoadMetadata() when loadMetadata != null:
return loadMetadata(_that.symbol);case LoadDailyPrices() when loadDailyPrices != null:
return loadDailyPrices(_that.symbol,_that.period);case ClearStockDataError() when clearError != null:
return clearError();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String query)  search,required TResult Function( List<String> symbols)  loadRealtimeQuotes,required TResult Function( String symbol)  loadMetadata,required TResult Function( String symbol,  DailyPricePeriod period)  loadDailyPrices,required TResult Function()  clearError,}) {final _that = this;
switch (_that) {
case SearchStocks():
return search(_that.query);case LoadRealtimeQuotes():
return loadRealtimeQuotes(_that.symbols);case LoadMetadata():
return loadMetadata(_that.symbol);case LoadDailyPrices():
return loadDailyPrices(_that.symbol,_that.period);case ClearStockDataError():
return clearError();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String query)?  search,TResult? Function( List<String> symbols)?  loadRealtimeQuotes,TResult? Function( String symbol)?  loadMetadata,TResult? Function( String symbol,  DailyPricePeriod period)?  loadDailyPrices,TResult? Function()?  clearError,}) {final _that = this;
switch (_that) {
case SearchStocks() when search != null:
return search(_that.query);case LoadRealtimeQuotes() when loadRealtimeQuotes != null:
return loadRealtimeQuotes(_that.symbols);case LoadMetadata() when loadMetadata != null:
return loadMetadata(_that.symbol);case LoadDailyPrices() when loadDailyPrices != null:
return loadDailyPrices(_that.symbol,_that.period);case ClearStockDataError() when clearError != null:
return clearError();case _:
  return null;

}
}

}

/// @nodoc


class SearchStocks with DiagnosticableTreeMixin implements StockDataAction {
  const SearchStocks(this.query);
  

 final  String query;

/// Create a copy of StockDataAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchStocksCopyWith<SearchStocks> get copyWith => _$SearchStocksCopyWithImpl<SearchStocks>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
    ..add(DiagnosticsProperty('type', 'StockDataAction.search'))
    ..add(DiagnosticsProperty('query', query));
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchStocks&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode {
    return Object.hash(runtimeType,query);
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'StockDataAction.search(query: $query)';
}


}

/// @nodoc
abstract mixin class $SearchStocksCopyWith<$Res> implements $StockDataActionCopyWith<$Res> {
  factory $SearchStocksCopyWith(SearchStocks value, $Res Function(SearchStocks) _then) = _$SearchStocksCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class _$SearchStocksCopyWithImpl<$Res>
    implements $SearchStocksCopyWith<$Res> {
  _$SearchStocksCopyWithImpl(this._self, this._then);

  final SearchStocks _self;
  final $Res Function(SearchStocks) _then;

/// Create a copy of StockDataAction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(SearchStocks(
null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class LoadRealtimeQuotes with DiagnosticableTreeMixin implements StockDataAction {
  const LoadRealtimeQuotes( List<String> symbols): _symbols = symbols;
  

 final  List<String> _symbols;
 List<String> get symbols {
  if (_symbols is EqualUnmodifiableListView) return _symbols;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_symbols);
}


/// Create a copy of StockDataAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadRealtimeQuotesCopyWith<LoadRealtimeQuotes> get copyWith => _$LoadRealtimeQuotesCopyWithImpl<LoadRealtimeQuotes>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
    ..add(DiagnosticsProperty('type', 'StockDataAction.loadRealtimeQuotes'))
    ..add(DiagnosticsProperty('symbols', symbols));
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadRealtimeQuotes&&const DeepCollectionEquality().equals(other.symbols, _symbols));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_symbols));
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'StockDataAction.loadRealtimeQuotes(symbols: $symbols)';
}


}

/// @nodoc
abstract mixin class $LoadRealtimeQuotesCopyWith<$Res> implements $StockDataActionCopyWith<$Res> {
  factory $LoadRealtimeQuotesCopyWith(LoadRealtimeQuotes value, $Res Function(LoadRealtimeQuotes) _then) = _$LoadRealtimeQuotesCopyWithImpl;
@useResult
$Res call({
 List<String> symbols
});




}
/// @nodoc
class _$LoadRealtimeQuotesCopyWithImpl<$Res>
    implements $LoadRealtimeQuotesCopyWith<$Res> {
  _$LoadRealtimeQuotesCopyWithImpl(this._self, this._then);

  final LoadRealtimeQuotes _self;
  final $Res Function(LoadRealtimeQuotes) _then;

/// Create a copy of StockDataAction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? symbols = null,}) {
  return _then(LoadRealtimeQuotes(
null == symbols ? _self._symbols : symbols // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

/// @nodoc


class LoadMetadata with DiagnosticableTreeMixin implements StockDataAction {
  const LoadMetadata(this.symbol);
  

 final  String symbol;

/// Create a copy of StockDataAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadMetadataCopyWith<LoadMetadata> get copyWith => _$LoadMetadataCopyWithImpl<LoadMetadata>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
    ..add(DiagnosticsProperty('type', 'StockDataAction.loadMetadata'))
    ..add(DiagnosticsProperty('symbol', symbol));
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadMetadata&&(identical(other.symbol, symbol) || other.symbol == symbol));
}


@override
int get hashCode {
    return Object.hash(runtimeType,symbol);
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'StockDataAction.loadMetadata(symbol: $symbol)';
}


}

/// @nodoc
abstract mixin class $LoadMetadataCopyWith<$Res> implements $StockDataActionCopyWith<$Res> {
  factory $LoadMetadataCopyWith(LoadMetadata value, $Res Function(LoadMetadata) _then) = _$LoadMetadataCopyWithImpl;
@useResult
$Res call({
 String symbol
});




}
/// @nodoc
class _$LoadMetadataCopyWithImpl<$Res>
    implements $LoadMetadataCopyWith<$Res> {
  _$LoadMetadataCopyWithImpl(this._self, this._then);

  final LoadMetadata _self;
  final $Res Function(LoadMetadata) _then;

/// Create a copy of StockDataAction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? symbol = null,}) {
  return _then(LoadMetadata(
null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class LoadDailyPrices with DiagnosticableTreeMixin implements StockDataAction {
  const LoadDailyPrices(this.symbol, this.period);
  

 final  String symbol;
 final  DailyPricePeriod period;

/// Create a copy of StockDataAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadDailyPricesCopyWith<LoadDailyPrices> get copyWith => _$LoadDailyPricesCopyWithImpl<LoadDailyPrices>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
    ..add(DiagnosticsProperty('type', 'StockDataAction.loadDailyPrices'))
    ..add(DiagnosticsProperty('symbol', symbol))..add(DiagnosticsProperty('period', period));
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadDailyPrices&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.period, period) || other.period == period));
}


@override
int get hashCode {
    return Object.hash(runtimeType,symbol,period);
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'StockDataAction.loadDailyPrices(symbol: $symbol, period: $period)';
}


}

/// @nodoc
abstract mixin class $LoadDailyPricesCopyWith<$Res> implements $StockDataActionCopyWith<$Res> {
  factory $LoadDailyPricesCopyWith(LoadDailyPrices value, $Res Function(LoadDailyPrices) _then) = _$LoadDailyPricesCopyWithImpl;
@useResult
$Res call({
 String symbol, DailyPricePeriod period
});




}
/// @nodoc
class _$LoadDailyPricesCopyWithImpl<$Res>
    implements $LoadDailyPricesCopyWith<$Res> {
  _$LoadDailyPricesCopyWithImpl(this._self, this._then);

  final LoadDailyPrices _self;
  final $Res Function(LoadDailyPrices) _then;

/// Create a copy of StockDataAction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? symbol = null,Object? period = null,}) {
  return _then(LoadDailyPrices(
null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as DailyPricePeriod,
  ));
}


}

/// @nodoc


class ClearStockDataError with DiagnosticableTreeMixin implements StockDataAction {
  const ClearStockDataError();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
    ..add(DiagnosticsProperty('type', 'StockDataAction.clearError'))
    ;
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ClearStockDataError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'StockDataAction.clearError()';
}


}




// dart format on
