// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stock_detail_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StockDetailState implements DiagnosticableTreeMixin {

 StockMetadata get stock; RealtimeQuote? get quote; List<StockDetailDailyRow> get dailyRows; DailyPricePeriod get selectedPeriod; bool get isFavorite; bool get isLoadingQuote; bool get isLoadingDailyPrices; StockDataError? get error;
/// Create a copy of StockDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StockDetailStateCopyWith<StockDetailState> get copyWith => _$StockDetailStateCopyWithImpl<StockDetailState>(this as StockDetailState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  final _this = this as StockDetailState;
  properties
    ..add(DiagnosticsProperty('type', 'StockDetailState'))
    ..add(DiagnosticsProperty('stock', _this.stock))..add(DiagnosticsProperty('quote', _this.quote))..add(DiagnosticsProperty('dailyRows', _this.dailyRows))..add(DiagnosticsProperty('selectedPeriod', _this.selectedPeriod))..add(DiagnosticsProperty('isFavorite', _this.isFavorite))..add(DiagnosticsProperty('isLoadingQuote', _this.isLoadingQuote))..add(DiagnosticsProperty('isLoadingDailyPrices', _this.isLoadingDailyPrices))..add(DiagnosticsProperty('error', _this.error));
}

@override
bool operator ==(Object other) {
  final _this = this as StockDetailState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StockDetailState&&(identical(other.stock, _this.stock) || other.stock == _this.stock)&&(identical(other.quote, _this.quote) || other.quote == _this.quote)&&const DeepCollectionEquality().equals(other.dailyRows, _this.dailyRows)&&(identical(other.selectedPeriod, _this.selectedPeriod) || other.selectedPeriod == _this.selectedPeriod)&&(identical(other.isFavorite, _this.isFavorite) || other.isFavorite == _this.isFavorite)&&(identical(other.isLoadingQuote, _this.isLoadingQuote) || other.isLoadingQuote == _this.isLoadingQuote)&&(identical(other.isLoadingDailyPrices, _this.isLoadingDailyPrices) || other.isLoadingDailyPrices == _this.isLoadingDailyPrices)&&(identical(other.error, _this.error) || other.error == _this.error));
}


@override
int get hashCode {
  final _this = this as StockDetailState;
  return Object.hash(runtimeType,_this.stock,_this.quote,const DeepCollectionEquality().hash(_this.dailyRows),_this.selectedPeriod,_this.isFavorite,_this.isLoadingQuote,_this.isLoadingDailyPrices,_this.error);
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  final _this = this as StockDetailState;
  return 'StockDetailState(stock: ${_this.stock}, quote: ${_this.quote}, dailyRows: ${_this.dailyRows}, selectedPeriod: ${_this.selectedPeriod}, isFavorite: ${_this.isFavorite}, isLoadingQuote: ${_this.isLoadingQuote}, isLoadingDailyPrices: ${_this.isLoadingDailyPrices}, error: ${_this.error})';
}


}

/// @nodoc
abstract mixin class $StockDetailStateCopyWith<$Res>  {
  factory $StockDetailStateCopyWith(StockDetailState value, $Res Function(StockDetailState) _then) = _$StockDetailStateCopyWithImpl;
@useResult
$Res call({
 StockMetadata stock, RealtimeQuote? quote, List<StockDetailDailyRow> dailyRows, DailyPricePeriod selectedPeriod, bool isFavorite, bool isLoadingQuote, bool isLoadingDailyPrices, StockDataError? error
});


$StockMetadataCopyWith<$Res> get stock;$RealtimeQuoteCopyWith<$Res>? get quote;

}
/// @nodoc
class _$StockDetailStateCopyWithImpl<$Res>
    implements $StockDetailStateCopyWith<$Res> {
  _$StockDetailStateCopyWithImpl(this._self, this._then);

  final StockDetailState _self;
  final $Res Function(StockDetailState) _then;

/// Create a copy of StockDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stock = null,Object? quote = freezed,Object? dailyRows = null,Object? selectedPeriod = null,Object? isFavorite = null,Object? isLoadingQuote = null,Object? isLoadingDailyPrices = null,Object? error = freezed,}) {
  return _then(StockDetailState(
stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as StockMetadata,quote: freezed == quote ? _self.quote : quote // ignore: cast_nullable_to_non_nullable
as RealtimeQuote?,dailyRows: null == dailyRows ? _self.dailyRows : dailyRows // ignore: cast_nullable_to_non_nullable
as List<StockDetailDailyRow>,selectedPeriod: null == selectedPeriod ? _self.selectedPeriod : selectedPeriod // ignore: cast_nullable_to_non_nullable
as DailyPricePeriod,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,isLoadingQuote: null == isLoadingQuote ? _self.isLoadingQuote : isLoadingQuote // ignore: cast_nullable_to_non_nullable
as bool,isLoadingDailyPrices: null == isLoadingDailyPrices ? _self.isLoadingDailyPrices : isLoadingDailyPrices // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as StockDataError?,
  ));
}
/// Create a copy of StockDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StockMetadataCopyWith<$Res> get stock {
  
  return $StockMetadataCopyWith<$Res>(_self.stock, (value) {
    return _then(_self.copyWith(stock: value));
  });
}/// Create a copy of StockDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RealtimeQuoteCopyWith<$Res>? get quote {
    if (_self.quote == null) {
    return null;
  }

  return $RealtimeQuoteCopyWith<$Res>(_self.quote!, (value) {
    return _then(_self.copyWith(quote: value));
  });
}
}


/// Adds pattern-matching-related methods to [StockDetailState].
extension StockDetailStatePatterns on StockDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StockDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StockDetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StockDetailState value)  $default,){
final _that = this;
switch (_that) {
case _StockDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StockDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _StockDetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( StockMetadata stock,  RealtimeQuote? quote,  List<StockDetailDailyRow> dailyRows,  DailyPricePeriod selectedPeriod,  bool isFavorite,  bool isLoadingQuote,  bool isLoadingDailyPrices,  StockDataError? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StockDetailState() when $default != null:
return $default(_that.stock,_that.quote,_that.dailyRows,_that.selectedPeriod,_that.isFavorite,_that.isLoadingQuote,_that.isLoadingDailyPrices,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( StockMetadata stock,  RealtimeQuote? quote,  List<StockDetailDailyRow> dailyRows,  DailyPricePeriod selectedPeriod,  bool isFavorite,  bool isLoadingQuote,  bool isLoadingDailyPrices,  StockDataError? error)  $default,) {final _that = this;
switch (_that) {
case _StockDetailState():
return $default(_that.stock,_that.quote,_that.dailyRows,_that.selectedPeriod,_that.isFavorite,_that.isLoadingQuote,_that.isLoadingDailyPrices,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( StockMetadata stock,  RealtimeQuote? quote,  List<StockDetailDailyRow> dailyRows,  DailyPricePeriod selectedPeriod,  bool isFavorite,  bool isLoadingQuote,  bool isLoadingDailyPrices,  StockDataError? error)?  $default,) {final _that = this;
switch (_that) {
case _StockDetailState() when $default != null:
return $default(_that.stock,_that.quote,_that.dailyRows,_that.selectedPeriod,_that.isFavorite,_that.isLoadingQuote,_that.isLoadingDailyPrices,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _StockDetailState with DiagnosticableTreeMixin implements StockDetailState {
  const _StockDetailState({required this.stock, this.quote,  List<StockDetailDailyRow> dailyRows = const <StockDetailDailyRow>[], this.selectedPeriod = DailyPricePeriod.oneMonth, this.isFavorite = false, this.isLoadingQuote = false, this.isLoadingDailyPrices = false, this.error}): _dailyRows = dailyRows;
  

@override final  StockMetadata stock;
@override final  RealtimeQuote? quote;
 final  List<StockDetailDailyRow> _dailyRows;
@override@JsonKey() List<StockDetailDailyRow> get dailyRows {
  if (_dailyRows is EqualUnmodifiableListView) return _dailyRows;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dailyRows);
}

@override@JsonKey() final  DailyPricePeriod selectedPeriod;
@override@JsonKey() final  bool isFavorite;
@override@JsonKey() final  bool isLoadingQuote;
@override@JsonKey() final  bool isLoadingDailyPrices;
@override final  StockDataError? error;

/// Create a copy of StockDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StockDetailStateCopyWith<_StockDetailState> get copyWith => __$StockDetailStateCopyWithImpl<_StockDetailState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
    ..add(DiagnosticsProperty('type', 'StockDetailState'))
    ..add(DiagnosticsProperty('stock', stock))..add(DiagnosticsProperty('quote', quote))..add(DiagnosticsProperty('dailyRows', dailyRows))..add(DiagnosticsProperty('selectedPeriod', selectedPeriod))..add(DiagnosticsProperty('isFavorite', isFavorite))..add(DiagnosticsProperty('isLoadingQuote', isLoadingQuote))..add(DiagnosticsProperty('isLoadingDailyPrices', isLoadingDailyPrices))..add(DiagnosticsProperty('error', error));
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _StockDetailState&&(identical(other.stock, stock) || other.stock == stock)&&(identical(other.quote, quote) || other.quote == quote)&&const DeepCollectionEquality().equals(other.dailyRows, _dailyRows)&&(identical(other.selectedPeriod, selectedPeriod) || other.selectedPeriod == selectedPeriod)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&(identical(other.isLoadingQuote, isLoadingQuote) || other.isLoadingQuote == isLoadingQuote)&&(identical(other.isLoadingDailyPrices, isLoadingDailyPrices) || other.isLoadingDailyPrices == isLoadingDailyPrices)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode {
    return Object.hash(runtimeType,stock,quote,const DeepCollectionEquality().hash(_dailyRows),selectedPeriod,isFavorite,isLoadingQuote,isLoadingDailyPrices,error);
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'StockDetailState(stock: $stock, quote: $quote, dailyRows: $dailyRows, selectedPeriod: $selectedPeriod, isFavorite: $isFavorite, isLoadingQuote: $isLoadingQuote, isLoadingDailyPrices: $isLoadingDailyPrices, error: $error)';
}


}

/// @nodoc
abstract mixin class _$StockDetailStateCopyWith<$Res> implements $StockDetailStateCopyWith<$Res> {
  factory _$StockDetailStateCopyWith(_StockDetailState value, $Res Function(_StockDetailState) _then) = __$StockDetailStateCopyWithImpl;
@override @useResult
$Res call({
 StockMetadata stock, RealtimeQuote? quote, List<StockDetailDailyRow> dailyRows, DailyPricePeriod selectedPeriod, bool isFavorite, bool isLoadingQuote, bool isLoadingDailyPrices, StockDataError? error
});


@override $StockMetadataCopyWith<$Res> get stock;@override $RealtimeQuoteCopyWith<$Res>? get quote;

}
/// @nodoc
class __$StockDetailStateCopyWithImpl<$Res>
    implements _$StockDetailStateCopyWith<$Res> {
  __$StockDetailStateCopyWithImpl(this._self, this._then);

  final _StockDetailState _self;
  final $Res Function(_StockDetailState) _then;

/// Create a copy of StockDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stock = null,Object? quote = freezed,Object? dailyRows = null,Object? selectedPeriod = null,Object? isFavorite = null,Object? isLoadingQuote = null,Object? isLoadingDailyPrices = null,Object? error = freezed,}) {
  return _then(_StockDetailState(
stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as StockMetadata,quote: freezed == quote ? _self.quote : quote // ignore: cast_nullable_to_non_nullable
as RealtimeQuote?,dailyRows: null == dailyRows ? _self._dailyRows : dailyRows // ignore: cast_nullable_to_non_nullable
as List<StockDetailDailyRow>,selectedPeriod: null == selectedPeriod ? _self.selectedPeriod : selectedPeriod // ignore: cast_nullable_to_non_nullable
as DailyPricePeriod,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,isLoadingQuote: null == isLoadingQuote ? _self.isLoadingQuote : isLoadingQuote // ignore: cast_nullable_to_non_nullable
as bool,isLoadingDailyPrices: null == isLoadingDailyPrices ? _self.isLoadingDailyPrices : isLoadingDailyPrices // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as StockDataError?,
  ));
}

/// Create a copy of StockDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StockMetadataCopyWith<$Res> get stock {
  
  return $StockMetadataCopyWith<$Res>(_self.stock, (value) {
    return _then(_self.copyWith(stock: value));
  });
}/// Create a copy of StockDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RealtimeQuoteCopyWith<$Res>? get quote {
    if (_self.quote == null) {
    return null;
  }

  return $RealtimeQuoteCopyWith<$Res>(_self.quote!, (value) {
    return _then(_self.copyWith(quote: value));
  });
}
}

/// @nodoc
mixin _$StockDetailAction implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
    ..add(DiagnosticsProperty('type', 'StockDetailAction'))
    ;
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is StockDetailAction);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'StockDetailAction()';
}


}

/// @nodoc
class $StockDetailActionCopyWith<$Res>  {
$StockDetailActionCopyWith(StockDetailAction _, $Res Function(StockDetailAction) __);
}


/// Adds pattern-matching-related methods to [StockDetailAction].
extension StockDetailActionPatterns on StockDetailAction {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadStockDetail value)?  load,TResult Function( SelectStockDetailPeriod value)?  selectPeriod,TResult Function( ToggleDetailFavorite value)?  toggleFavorite,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadStockDetail() when load != null:
return load(_that);case SelectStockDetailPeriod() when selectPeriod != null:
return selectPeriod(_that);case ToggleDetailFavorite() when toggleFavorite != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadStockDetail value)  load,required TResult Function( SelectStockDetailPeriod value)  selectPeriod,required TResult Function( ToggleDetailFavorite value)  toggleFavorite,}){
final _that = this;
switch (_that) {
case LoadStockDetail():
return load(_that);case SelectStockDetailPeriod():
return selectPeriod(_that);case ToggleDetailFavorite():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadStockDetail value)?  load,TResult? Function( SelectStockDetailPeriod value)?  selectPeriod,TResult? Function( ToggleDetailFavorite value)?  toggleFavorite,}){
final _that = this;
switch (_that) {
case LoadStockDetail() when load != null:
return load(_that);case SelectStockDetailPeriod() when selectPeriod != null:
return selectPeriod(_that);case ToggleDetailFavorite() when toggleFavorite != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  load,TResult Function( DailyPricePeriod period)?  selectPeriod,TResult Function()?  toggleFavorite,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadStockDetail() when load != null:
return load();case SelectStockDetailPeriod() when selectPeriod != null:
return selectPeriod(_that.period);case ToggleDetailFavorite() when toggleFavorite != null:
return toggleFavorite();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  load,required TResult Function( DailyPricePeriod period)  selectPeriod,required TResult Function()  toggleFavorite,}) {final _that = this;
switch (_that) {
case LoadStockDetail():
return load();case SelectStockDetailPeriod():
return selectPeriod(_that.period);case ToggleDetailFavorite():
return toggleFavorite();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  load,TResult? Function( DailyPricePeriod period)?  selectPeriod,TResult? Function()?  toggleFavorite,}) {final _that = this;
switch (_that) {
case LoadStockDetail() when load != null:
return load();case SelectStockDetailPeriod() when selectPeriod != null:
return selectPeriod(_that.period);case ToggleDetailFavorite() when toggleFavorite != null:
return toggleFavorite();case _:
  return null;

}
}

}

/// @nodoc


class LoadStockDetail with DiagnosticableTreeMixin implements StockDetailAction {
  const LoadStockDetail();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
    ..add(DiagnosticsProperty('type', 'StockDetailAction.load'))
    ;
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadStockDetail);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'StockDetailAction.load()';
}


}




/// @nodoc


class SelectStockDetailPeriod with DiagnosticableTreeMixin implements StockDetailAction {
  const SelectStockDetailPeriod(this.period);
  

 final  DailyPricePeriod period;

/// Create a copy of StockDetailAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectStockDetailPeriodCopyWith<SelectStockDetailPeriod> get copyWith => _$SelectStockDetailPeriodCopyWithImpl<SelectStockDetailPeriod>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
    ..add(DiagnosticsProperty('type', 'StockDetailAction.selectPeriod'))
    ..add(DiagnosticsProperty('period', period));
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectStockDetailPeriod&&(identical(other.period, period) || other.period == period));
}


@override
int get hashCode {
    return Object.hash(runtimeType,period);
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'StockDetailAction.selectPeriod(period: $period)';
}


}

/// @nodoc
abstract mixin class $SelectStockDetailPeriodCopyWith<$Res> implements $StockDetailActionCopyWith<$Res> {
  factory $SelectStockDetailPeriodCopyWith(SelectStockDetailPeriod value, $Res Function(SelectStockDetailPeriod) _then) = _$SelectStockDetailPeriodCopyWithImpl;
@useResult
$Res call({
 DailyPricePeriod period
});




}
/// @nodoc
class _$SelectStockDetailPeriodCopyWithImpl<$Res>
    implements $SelectStockDetailPeriodCopyWith<$Res> {
  _$SelectStockDetailPeriodCopyWithImpl(this._self, this._then);

  final SelectStockDetailPeriod _self;
  final $Res Function(SelectStockDetailPeriod) _then;

/// Create a copy of StockDetailAction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? period = null,}) {
  return _then(SelectStockDetailPeriod(
null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as DailyPricePeriod,
  ));
}


}

/// @nodoc


class ToggleDetailFavorite with DiagnosticableTreeMixin implements StockDetailAction {
  const ToggleDetailFavorite();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
    ..add(DiagnosticsProperty('type', 'StockDetailAction.toggleFavorite'))
    ;
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ToggleDetailFavorite);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'StockDetailAction.toggleFavorite()';
}


}




// dart format on
