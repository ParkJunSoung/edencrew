// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Result<D,E extends Error> {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is Result<D, E>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'Result<$D, $E>()';
}


}

/// @nodoc
class $ResultCopyWith<D,E extends Error,$Res>  {
$ResultCopyWith(Result<D, E> _, $Res Function(Result<D, E>) __);
}


/// Adds pattern-matching-related methods to [Result].
extension ResultPatterns<D,E extends Error> on Result<D, E> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ResultSuccess<D, E> value)?  success,TResult Function( ResultError<D, E> value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ResultSuccess() when success != null:
return success(_that);case ResultError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ResultSuccess<D, E> value)  success,required TResult Function( ResultError<D, E> value)  error,}){
final _that = this;
switch (_that) {
case ResultSuccess():
return success(_that);case ResultError():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ResultSuccess<D, E> value)?  success,TResult? Function( ResultError<D, E> value)?  error,}){
final _that = this;
switch (_that) {
case ResultSuccess() when success != null:
return success(_that);case ResultError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( D data)?  success,TResult Function( E error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ResultSuccess() when success != null:
return success(_that.data);case ResultError() when error != null:
return error(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( D data)  success,required TResult Function( E error)  error,}) {final _that = this;
switch (_that) {
case ResultSuccess():
return success(_that.data);case ResultError():
return error(_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( D data)?  success,TResult? Function( E error)?  error,}) {final _that = this;
switch (_that) {
case ResultSuccess() when success != null:
return success(_that.data);case ResultError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class ResultSuccess<D,E extends Error> implements Result<D, E> {
  const ResultSuccess(this.data);
  

 final  D data;

/// Create a copy of Result
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResultSuccessCopyWith<D, E, ResultSuccess<D, E>> get copyWith => _$ResultSuccessCopyWithImpl<D, E, ResultSuccess<D, E>>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ResultSuccess<D, E>&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(data));
}

@override
String toString() {
    return 'Result<$D, $E>.success(data: $data)';
}


}

/// @nodoc
abstract mixin class $ResultSuccessCopyWith<D,E extends Error,$Res> implements $ResultCopyWith<D, E, $Res> {
  factory $ResultSuccessCopyWith(ResultSuccess<D, E> value, $Res Function(ResultSuccess<D, E>) _then) = _$ResultSuccessCopyWithImpl;
@useResult
$Res call({
 D data
});




}
/// @nodoc
class _$ResultSuccessCopyWithImpl<D,E extends Error,$Res>
    implements $ResultSuccessCopyWith<D, E, $Res> {
  _$ResultSuccessCopyWithImpl(this._self, this._then);

  final ResultSuccess<D, E> _self;
  final $Res Function(ResultSuccess<D, E>) _then;

/// Create a copy of Result
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(ResultSuccess<D, E>(
freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as D,
  ));
}


}

/// @nodoc


class ResultError<D,E extends Error> implements Result<D, E> {
  const ResultError(this.error);
  

 final  E error;

/// Create a copy of Result
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResultErrorCopyWith<D, E, ResultError<D, E>> get copyWith => _$ResultErrorCopyWithImpl<D, E, ResultError<D, E>>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ResultError<D, E>&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(error));
}

@override
String toString() {
    return 'Result<$D, $E>.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $ResultErrorCopyWith<D,E extends Error,$Res> implements $ResultCopyWith<D, E, $Res> {
  factory $ResultErrorCopyWith(ResultError<D, E> value, $Res Function(ResultError<D, E>) _then) = _$ResultErrorCopyWithImpl;
@useResult
$Res call({
 E error
});




}
/// @nodoc
class _$ResultErrorCopyWithImpl<D,E extends Error,$Res>
    implements $ResultErrorCopyWith<D, E, $Res> {
  _$ResultErrorCopyWithImpl(this._self, this._then);

  final ResultError<D, E> _self;
  final $Res Function(ResultError<D, E>) _then;

/// Create a copy of Result
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(ResultError<D, E>(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as E,
  ));
}


}

// dart format on
