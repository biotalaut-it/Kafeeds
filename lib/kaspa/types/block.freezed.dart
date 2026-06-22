// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'block.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BlockHeader {

//required String hash,
 int get version;//required Iterable<Iterable<String>> parentsByLevel,
//required String hashMerkleRoot,
//required String acceptedIdMerkleRoot,
//required String utxoCommitment,
 int get timestamp; int get bits; int get nonce; int get daaScore;//required Iterable<int> blueWork,
 int get blueScore;
/// Create a copy of BlockHeader
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BlockHeaderCopyWith<BlockHeader> get copyWith => _$BlockHeaderCopyWithImpl<BlockHeader>(this as BlockHeader, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BlockHeader&&(identical(other.version, version) || other.version == version)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.bits, bits) || other.bits == bits)&&(identical(other.nonce, nonce) || other.nonce == nonce)&&(identical(other.daaScore, daaScore) || other.daaScore == daaScore)&&(identical(other.blueScore, blueScore) || other.blueScore == blueScore));
}


@override
int get hashCode => Object.hash(runtimeType,version,timestamp,bits,nonce,daaScore,blueScore);

@override
String toString() {
  return 'BlockHeader(version: $version, timestamp: $timestamp, bits: $bits, nonce: $nonce, daaScore: $daaScore, blueScore: $blueScore)';
}


}

/// @nodoc
abstract mixin class $BlockHeaderCopyWith<$Res>  {
  factory $BlockHeaderCopyWith(BlockHeader value, $Res Function(BlockHeader) _then) = _$BlockHeaderCopyWithImpl;
@useResult
$Res call({
 int version, int timestamp, int bits, int nonce, int daaScore, int blueScore
});




}
/// @nodoc
class _$BlockHeaderCopyWithImpl<$Res>
    implements $BlockHeaderCopyWith<$Res> {
  _$BlockHeaderCopyWithImpl(this._self, this._then);

  final BlockHeader _self;
  final $Res Function(BlockHeader) _then;

/// Create a copy of BlockHeader
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? version = null,Object? timestamp = null,Object? bits = null,Object? nonce = null,Object? daaScore = null,Object? blueScore = null,}) {
  return _then(_self.copyWith(
version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as int,bits: null == bits ? _self.bits : bits // ignore: cast_nullable_to_non_nullable
as int,nonce: null == nonce ? _self.nonce : nonce // ignore: cast_nullable_to_non_nullable
as int,daaScore: null == daaScore ? _self.daaScore : daaScore // ignore: cast_nullable_to_non_nullable
as int,blueScore: null == blueScore ? _self.blueScore : blueScore // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [BlockHeader].
extension BlockHeaderPatterns on BlockHeader {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BlockHeader value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BlockHeader() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BlockHeader value)  $default,){
final _that = this;
switch (_that) {
case _BlockHeader():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BlockHeader value)?  $default,){
final _that = this;
switch (_that) {
case _BlockHeader() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int version,  int timestamp,  int bits,  int nonce,  int daaScore,  int blueScore)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BlockHeader() when $default != null:
return $default(_that.version,_that.timestamp,_that.bits,_that.nonce,_that.daaScore,_that.blueScore);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int version,  int timestamp,  int bits,  int nonce,  int daaScore,  int blueScore)  $default,) {final _that = this;
switch (_that) {
case _BlockHeader():
return $default(_that.version,_that.timestamp,_that.bits,_that.nonce,_that.daaScore,_that.blueScore);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int version,  int timestamp,  int bits,  int nonce,  int daaScore,  int blueScore)?  $default,) {final _that = this;
switch (_that) {
case _BlockHeader() when $default != null:
return $default(_that.version,_that.timestamp,_that.bits,_that.nonce,_that.daaScore,_that.blueScore);case _:
  return null;

}
}

}

/// @nodoc


class _BlockHeader implements BlockHeader {
  const _BlockHeader({required this.version, required this.timestamp, required this.bits, required this.nonce, required this.daaScore, required this.blueScore});
  

//required String hash,
@override final  int version;
//required Iterable<Iterable<String>> parentsByLevel,
//required String hashMerkleRoot,
//required String acceptedIdMerkleRoot,
//required String utxoCommitment,
@override final  int timestamp;
@override final  int bits;
@override final  int nonce;
@override final  int daaScore;
//required Iterable<int> blueWork,
@override final  int blueScore;

/// Create a copy of BlockHeader
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BlockHeaderCopyWith<_BlockHeader> get copyWith => __$BlockHeaderCopyWithImpl<_BlockHeader>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BlockHeader&&(identical(other.version, version) || other.version == version)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.bits, bits) || other.bits == bits)&&(identical(other.nonce, nonce) || other.nonce == nonce)&&(identical(other.daaScore, daaScore) || other.daaScore == daaScore)&&(identical(other.blueScore, blueScore) || other.blueScore == blueScore));
}


@override
int get hashCode => Object.hash(runtimeType,version,timestamp,bits,nonce,daaScore,blueScore);

@override
String toString() {
  return 'BlockHeader(version: $version, timestamp: $timestamp, bits: $bits, nonce: $nonce, daaScore: $daaScore, blueScore: $blueScore)';
}


}

/// @nodoc
abstract mixin class _$BlockHeaderCopyWith<$Res> implements $BlockHeaderCopyWith<$Res> {
  factory _$BlockHeaderCopyWith(_BlockHeader value, $Res Function(_BlockHeader) _then) = __$BlockHeaderCopyWithImpl;
@override @useResult
$Res call({
 int version, int timestamp, int bits, int nonce, int daaScore, int blueScore
});




}
/// @nodoc
class __$BlockHeaderCopyWithImpl<$Res>
    implements _$BlockHeaderCopyWith<$Res> {
  __$BlockHeaderCopyWithImpl(this._self, this._then);

  final _BlockHeader _self;
  final $Res Function(_BlockHeader) _then;

/// Create a copy of BlockHeader
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? version = null,Object? timestamp = null,Object? bits = null,Object? nonce = null,Object? daaScore = null,Object? blueScore = null,}) {
  return _then(_BlockHeader(
version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as int,bits: null == bits ? _self.bits : bits // ignore: cast_nullable_to_non_nullable
as int,nonce: null == nonce ? _self.nonce : nonce // ignore: cast_nullable_to_non_nullable
as int,daaScore: null == daaScore ? _self.daaScore : daaScore // ignore: cast_nullable_to_non_nullable
as int,blueScore: null == blueScore ? _self.blueScore : blueScore // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$BlockVerboseData {

 String get hash; double get difficulty; String get selectedParentHash; Iterable<String> get transactionIds; bool get isHeaderOnly; int get blueScore;//required Iterable<String> childrenHashes,
//required Iterable<String> mergeSetBlueHashes,
//required Iterable<String> mergeSetRedHashes,
 bool get isChainBlock;
/// Create a copy of BlockVerboseData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BlockVerboseDataCopyWith<BlockVerboseData> get copyWith => _$BlockVerboseDataCopyWithImpl<BlockVerboseData>(this as BlockVerboseData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BlockVerboseData&&(identical(other.hash, hash) || other.hash == hash)&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty)&&(identical(other.selectedParentHash, selectedParentHash) || other.selectedParentHash == selectedParentHash)&&const DeepCollectionEquality().equals(other.transactionIds, transactionIds)&&(identical(other.isHeaderOnly, isHeaderOnly) || other.isHeaderOnly == isHeaderOnly)&&(identical(other.blueScore, blueScore) || other.blueScore == blueScore)&&(identical(other.isChainBlock, isChainBlock) || other.isChainBlock == isChainBlock));
}


@override
int get hashCode => Object.hash(runtimeType,hash,difficulty,selectedParentHash,const DeepCollectionEquality().hash(transactionIds),isHeaderOnly,blueScore,isChainBlock);

@override
String toString() {
  return 'BlockVerboseData(hash: $hash, difficulty: $difficulty, selectedParentHash: $selectedParentHash, transactionIds: $transactionIds, isHeaderOnly: $isHeaderOnly, blueScore: $blueScore, isChainBlock: $isChainBlock)';
}


}

/// @nodoc
abstract mixin class $BlockVerboseDataCopyWith<$Res>  {
  factory $BlockVerboseDataCopyWith(BlockVerboseData value, $Res Function(BlockVerboseData) _then) = _$BlockVerboseDataCopyWithImpl;
@useResult
$Res call({
 String hash, double difficulty, String selectedParentHash, Iterable<String> transactionIds, bool isHeaderOnly, int blueScore, bool isChainBlock
});




}
/// @nodoc
class _$BlockVerboseDataCopyWithImpl<$Res>
    implements $BlockVerboseDataCopyWith<$Res> {
  _$BlockVerboseDataCopyWithImpl(this._self, this._then);

  final BlockVerboseData _self;
  final $Res Function(BlockVerboseData) _then;

/// Create a copy of BlockVerboseData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hash = null,Object? difficulty = null,Object? selectedParentHash = null,Object? transactionIds = null,Object? isHeaderOnly = null,Object? blueScore = null,Object? isChainBlock = null,}) {
  return _then(_self.copyWith(
hash: null == hash ? _self.hash : hash // ignore: cast_nullable_to_non_nullable
as String,difficulty: null == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as double,selectedParentHash: null == selectedParentHash ? _self.selectedParentHash : selectedParentHash // ignore: cast_nullable_to_non_nullable
as String,transactionIds: null == transactionIds ? _self.transactionIds : transactionIds // ignore: cast_nullable_to_non_nullable
as Iterable<String>,isHeaderOnly: null == isHeaderOnly ? _self.isHeaderOnly : isHeaderOnly // ignore: cast_nullable_to_non_nullable
as bool,blueScore: null == blueScore ? _self.blueScore : blueScore // ignore: cast_nullable_to_non_nullable
as int,isChainBlock: null == isChainBlock ? _self.isChainBlock : isChainBlock // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [BlockVerboseData].
extension BlockVerboseDataPatterns on BlockVerboseData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BlockVerboseData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BlockVerboseData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BlockVerboseData value)  $default,){
final _that = this;
switch (_that) {
case _BlockVerboseData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BlockVerboseData value)?  $default,){
final _that = this;
switch (_that) {
case _BlockVerboseData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String hash,  double difficulty,  String selectedParentHash,  Iterable<String> transactionIds,  bool isHeaderOnly,  int blueScore,  bool isChainBlock)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BlockVerboseData() when $default != null:
return $default(_that.hash,_that.difficulty,_that.selectedParentHash,_that.transactionIds,_that.isHeaderOnly,_that.blueScore,_that.isChainBlock);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String hash,  double difficulty,  String selectedParentHash,  Iterable<String> transactionIds,  bool isHeaderOnly,  int blueScore,  bool isChainBlock)  $default,) {final _that = this;
switch (_that) {
case _BlockVerboseData():
return $default(_that.hash,_that.difficulty,_that.selectedParentHash,_that.transactionIds,_that.isHeaderOnly,_that.blueScore,_that.isChainBlock);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String hash,  double difficulty,  String selectedParentHash,  Iterable<String> transactionIds,  bool isHeaderOnly,  int blueScore,  bool isChainBlock)?  $default,) {final _that = this;
switch (_that) {
case _BlockVerboseData() when $default != null:
return $default(_that.hash,_that.difficulty,_that.selectedParentHash,_that.transactionIds,_that.isHeaderOnly,_that.blueScore,_that.isChainBlock);case _:
  return null;

}
}

}

/// @nodoc


class _BlockVerboseData implements BlockVerboseData {
  const _BlockVerboseData({required this.hash, required this.difficulty, required this.selectedParentHash, required this.transactionIds, required this.isHeaderOnly, required this.blueScore, required this.isChainBlock});
  

@override final  String hash;
@override final  double difficulty;
@override final  String selectedParentHash;
@override final  Iterable<String> transactionIds;
@override final  bool isHeaderOnly;
@override final  int blueScore;
//required Iterable<String> childrenHashes,
//required Iterable<String> mergeSetBlueHashes,
//required Iterable<String> mergeSetRedHashes,
@override final  bool isChainBlock;

/// Create a copy of BlockVerboseData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BlockVerboseDataCopyWith<_BlockVerboseData> get copyWith => __$BlockVerboseDataCopyWithImpl<_BlockVerboseData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BlockVerboseData&&(identical(other.hash, hash) || other.hash == hash)&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty)&&(identical(other.selectedParentHash, selectedParentHash) || other.selectedParentHash == selectedParentHash)&&const DeepCollectionEquality().equals(other.transactionIds, transactionIds)&&(identical(other.isHeaderOnly, isHeaderOnly) || other.isHeaderOnly == isHeaderOnly)&&(identical(other.blueScore, blueScore) || other.blueScore == blueScore)&&(identical(other.isChainBlock, isChainBlock) || other.isChainBlock == isChainBlock));
}


@override
int get hashCode => Object.hash(runtimeType,hash,difficulty,selectedParentHash,const DeepCollectionEquality().hash(transactionIds),isHeaderOnly,blueScore,isChainBlock);

@override
String toString() {
  return 'BlockVerboseData(hash: $hash, difficulty: $difficulty, selectedParentHash: $selectedParentHash, transactionIds: $transactionIds, isHeaderOnly: $isHeaderOnly, blueScore: $blueScore, isChainBlock: $isChainBlock)';
}


}

/// @nodoc
abstract mixin class _$BlockVerboseDataCopyWith<$Res> implements $BlockVerboseDataCopyWith<$Res> {
  factory _$BlockVerboseDataCopyWith(_BlockVerboseData value, $Res Function(_BlockVerboseData) _then) = __$BlockVerboseDataCopyWithImpl;
@override @useResult
$Res call({
 String hash, double difficulty, String selectedParentHash, Iterable<String> transactionIds, bool isHeaderOnly, int blueScore, bool isChainBlock
});




}
/// @nodoc
class __$BlockVerboseDataCopyWithImpl<$Res>
    implements _$BlockVerboseDataCopyWith<$Res> {
  __$BlockVerboseDataCopyWithImpl(this._self, this._then);

  final _BlockVerboseData _self;
  final $Res Function(_BlockVerboseData) _then;

/// Create a copy of BlockVerboseData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hash = null,Object? difficulty = null,Object? selectedParentHash = null,Object? transactionIds = null,Object? isHeaderOnly = null,Object? blueScore = null,Object? isChainBlock = null,}) {
  return _then(_BlockVerboseData(
hash: null == hash ? _self.hash : hash // ignore: cast_nullable_to_non_nullable
as String,difficulty: null == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as double,selectedParentHash: null == selectedParentHash ? _self.selectedParentHash : selectedParentHash // ignore: cast_nullable_to_non_nullable
as String,transactionIds: null == transactionIds ? _self.transactionIds : transactionIds // ignore: cast_nullable_to_non_nullable
as Iterable<String>,isHeaderOnly: null == isHeaderOnly ? _self.isHeaderOnly : isHeaderOnly // ignore: cast_nullable_to_non_nullable
as bool,blueScore: null == blueScore ? _self.blueScore : blueScore // ignore: cast_nullable_to_non_nullable
as int,isChainBlock: null == isChainBlock ? _self.isChainBlock : isChainBlock // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$Block {

 BlockHeader get header; Iterable<Transaction> get transactions; BlockVerboseData? get verboseData;
/// Create a copy of Block
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BlockCopyWith<Block> get copyWith => _$BlockCopyWithImpl<Block>(this as Block, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Block&&(identical(other.header, header) || other.header == header)&&const DeepCollectionEquality().equals(other.transactions, transactions)&&(identical(other.verboseData, verboseData) || other.verboseData == verboseData));
}


@override
int get hashCode => Object.hash(runtimeType,header,const DeepCollectionEquality().hash(transactions),verboseData);

@override
String toString() {
  return 'Block(header: $header, transactions: $transactions, verboseData: $verboseData)';
}


}

/// @nodoc
abstract mixin class $BlockCopyWith<$Res>  {
  factory $BlockCopyWith(Block value, $Res Function(Block) _then) = _$BlockCopyWithImpl;
@useResult
$Res call({
 BlockHeader header, Iterable<Transaction> transactions, BlockVerboseData? verboseData
});


$BlockHeaderCopyWith<$Res> get header;$BlockVerboseDataCopyWith<$Res>? get verboseData;

}
/// @nodoc
class _$BlockCopyWithImpl<$Res>
    implements $BlockCopyWith<$Res> {
  _$BlockCopyWithImpl(this._self, this._then);

  final Block _self;
  final $Res Function(Block) _then;

/// Create a copy of Block
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? header = null,Object? transactions = null,Object? verboseData = freezed,}) {
  return _then(_self.copyWith(
header: null == header ? _self.header : header // ignore: cast_nullable_to_non_nullable
as BlockHeader,transactions: null == transactions ? _self.transactions : transactions // ignore: cast_nullable_to_non_nullable
as Iterable<Transaction>,verboseData: freezed == verboseData ? _self.verboseData : verboseData // ignore: cast_nullable_to_non_nullable
as BlockVerboseData?,
  ));
}
/// Create a copy of Block
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BlockHeaderCopyWith<$Res> get header {
  
  return $BlockHeaderCopyWith<$Res>(_self.header, (value) {
    return _then(_self.copyWith(header: value));
  });
}/// Create a copy of Block
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BlockVerboseDataCopyWith<$Res>? get verboseData {
    if (_self.verboseData == null) {
    return null;
  }

  return $BlockVerboseDataCopyWith<$Res>(_self.verboseData!, (value) {
    return _then(_self.copyWith(verboseData: value));
  });
}
}


/// Adds pattern-matching-related methods to [Block].
extension BlockPatterns on Block {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Block value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Block() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Block value)  $default,){
final _that = this;
switch (_that) {
case _Block():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Block value)?  $default,){
final _that = this;
switch (_that) {
case _Block() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BlockHeader header,  Iterable<Transaction> transactions,  BlockVerboseData? verboseData)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Block() when $default != null:
return $default(_that.header,_that.transactions,_that.verboseData);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BlockHeader header,  Iterable<Transaction> transactions,  BlockVerboseData? verboseData)  $default,) {final _that = this;
switch (_that) {
case _Block():
return $default(_that.header,_that.transactions,_that.verboseData);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BlockHeader header,  Iterable<Transaction> transactions,  BlockVerboseData? verboseData)?  $default,) {final _that = this;
switch (_that) {
case _Block() when $default != null:
return $default(_that.header,_that.transactions,_that.verboseData);case _:
  return null;

}
}

}

/// @nodoc


class _Block implements Block {
  const _Block({required this.header, required this.transactions, this.verboseData});
  

@override final  BlockHeader header;
@override final  Iterable<Transaction> transactions;
@override final  BlockVerboseData? verboseData;

/// Create a copy of Block
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BlockCopyWith<_Block> get copyWith => __$BlockCopyWithImpl<_Block>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Block&&(identical(other.header, header) || other.header == header)&&const DeepCollectionEquality().equals(other.transactions, transactions)&&(identical(other.verboseData, verboseData) || other.verboseData == verboseData));
}


@override
int get hashCode => Object.hash(runtimeType,header,const DeepCollectionEquality().hash(transactions),verboseData);

@override
String toString() {
  return 'Block(header: $header, transactions: $transactions, verboseData: $verboseData)';
}


}

/// @nodoc
abstract mixin class _$BlockCopyWith<$Res> implements $BlockCopyWith<$Res> {
  factory _$BlockCopyWith(_Block value, $Res Function(_Block) _then) = __$BlockCopyWithImpl;
@override @useResult
$Res call({
 BlockHeader header, Iterable<Transaction> transactions, BlockVerboseData? verboseData
});


@override $BlockHeaderCopyWith<$Res> get header;@override $BlockVerboseDataCopyWith<$Res>? get verboseData;

}
/// @nodoc
class __$BlockCopyWithImpl<$Res>
    implements _$BlockCopyWith<$Res> {
  __$BlockCopyWithImpl(this._self, this._then);

  final _Block _self;
  final $Res Function(_Block) _then;

/// Create a copy of Block
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? header = null,Object? transactions = null,Object? verboseData = freezed,}) {
  return _then(_Block(
header: null == header ? _self.header : header // ignore: cast_nullable_to_non_nullable
as BlockHeader,transactions: null == transactions ? _self.transactions : transactions // ignore: cast_nullable_to_non_nullable
as Iterable<Transaction>,verboseData: freezed == verboseData ? _self.verboseData : verboseData // ignore: cast_nullable_to_non_nullable
as BlockVerboseData?,
  ));
}

/// Create a copy of Block
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BlockHeaderCopyWith<$Res> get header {
  
  return $BlockHeaderCopyWith<$Res>(_self.header, (value) {
    return _then(_self.copyWith(header: value));
  });
}/// Create a copy of Block
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BlockVerboseDataCopyWith<$Res>? get verboseData {
    if (_self.verboseData == null) {
    return null;
  }

  return $BlockVerboseDataCopyWith<$Res>(_self.verboseData!, (value) {
    return _then(_self.copyWith(verboseData: value));
  });
}
}

// dart format on
