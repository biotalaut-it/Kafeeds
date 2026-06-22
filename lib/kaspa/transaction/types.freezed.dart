// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'types.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SighashReusedValues {

 Uint8List? get previousOutputsHash; set previousOutputsHash(Uint8List? value); Uint8List? get sequencesHash; set sequencesHash(Uint8List? value); Uint8List? get sigOpCountsHash; set sigOpCountsHash(Uint8List? value); Uint8List? get outputsHash; set outputsHash(Uint8List? value); Uint8List? get payloadHash; set payloadHash(Uint8List? value);
/// Create a copy of SighashReusedValues
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SighashReusedValuesCopyWith<SighashReusedValues> get copyWith => _$SighashReusedValuesCopyWithImpl<SighashReusedValues>(this as SighashReusedValues, _$identity);





@override
String toString() {
  return 'SighashReusedValues(previousOutputsHash: $previousOutputsHash, sequencesHash: $sequencesHash, sigOpCountsHash: $sigOpCountsHash, outputsHash: $outputsHash, payloadHash: $payloadHash)';
}


}

/// @nodoc
abstract mixin class $SighashReusedValuesCopyWith<$Res>  {
  factory $SighashReusedValuesCopyWith(SighashReusedValues value, $Res Function(SighashReusedValues) _then) = _$SighashReusedValuesCopyWithImpl;
@useResult
$Res call({
 Uint8List? previousOutputsHash, Uint8List? sequencesHash, Uint8List? sigOpCountsHash, Uint8List? outputsHash, Uint8List? payloadHash
});




}
/// @nodoc
class _$SighashReusedValuesCopyWithImpl<$Res>
    implements $SighashReusedValuesCopyWith<$Res> {
  _$SighashReusedValuesCopyWithImpl(this._self, this._then);

  final SighashReusedValues _self;
  final $Res Function(SighashReusedValues) _then;

/// Create a copy of SighashReusedValues
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? previousOutputsHash = freezed,Object? sequencesHash = freezed,Object? sigOpCountsHash = freezed,Object? outputsHash = freezed,Object? payloadHash = freezed,}) {
  return _then(_self.copyWith(
previousOutputsHash: freezed == previousOutputsHash ? _self.previousOutputsHash : previousOutputsHash // ignore: cast_nullable_to_non_nullable
as Uint8List?,sequencesHash: freezed == sequencesHash ? _self.sequencesHash : sequencesHash // ignore: cast_nullable_to_non_nullable
as Uint8List?,sigOpCountsHash: freezed == sigOpCountsHash ? _self.sigOpCountsHash : sigOpCountsHash // ignore: cast_nullable_to_non_nullable
as Uint8List?,outputsHash: freezed == outputsHash ? _self.outputsHash : outputsHash // ignore: cast_nullable_to_non_nullable
as Uint8List?,payloadHash: freezed == payloadHash ? _self.payloadHash : payloadHash // ignore: cast_nullable_to_non_nullable
as Uint8List?,
  ));
}

}


/// Adds pattern-matching-related methods to [SighashReusedValues].
extension SighashReusedValuesPatterns on SighashReusedValues {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SighashReusedValues value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SighashReusedValues() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SighashReusedValues value)  $default,){
final _that = this;
switch (_that) {
case _SighashReusedValues():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SighashReusedValues value)?  $default,){
final _that = this;
switch (_that) {
case _SighashReusedValues() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Uint8List? previousOutputsHash,  Uint8List? sequencesHash,  Uint8List? sigOpCountsHash,  Uint8List? outputsHash,  Uint8List? payloadHash)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SighashReusedValues() when $default != null:
return $default(_that.previousOutputsHash,_that.sequencesHash,_that.sigOpCountsHash,_that.outputsHash,_that.payloadHash);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Uint8List? previousOutputsHash,  Uint8List? sequencesHash,  Uint8List? sigOpCountsHash,  Uint8List? outputsHash,  Uint8List? payloadHash)  $default,) {final _that = this;
switch (_that) {
case _SighashReusedValues():
return $default(_that.previousOutputsHash,_that.sequencesHash,_that.sigOpCountsHash,_that.outputsHash,_that.payloadHash);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Uint8List? previousOutputsHash,  Uint8List? sequencesHash,  Uint8List? sigOpCountsHash,  Uint8List? outputsHash,  Uint8List? payloadHash)?  $default,) {final _that = this;
switch (_that) {
case _SighashReusedValues() when $default != null:
return $default(_that.previousOutputsHash,_that.sequencesHash,_that.sigOpCountsHash,_that.outputsHash,_that.payloadHash);case _:
  return null;

}
}

}

/// @nodoc


class _SighashReusedValues implements SighashReusedValues {
   _SighashReusedValues({this.previousOutputsHash, this.sequencesHash, this.sigOpCountsHash, this.outputsHash, this.payloadHash});
  

@override  Uint8List? previousOutputsHash;
@override  Uint8List? sequencesHash;
@override  Uint8List? sigOpCountsHash;
@override  Uint8List? outputsHash;
@override  Uint8List? payloadHash;

/// Create a copy of SighashReusedValues
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SighashReusedValuesCopyWith<_SighashReusedValues> get copyWith => __$SighashReusedValuesCopyWithImpl<_SighashReusedValues>(this, _$identity);





@override
String toString() {
  return 'SighashReusedValues(previousOutputsHash: $previousOutputsHash, sequencesHash: $sequencesHash, sigOpCountsHash: $sigOpCountsHash, outputsHash: $outputsHash, payloadHash: $payloadHash)';
}


}

/// @nodoc
abstract mixin class _$SighashReusedValuesCopyWith<$Res> implements $SighashReusedValuesCopyWith<$Res> {
  factory _$SighashReusedValuesCopyWith(_SighashReusedValues value, $Res Function(_SighashReusedValues) _then) = __$SighashReusedValuesCopyWithImpl;
@override @useResult
$Res call({
 Uint8List? previousOutputsHash, Uint8List? sequencesHash, Uint8List? sigOpCountsHash, Uint8List? outputsHash, Uint8List? payloadHash
});




}
/// @nodoc
class __$SighashReusedValuesCopyWithImpl<$Res>
    implements _$SighashReusedValuesCopyWith<$Res> {
  __$SighashReusedValuesCopyWithImpl(this._self, this._then);

  final _SighashReusedValues _self;
  final $Res Function(_SighashReusedValues) _then;

/// Create a copy of SighashReusedValues
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? previousOutputsHash = freezed,Object? sequencesHash = freezed,Object? sigOpCountsHash = freezed,Object? outputsHash = freezed,Object? payloadHash = freezed,}) {
  return _then(_SighashReusedValues(
previousOutputsHash: freezed == previousOutputsHash ? _self.previousOutputsHash : previousOutputsHash // ignore: cast_nullable_to_non_nullable
as Uint8List?,sequencesHash: freezed == sequencesHash ? _self.sequencesHash : sequencesHash // ignore: cast_nullable_to_non_nullable
as Uint8List?,sigOpCountsHash: freezed == sigOpCountsHash ? _self.sigOpCountsHash : sigOpCountsHash // ignore: cast_nullable_to_non_nullable
as Uint8List?,outputsHash: freezed == outputsHash ? _self.outputsHash : outputsHash // ignore: cast_nullable_to_non_nullable
as Uint8List?,payloadHash: freezed == payloadHash ? _self.payloadHash : payloadHash // ignore: cast_nullable_to_non_nullable
as Uint8List?,
  ));
}


}

// dart format on
