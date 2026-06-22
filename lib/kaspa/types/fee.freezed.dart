// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fee.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FeerateBucket {

 double get feerate; int get estimatedSeconds;
/// Create a copy of FeerateBucket
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeerateBucketCopyWith<FeerateBucket> get copyWith => _$FeerateBucketCopyWithImpl<FeerateBucket>(this as FeerateBucket, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeerateBucket&&(identical(other.feerate, feerate) || other.feerate == feerate)&&(identical(other.estimatedSeconds, estimatedSeconds) || other.estimatedSeconds == estimatedSeconds));
}


@override
int get hashCode => Object.hash(runtimeType,feerate,estimatedSeconds);

@override
String toString() {
  return 'FeerateBucket(feerate: $feerate, estimatedSeconds: $estimatedSeconds)';
}


}

/// @nodoc
abstract mixin class $FeerateBucketCopyWith<$Res>  {
  factory $FeerateBucketCopyWith(FeerateBucket value, $Res Function(FeerateBucket) _then) = _$FeerateBucketCopyWithImpl;
@useResult
$Res call({
 double feerate, int estimatedSeconds
});




}
/// @nodoc
class _$FeerateBucketCopyWithImpl<$Res>
    implements $FeerateBucketCopyWith<$Res> {
  _$FeerateBucketCopyWithImpl(this._self, this._then);

  final FeerateBucket _self;
  final $Res Function(FeerateBucket) _then;

/// Create a copy of FeerateBucket
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? feerate = null,Object? estimatedSeconds = null,}) {
  return _then(_self.copyWith(
feerate: null == feerate ? _self.feerate : feerate // ignore: cast_nullable_to_non_nullable
as double,estimatedSeconds: null == estimatedSeconds ? _self.estimatedSeconds : estimatedSeconds // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [FeerateBucket].
extension FeerateBucketPatterns on FeerateBucket {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FeerateBucket value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FeerateBucket() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FeerateBucket value)  $default,){
final _that = this;
switch (_that) {
case _FeerateBucket():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FeerateBucket value)?  $default,){
final _that = this;
switch (_that) {
case _FeerateBucket() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double feerate,  int estimatedSeconds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FeerateBucket() when $default != null:
return $default(_that.feerate,_that.estimatedSeconds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double feerate,  int estimatedSeconds)  $default,) {final _that = this;
switch (_that) {
case _FeerateBucket():
return $default(_that.feerate,_that.estimatedSeconds);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double feerate,  int estimatedSeconds)?  $default,) {final _that = this;
switch (_that) {
case _FeerateBucket() when $default != null:
return $default(_that.feerate,_that.estimatedSeconds);case _:
  return null;

}
}

}

/// @nodoc


class _FeerateBucket extends FeerateBucket {
  const _FeerateBucket({required this.feerate, required this.estimatedSeconds}): super._();
  

@override final  double feerate;
@override final  int estimatedSeconds;

/// Create a copy of FeerateBucket
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FeerateBucketCopyWith<_FeerateBucket> get copyWith => __$FeerateBucketCopyWithImpl<_FeerateBucket>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FeerateBucket&&(identical(other.feerate, feerate) || other.feerate == feerate)&&(identical(other.estimatedSeconds, estimatedSeconds) || other.estimatedSeconds == estimatedSeconds));
}


@override
int get hashCode => Object.hash(runtimeType,feerate,estimatedSeconds);

@override
String toString() {
  return 'FeerateBucket(feerate: $feerate, estimatedSeconds: $estimatedSeconds)';
}


}

/// @nodoc
abstract mixin class _$FeerateBucketCopyWith<$Res> implements $FeerateBucketCopyWith<$Res> {
  factory _$FeerateBucketCopyWith(_FeerateBucket value, $Res Function(_FeerateBucket) _then) = __$FeerateBucketCopyWithImpl;
@override @useResult
$Res call({
 double feerate, int estimatedSeconds
});




}
/// @nodoc
class __$FeerateBucketCopyWithImpl<$Res>
    implements _$FeerateBucketCopyWith<$Res> {
  __$FeerateBucketCopyWithImpl(this._self, this._then);

  final _FeerateBucket _self;
  final $Res Function(_FeerateBucket) _then;

/// Create a copy of FeerateBucket
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? feerate = null,Object? estimatedSeconds = null,}) {
  return _then(_FeerateBucket(
feerate: null == feerate ? _self.feerate : feerate // ignore: cast_nullable_to_non_nullable
as double,estimatedSeconds: null == estimatedSeconds ? _self.estimatedSeconds : estimatedSeconds // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$FeeEstimate {

 FeerateBucket get priorityBucket; Iterable<FeerateBucket> get normalBuckets; Iterable<FeerateBucket> get lowBuckets;
/// Create a copy of FeeEstimate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeeEstimateCopyWith<FeeEstimate> get copyWith => _$FeeEstimateCopyWithImpl<FeeEstimate>(this as FeeEstimate, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeeEstimate&&(identical(other.priorityBucket, priorityBucket) || other.priorityBucket == priorityBucket)&&const DeepCollectionEquality().equals(other.normalBuckets, normalBuckets)&&const DeepCollectionEquality().equals(other.lowBuckets, lowBuckets));
}


@override
int get hashCode => Object.hash(runtimeType,priorityBucket,const DeepCollectionEquality().hash(normalBuckets),const DeepCollectionEquality().hash(lowBuckets));

@override
String toString() {
  return 'FeeEstimate(priorityBucket: $priorityBucket, normalBuckets: $normalBuckets, lowBuckets: $lowBuckets)';
}


}

/// @nodoc
abstract mixin class $FeeEstimateCopyWith<$Res>  {
  factory $FeeEstimateCopyWith(FeeEstimate value, $Res Function(FeeEstimate) _then) = _$FeeEstimateCopyWithImpl;
@useResult
$Res call({
 FeerateBucket priorityBucket, Iterable<FeerateBucket> normalBuckets, Iterable<FeerateBucket> lowBuckets
});


$FeerateBucketCopyWith<$Res> get priorityBucket;

}
/// @nodoc
class _$FeeEstimateCopyWithImpl<$Res>
    implements $FeeEstimateCopyWith<$Res> {
  _$FeeEstimateCopyWithImpl(this._self, this._then);

  final FeeEstimate _self;
  final $Res Function(FeeEstimate) _then;

/// Create a copy of FeeEstimate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? priorityBucket = null,Object? normalBuckets = null,Object? lowBuckets = null,}) {
  return _then(_self.copyWith(
priorityBucket: null == priorityBucket ? _self.priorityBucket : priorityBucket // ignore: cast_nullable_to_non_nullable
as FeerateBucket,normalBuckets: null == normalBuckets ? _self.normalBuckets : normalBuckets // ignore: cast_nullable_to_non_nullable
as Iterable<FeerateBucket>,lowBuckets: null == lowBuckets ? _self.lowBuckets : lowBuckets // ignore: cast_nullable_to_non_nullable
as Iterable<FeerateBucket>,
  ));
}
/// Create a copy of FeeEstimate
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FeerateBucketCopyWith<$Res> get priorityBucket {
  
  return $FeerateBucketCopyWith<$Res>(_self.priorityBucket, (value) {
    return _then(_self.copyWith(priorityBucket: value));
  });
}
}


/// Adds pattern-matching-related methods to [FeeEstimate].
extension FeeEstimatePatterns on FeeEstimate {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FeeEstimate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FeeEstimate() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FeeEstimate value)  $default,){
final _that = this;
switch (_that) {
case _FeeEstimate():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FeeEstimate value)?  $default,){
final _that = this;
switch (_that) {
case _FeeEstimate() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( FeerateBucket priorityBucket,  Iterable<FeerateBucket> normalBuckets,  Iterable<FeerateBucket> lowBuckets)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FeeEstimate() when $default != null:
return $default(_that.priorityBucket,_that.normalBuckets,_that.lowBuckets);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( FeerateBucket priorityBucket,  Iterable<FeerateBucket> normalBuckets,  Iterable<FeerateBucket> lowBuckets)  $default,) {final _that = this;
switch (_that) {
case _FeeEstimate():
return $default(_that.priorityBucket,_that.normalBuckets,_that.lowBuckets);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( FeerateBucket priorityBucket,  Iterable<FeerateBucket> normalBuckets,  Iterable<FeerateBucket> lowBuckets)?  $default,) {final _that = this;
switch (_that) {
case _FeeEstimate() when $default != null:
return $default(_that.priorityBucket,_that.normalBuckets,_that.lowBuckets);case _:
  return null;

}
}

}

/// @nodoc


class _FeeEstimate extends FeeEstimate {
  const _FeeEstimate({required this.priorityBucket, this.normalBuckets = const [], this.lowBuckets = const []}): super._();
  

@override final  FeerateBucket priorityBucket;
@override@JsonKey() final  Iterable<FeerateBucket> normalBuckets;
@override@JsonKey() final  Iterable<FeerateBucket> lowBuckets;

/// Create a copy of FeeEstimate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FeeEstimateCopyWith<_FeeEstimate> get copyWith => __$FeeEstimateCopyWithImpl<_FeeEstimate>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FeeEstimate&&(identical(other.priorityBucket, priorityBucket) || other.priorityBucket == priorityBucket)&&const DeepCollectionEquality().equals(other.normalBuckets, normalBuckets)&&const DeepCollectionEquality().equals(other.lowBuckets, lowBuckets));
}


@override
int get hashCode => Object.hash(runtimeType,priorityBucket,const DeepCollectionEquality().hash(normalBuckets),const DeepCollectionEquality().hash(lowBuckets));

@override
String toString() {
  return 'FeeEstimate(priorityBucket: $priorityBucket, normalBuckets: $normalBuckets, lowBuckets: $lowBuckets)';
}


}

/// @nodoc
abstract mixin class _$FeeEstimateCopyWith<$Res> implements $FeeEstimateCopyWith<$Res> {
  factory _$FeeEstimateCopyWith(_FeeEstimate value, $Res Function(_FeeEstimate) _then) = __$FeeEstimateCopyWithImpl;
@override @useResult
$Res call({
 FeerateBucket priorityBucket, Iterable<FeerateBucket> normalBuckets, Iterable<FeerateBucket> lowBuckets
});


@override $FeerateBucketCopyWith<$Res> get priorityBucket;

}
/// @nodoc
class __$FeeEstimateCopyWithImpl<$Res>
    implements _$FeeEstimateCopyWith<$Res> {
  __$FeeEstimateCopyWithImpl(this._self, this._then);

  final _FeeEstimate _self;
  final $Res Function(_FeeEstimate) _then;

/// Create a copy of FeeEstimate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? priorityBucket = null,Object? normalBuckets = null,Object? lowBuckets = null,}) {
  return _then(_FeeEstimate(
priorityBucket: null == priorityBucket ? _self.priorityBucket : priorityBucket // ignore: cast_nullable_to_non_nullable
as FeerateBucket,normalBuckets: null == normalBuckets ? _self.normalBuckets : normalBuckets // ignore: cast_nullable_to_non_nullable
as Iterable<FeerateBucket>,lowBuckets: null == lowBuckets ? _self.lowBuckets : lowBuckets // ignore: cast_nullable_to_non_nullable
as Iterable<FeerateBucket>,
  ));
}

/// Create a copy of FeeEstimate
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FeerateBucketCopyWith<$Res> get priorityBucket {
  
  return $FeerateBucketCopyWith<$Res>(_self.priorityBucket, (value) {
    return _then(_self.copyWith(priorityBucket: value));
  });
}
}

// dart format on
