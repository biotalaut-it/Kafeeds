// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vspc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChainAcceptedTransactions {

 String get chainBlockHash; int get blueScore; int get daaScore; int get timestamp; Iterable<Transaction> get acceptedTransactions;
/// Create a copy of ChainAcceptedTransactions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChainAcceptedTransactionsCopyWith<ChainAcceptedTransactions> get copyWith => _$ChainAcceptedTransactionsCopyWithImpl<ChainAcceptedTransactions>(this as ChainAcceptedTransactions, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChainAcceptedTransactions&&(identical(other.chainBlockHash, chainBlockHash) || other.chainBlockHash == chainBlockHash)&&(identical(other.blueScore, blueScore) || other.blueScore == blueScore)&&(identical(other.daaScore, daaScore) || other.daaScore == daaScore)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&const DeepCollectionEquality().equals(other.acceptedTransactions, acceptedTransactions));
}


@override
int get hashCode => Object.hash(runtimeType,chainBlockHash,blueScore,daaScore,timestamp,const DeepCollectionEquality().hash(acceptedTransactions));

@override
String toString() {
  return 'ChainAcceptedTransactions(chainBlockHash: $chainBlockHash, blueScore: $blueScore, daaScore: $daaScore, timestamp: $timestamp, acceptedTransactions: $acceptedTransactions)';
}


}

/// @nodoc
abstract mixin class $ChainAcceptedTransactionsCopyWith<$Res>  {
  factory $ChainAcceptedTransactionsCopyWith(ChainAcceptedTransactions value, $Res Function(ChainAcceptedTransactions) _then) = _$ChainAcceptedTransactionsCopyWithImpl;
@useResult
$Res call({
 String chainBlockHash, int blueScore, int daaScore, int timestamp, Iterable<Transaction> acceptedTransactions
});




}
/// @nodoc
class _$ChainAcceptedTransactionsCopyWithImpl<$Res>
    implements $ChainAcceptedTransactionsCopyWith<$Res> {
  _$ChainAcceptedTransactionsCopyWithImpl(this._self, this._then);

  final ChainAcceptedTransactions _self;
  final $Res Function(ChainAcceptedTransactions) _then;

/// Create a copy of ChainAcceptedTransactions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? chainBlockHash = null,Object? blueScore = null,Object? daaScore = null,Object? timestamp = null,Object? acceptedTransactions = null,}) {
  return _then(_self.copyWith(
chainBlockHash: null == chainBlockHash ? _self.chainBlockHash : chainBlockHash // ignore: cast_nullable_to_non_nullable
as String,blueScore: null == blueScore ? _self.blueScore : blueScore // ignore: cast_nullable_to_non_nullable
as int,daaScore: null == daaScore ? _self.daaScore : daaScore // ignore: cast_nullable_to_non_nullable
as int,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as int,acceptedTransactions: null == acceptedTransactions ? _self.acceptedTransactions : acceptedTransactions // ignore: cast_nullable_to_non_nullable
as Iterable<Transaction>,
  ));
}

}


/// Adds pattern-matching-related methods to [ChainAcceptedTransactions].
extension ChainAcceptedTransactionsPatterns on ChainAcceptedTransactions {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChainAcceptedTransactions value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChainAcceptedTransactions() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChainAcceptedTransactions value)  $default,){
final _that = this;
switch (_that) {
case _ChainAcceptedTransactions():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChainAcceptedTransactions value)?  $default,){
final _that = this;
switch (_that) {
case _ChainAcceptedTransactions() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String chainBlockHash,  int blueScore,  int daaScore,  int timestamp,  Iterable<Transaction> acceptedTransactions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChainAcceptedTransactions() when $default != null:
return $default(_that.chainBlockHash,_that.blueScore,_that.daaScore,_that.timestamp,_that.acceptedTransactions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String chainBlockHash,  int blueScore,  int daaScore,  int timestamp,  Iterable<Transaction> acceptedTransactions)  $default,) {final _that = this;
switch (_that) {
case _ChainAcceptedTransactions():
return $default(_that.chainBlockHash,_that.blueScore,_that.daaScore,_that.timestamp,_that.acceptedTransactions);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String chainBlockHash,  int blueScore,  int daaScore,  int timestamp,  Iterable<Transaction> acceptedTransactions)?  $default,) {final _that = this;
switch (_that) {
case _ChainAcceptedTransactions() when $default != null:
return $default(_that.chainBlockHash,_that.blueScore,_that.daaScore,_that.timestamp,_that.acceptedTransactions);case _:
  return null;

}
}

}

/// @nodoc


class _ChainAcceptedTransactions implements ChainAcceptedTransactions {
  const _ChainAcceptedTransactions({required this.chainBlockHash, required this.blueScore, required this.daaScore, required this.timestamp, required this.acceptedTransactions});
  

@override final  String chainBlockHash;
@override final  int blueScore;
@override final  int daaScore;
@override final  int timestamp;
@override final  Iterable<Transaction> acceptedTransactions;

/// Create a copy of ChainAcceptedTransactions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChainAcceptedTransactionsCopyWith<_ChainAcceptedTransactions> get copyWith => __$ChainAcceptedTransactionsCopyWithImpl<_ChainAcceptedTransactions>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChainAcceptedTransactions&&(identical(other.chainBlockHash, chainBlockHash) || other.chainBlockHash == chainBlockHash)&&(identical(other.blueScore, blueScore) || other.blueScore == blueScore)&&(identical(other.daaScore, daaScore) || other.daaScore == daaScore)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&const DeepCollectionEquality().equals(other.acceptedTransactions, acceptedTransactions));
}


@override
int get hashCode => Object.hash(runtimeType,chainBlockHash,blueScore,daaScore,timestamp,const DeepCollectionEquality().hash(acceptedTransactions));

@override
String toString() {
  return 'ChainAcceptedTransactions(chainBlockHash: $chainBlockHash, blueScore: $blueScore, daaScore: $daaScore, timestamp: $timestamp, acceptedTransactions: $acceptedTransactions)';
}


}

/// @nodoc
abstract mixin class _$ChainAcceptedTransactionsCopyWith<$Res> implements $ChainAcceptedTransactionsCopyWith<$Res> {
  factory _$ChainAcceptedTransactionsCopyWith(_ChainAcceptedTransactions value, $Res Function(_ChainAcceptedTransactions) _then) = __$ChainAcceptedTransactionsCopyWithImpl;
@override @useResult
$Res call({
 String chainBlockHash, int blueScore, int daaScore, int timestamp, Iterable<Transaction> acceptedTransactions
});




}
/// @nodoc
class __$ChainAcceptedTransactionsCopyWithImpl<$Res>
    implements _$ChainAcceptedTransactionsCopyWith<$Res> {
  __$ChainAcceptedTransactionsCopyWithImpl(this._self, this._then);

  final _ChainAcceptedTransactions _self;
  final $Res Function(_ChainAcceptedTransactions) _then;

/// Create a copy of ChainAcceptedTransactions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? chainBlockHash = null,Object? blueScore = null,Object? daaScore = null,Object? timestamp = null,Object? acceptedTransactions = null,}) {
  return _then(_ChainAcceptedTransactions(
chainBlockHash: null == chainBlockHash ? _self.chainBlockHash : chainBlockHash // ignore: cast_nullable_to_non_nullable
as String,blueScore: null == blueScore ? _self.blueScore : blueScore // ignore: cast_nullable_to_non_nullable
as int,daaScore: null == daaScore ? _self.daaScore : daaScore // ignore: cast_nullable_to_non_nullable
as int,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as int,acceptedTransactions: null == acceptedTransactions ? _self.acceptedTransactions : acceptedTransactions // ignore: cast_nullable_to_non_nullable
as Iterable<Transaction>,
  ));
}


}

/// @nodoc
mixin _$VirtualChainSegment {

 Iterable<String> get removedChainBlockHashes; Iterable<String> get addedChainBlockHashes; Iterable<ChainAcceptedTransactions> get chainBlocks;
/// Create a copy of VirtualChainSegment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VirtualChainSegmentCopyWith<VirtualChainSegment> get copyWith => _$VirtualChainSegmentCopyWithImpl<VirtualChainSegment>(this as VirtualChainSegment, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VirtualChainSegment&&const DeepCollectionEquality().equals(other.removedChainBlockHashes, removedChainBlockHashes)&&const DeepCollectionEquality().equals(other.addedChainBlockHashes, addedChainBlockHashes)&&const DeepCollectionEquality().equals(other.chainBlocks, chainBlocks));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(removedChainBlockHashes),const DeepCollectionEquality().hash(addedChainBlockHashes),const DeepCollectionEquality().hash(chainBlocks));

@override
String toString() {
  return 'VirtualChainSegment(removedChainBlockHashes: $removedChainBlockHashes, addedChainBlockHashes: $addedChainBlockHashes, chainBlocks: $chainBlocks)';
}


}

/// @nodoc
abstract mixin class $VirtualChainSegmentCopyWith<$Res>  {
  factory $VirtualChainSegmentCopyWith(VirtualChainSegment value, $Res Function(VirtualChainSegment) _then) = _$VirtualChainSegmentCopyWithImpl;
@useResult
$Res call({
 Iterable<String> removedChainBlockHashes, Iterable<String> addedChainBlockHashes, Iterable<ChainAcceptedTransactions> chainBlocks
});




}
/// @nodoc
class _$VirtualChainSegmentCopyWithImpl<$Res>
    implements $VirtualChainSegmentCopyWith<$Res> {
  _$VirtualChainSegmentCopyWithImpl(this._self, this._then);

  final VirtualChainSegment _self;
  final $Res Function(VirtualChainSegment) _then;

/// Create a copy of VirtualChainSegment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? removedChainBlockHashes = null,Object? addedChainBlockHashes = null,Object? chainBlocks = null,}) {
  return _then(_self.copyWith(
removedChainBlockHashes: null == removedChainBlockHashes ? _self.removedChainBlockHashes : removedChainBlockHashes // ignore: cast_nullable_to_non_nullable
as Iterable<String>,addedChainBlockHashes: null == addedChainBlockHashes ? _self.addedChainBlockHashes : addedChainBlockHashes // ignore: cast_nullable_to_non_nullable
as Iterable<String>,chainBlocks: null == chainBlocks ? _self.chainBlocks : chainBlocks // ignore: cast_nullable_to_non_nullable
as Iterable<ChainAcceptedTransactions>,
  ));
}

}


/// Adds pattern-matching-related methods to [VirtualChainSegment].
extension VirtualChainSegmentPatterns on VirtualChainSegment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VirtualChainSegment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VirtualChainSegment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VirtualChainSegment value)  $default,){
final _that = this;
switch (_that) {
case _VirtualChainSegment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VirtualChainSegment value)?  $default,){
final _that = this;
switch (_that) {
case _VirtualChainSegment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Iterable<String> removedChainBlockHashes,  Iterable<String> addedChainBlockHashes,  Iterable<ChainAcceptedTransactions> chainBlocks)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VirtualChainSegment() when $default != null:
return $default(_that.removedChainBlockHashes,_that.addedChainBlockHashes,_that.chainBlocks);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Iterable<String> removedChainBlockHashes,  Iterable<String> addedChainBlockHashes,  Iterable<ChainAcceptedTransactions> chainBlocks)  $default,) {final _that = this;
switch (_that) {
case _VirtualChainSegment():
return $default(_that.removedChainBlockHashes,_that.addedChainBlockHashes,_that.chainBlocks);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Iterable<String> removedChainBlockHashes,  Iterable<String> addedChainBlockHashes,  Iterable<ChainAcceptedTransactions> chainBlocks)?  $default,) {final _that = this;
switch (_that) {
case _VirtualChainSegment() when $default != null:
return $default(_that.removedChainBlockHashes,_that.addedChainBlockHashes,_that.chainBlocks);case _:
  return null;

}
}

}

/// @nodoc


class _VirtualChainSegment implements VirtualChainSegment {
  const _VirtualChainSegment({required this.removedChainBlockHashes, required this.addedChainBlockHashes, required this.chainBlocks});
  

@override final  Iterable<String> removedChainBlockHashes;
@override final  Iterable<String> addedChainBlockHashes;
@override final  Iterable<ChainAcceptedTransactions> chainBlocks;

/// Create a copy of VirtualChainSegment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VirtualChainSegmentCopyWith<_VirtualChainSegment> get copyWith => __$VirtualChainSegmentCopyWithImpl<_VirtualChainSegment>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VirtualChainSegment&&const DeepCollectionEquality().equals(other.removedChainBlockHashes, removedChainBlockHashes)&&const DeepCollectionEquality().equals(other.addedChainBlockHashes, addedChainBlockHashes)&&const DeepCollectionEquality().equals(other.chainBlocks, chainBlocks));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(removedChainBlockHashes),const DeepCollectionEquality().hash(addedChainBlockHashes),const DeepCollectionEquality().hash(chainBlocks));

@override
String toString() {
  return 'VirtualChainSegment(removedChainBlockHashes: $removedChainBlockHashes, addedChainBlockHashes: $addedChainBlockHashes, chainBlocks: $chainBlocks)';
}


}

/// @nodoc
abstract mixin class _$VirtualChainSegmentCopyWith<$Res> implements $VirtualChainSegmentCopyWith<$Res> {
  factory _$VirtualChainSegmentCopyWith(_VirtualChainSegment value, $Res Function(_VirtualChainSegment) _then) = __$VirtualChainSegmentCopyWithImpl;
@override @useResult
$Res call({
 Iterable<String> removedChainBlockHashes, Iterable<String> addedChainBlockHashes, Iterable<ChainAcceptedTransactions> chainBlocks
});




}
/// @nodoc
class __$VirtualChainSegmentCopyWithImpl<$Res>
    implements _$VirtualChainSegmentCopyWith<$Res> {
  __$VirtualChainSegmentCopyWithImpl(this._self, this._then);

  final _VirtualChainSegment _self;
  final $Res Function(_VirtualChainSegment) _then;

/// Create a copy of VirtualChainSegment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? removedChainBlockHashes = null,Object? addedChainBlockHashes = null,Object? chainBlocks = null,}) {
  return _then(_VirtualChainSegment(
removedChainBlockHashes: null == removedChainBlockHashes ? _self.removedChainBlockHashes : removedChainBlockHashes // ignore: cast_nullable_to_non_nullable
as Iterable<String>,addedChainBlockHashes: null == addedChainBlockHashes ? _self.addedChainBlockHashes : addedChainBlockHashes // ignore: cast_nullable_to_non_nullable
as Iterable<String>,chainBlocks: null == chainBlocks ? _self.chainBlocks : chainBlocks // ignore: cast_nullable_to_non_nullable
as Iterable<ChainAcceptedTransactions>,
  ));
}


}

// dart format on
