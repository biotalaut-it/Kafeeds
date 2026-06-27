// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Utxo {

 String get address; Outpoint get outpoint; UtxoEntry get utxoEntry;
/// Create a copy of Utxo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UtxoCopyWith<Utxo> get copyWith => _$UtxoCopyWithImpl<Utxo>(this as Utxo, _$identity);

  /// Serializes this Utxo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Utxo&&(identical(other.address, address) || other.address == address)&&(identical(other.outpoint, outpoint) || other.outpoint == outpoint)&&(identical(other.utxoEntry, utxoEntry) || other.utxoEntry == utxoEntry));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,address,outpoint,utxoEntry);

@override
String toString() {
  return 'Utxo(address: $address, outpoint: $outpoint, utxoEntry: $utxoEntry)';
}


}

/// @nodoc
abstract mixin class $UtxoCopyWith<$Res>  {
  factory $UtxoCopyWith(Utxo value, $Res Function(Utxo) _then) = _$UtxoCopyWithImpl;
@useResult
$Res call({
 String address, Outpoint outpoint, UtxoEntry utxoEntry
});


$OutpointCopyWith<$Res> get outpoint;$UtxoEntryCopyWith<$Res> get utxoEntry;

}
/// @nodoc
class _$UtxoCopyWithImpl<$Res>
    implements $UtxoCopyWith<$Res> {
  _$UtxoCopyWithImpl(this._self, this._then);

  final Utxo _self;
  final $Res Function(Utxo) _then;

/// Create a copy of Utxo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? address = null,Object? outpoint = null,Object? utxoEntry = null,}) {
  return _then(_self.copyWith(
address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,outpoint: null == outpoint ? _self.outpoint : outpoint // ignore: cast_nullable_to_non_nullable
as Outpoint,utxoEntry: null == utxoEntry ? _self.utxoEntry : utxoEntry // ignore: cast_nullable_to_non_nullable
as UtxoEntry,
  ));
}
/// Create a copy of Utxo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OutpointCopyWith<$Res> get outpoint {
  
  return $OutpointCopyWith<$Res>(_self.outpoint, (value) {
    return _then(_self.copyWith(outpoint: value));
  });
}/// Create a copy of Utxo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UtxoEntryCopyWith<$Res> get utxoEntry {
  
  return $UtxoEntryCopyWith<$Res>(_self.utxoEntry, (value) {
    return _then(_self.copyWith(utxoEntry: value));
  });
}
}


/// Adds pattern-matching-related methods to [Utxo].
extension UtxoPatterns on Utxo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Utxo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Utxo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Utxo value)  $default,){
final _that = this;
switch (_that) {
case _Utxo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Utxo value)?  $default,){
final _that = this;
switch (_that) {
case _Utxo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String address,  Outpoint outpoint,  UtxoEntry utxoEntry)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Utxo() when $default != null:
return $default(_that.address,_that.outpoint,_that.utxoEntry);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String address,  Outpoint outpoint,  UtxoEntry utxoEntry)  $default,) {final _that = this;
switch (_that) {
case _Utxo():
return $default(_that.address,_that.outpoint,_that.utxoEntry);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String address,  Outpoint outpoint,  UtxoEntry utxoEntry)?  $default,) {final _that = this;
switch (_that) {
case _Utxo() when $default != null:
return $default(_that.address,_that.outpoint,_that.utxoEntry);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Utxo extends Utxo {
  const _Utxo({required this.address, required this.outpoint, required this.utxoEntry}): super._();
  factory _Utxo.fromJson(Map<String, dynamic> json) => _$UtxoFromJson(json);

@override final  String address;
@override final  Outpoint outpoint;
@override final  UtxoEntry utxoEntry;

/// Create a copy of Utxo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UtxoCopyWith<_Utxo> get copyWith => __$UtxoCopyWithImpl<_Utxo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UtxoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Utxo&&(identical(other.address, address) || other.address == address)&&(identical(other.outpoint, outpoint) || other.outpoint == outpoint)&&(identical(other.utxoEntry, utxoEntry) || other.utxoEntry == utxoEntry));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,address,outpoint,utxoEntry);

@override
String toString() {
  return 'Utxo(address: $address, outpoint: $outpoint, utxoEntry: $utxoEntry)';
}


}

/// @nodoc
abstract mixin class _$UtxoCopyWith<$Res> implements $UtxoCopyWith<$Res> {
  factory _$UtxoCopyWith(_Utxo value, $Res Function(_Utxo) _then) = __$UtxoCopyWithImpl;
@override @useResult
$Res call({
 String address, Outpoint outpoint, UtxoEntry utxoEntry
});


@override $OutpointCopyWith<$Res> get outpoint;@override $UtxoEntryCopyWith<$Res> get utxoEntry;

}
/// @nodoc
class __$UtxoCopyWithImpl<$Res>
    implements _$UtxoCopyWith<$Res> {
  __$UtxoCopyWithImpl(this._self, this._then);

  final _Utxo _self;
  final $Res Function(_Utxo) _then;

/// Create a copy of Utxo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? address = null,Object? outpoint = null,Object? utxoEntry = null,}) {
  return _then(_Utxo(
address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,outpoint: null == outpoint ? _self.outpoint : outpoint // ignore: cast_nullable_to_non_nullable
as Outpoint,utxoEntry: null == utxoEntry ? _self.utxoEntry : utxoEntry // ignore: cast_nullable_to_non_nullable
as UtxoEntry,
  ));
}

/// Create a copy of Utxo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OutpointCopyWith<$Res> get outpoint {
  
  return $OutpointCopyWith<$Res>(_self.outpoint, (value) {
    return _then(_self.copyWith(outpoint: value));
  });
}/// Create a copy of Utxo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UtxoEntryCopyWith<$Res> get utxoEntry {
  
  return $UtxoEntryCopyWith<$Res>(_self.utxoEntry, (value) {
    return _then(_self.copyWith(utxoEntry: value));
  });
}
}


/// @nodoc
mixin _$UtxoEntry {

 BigInt get amount; ScriptPublicKey get scriptPublicKey; BigInt get blockDaaScore; bool get isCoinbase;@JsonKey(fromJson: maybeHexToBytes, toJson: maybeBytesToHex) Uint8List? get covenantId;
/// Create a copy of UtxoEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UtxoEntryCopyWith<UtxoEntry> get copyWith => _$UtxoEntryCopyWithImpl<UtxoEntry>(this as UtxoEntry, _$identity);

  /// Serializes this UtxoEntry to a JSON map.
  Map<String, dynamic> toJson();




@override
String toString() {
  return 'UtxoEntry(amount: $amount, scriptPublicKey: $scriptPublicKey, blockDaaScore: $blockDaaScore, isCoinbase: $isCoinbase, covenantId: $covenantId)';
}


}

/// @nodoc
abstract mixin class $UtxoEntryCopyWith<$Res>  {
  factory $UtxoEntryCopyWith(UtxoEntry value, $Res Function(UtxoEntry) _then) = _$UtxoEntryCopyWithImpl;
@useResult
$Res call({
 BigInt amount, ScriptPublicKey scriptPublicKey, BigInt blockDaaScore, bool isCoinbase,@JsonKey(fromJson: maybeHexToBytes, toJson: maybeBytesToHex) Uint8List? covenantId
});


$ScriptPublicKeyCopyWith<$Res> get scriptPublicKey;

}
/// @nodoc
class _$UtxoEntryCopyWithImpl<$Res>
    implements $UtxoEntryCopyWith<$Res> {
  _$UtxoEntryCopyWithImpl(this._self, this._then);

  final UtxoEntry _self;
  final $Res Function(UtxoEntry) _then;

/// Create a copy of UtxoEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? amount = null,Object? scriptPublicKey = null,Object? blockDaaScore = null,Object? isCoinbase = null,Object? covenantId = freezed,}) {
  return _then(_self.copyWith(
amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as BigInt,scriptPublicKey: null == scriptPublicKey ? _self.scriptPublicKey : scriptPublicKey // ignore: cast_nullable_to_non_nullable
as ScriptPublicKey,blockDaaScore: null == blockDaaScore ? _self.blockDaaScore : blockDaaScore // ignore: cast_nullable_to_non_nullable
as BigInt,isCoinbase: null == isCoinbase ? _self.isCoinbase : isCoinbase // ignore: cast_nullable_to_non_nullable
as bool,covenantId: freezed == covenantId ? _self.covenantId : covenantId // ignore: cast_nullable_to_non_nullable
as Uint8List?,
  ));
}
/// Create a copy of UtxoEntry
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScriptPublicKeyCopyWith<$Res> get scriptPublicKey {
  
  return $ScriptPublicKeyCopyWith<$Res>(_self.scriptPublicKey, (value) {
    return _then(_self.copyWith(scriptPublicKey: value));
  });
}
}


/// Adds pattern-matching-related methods to [UtxoEntry].
extension UtxoEntryPatterns on UtxoEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UtxoEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UtxoEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UtxoEntry value)  $default,){
final _that = this;
switch (_that) {
case _UtxoEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UtxoEntry value)?  $default,){
final _that = this;
switch (_that) {
case _UtxoEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BigInt amount,  ScriptPublicKey scriptPublicKey,  BigInt blockDaaScore,  bool isCoinbase, @JsonKey(fromJson: maybeHexToBytes, toJson: maybeBytesToHex)  Uint8List? covenantId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UtxoEntry() when $default != null:
return $default(_that.amount,_that.scriptPublicKey,_that.blockDaaScore,_that.isCoinbase,_that.covenantId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BigInt amount,  ScriptPublicKey scriptPublicKey,  BigInt blockDaaScore,  bool isCoinbase, @JsonKey(fromJson: maybeHexToBytes, toJson: maybeBytesToHex)  Uint8List? covenantId)  $default,) {final _that = this;
switch (_that) {
case _UtxoEntry():
return $default(_that.amount,_that.scriptPublicKey,_that.blockDaaScore,_that.isCoinbase,_that.covenantId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BigInt amount,  ScriptPublicKey scriptPublicKey,  BigInt blockDaaScore,  bool isCoinbase, @JsonKey(fromJson: maybeHexToBytes, toJson: maybeBytesToHex)  Uint8List? covenantId)?  $default,) {final _that = this;
switch (_that) {
case _UtxoEntry() when $default != null:
return $default(_that.amount,_that.scriptPublicKey,_that.blockDaaScore,_that.isCoinbase,_that.covenantId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UtxoEntry extends UtxoEntry {
  const _UtxoEntry({required this.amount, required this.scriptPublicKey, required this.blockDaaScore, required this.isCoinbase, @JsonKey(fromJson: maybeHexToBytes, toJson: maybeBytesToHex) this.covenantId}): super._();
  factory _UtxoEntry.fromJson(Map<String, dynamic> json) => _$UtxoEntryFromJson(json);

@override final  BigInt amount;
@override final  ScriptPublicKey scriptPublicKey;
@override final  BigInt blockDaaScore;
@override final  bool isCoinbase;
@override@JsonKey(fromJson: maybeHexToBytes, toJson: maybeBytesToHex) final  Uint8List? covenantId;

/// Create a copy of UtxoEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UtxoEntryCopyWith<_UtxoEntry> get copyWith => __$UtxoEntryCopyWithImpl<_UtxoEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UtxoEntryToJson(this, );
}



@override
String toString() {
  return 'UtxoEntry(amount: $amount, scriptPublicKey: $scriptPublicKey, blockDaaScore: $blockDaaScore, isCoinbase: $isCoinbase, covenantId: $covenantId)';
}


}

/// @nodoc
abstract mixin class _$UtxoEntryCopyWith<$Res> implements $UtxoEntryCopyWith<$Res> {
  factory _$UtxoEntryCopyWith(_UtxoEntry value, $Res Function(_UtxoEntry) _then) = __$UtxoEntryCopyWithImpl;
@override @useResult
$Res call({
 BigInt amount, ScriptPublicKey scriptPublicKey, BigInt blockDaaScore, bool isCoinbase,@JsonKey(fromJson: maybeHexToBytes, toJson: maybeBytesToHex) Uint8List? covenantId
});


@override $ScriptPublicKeyCopyWith<$Res> get scriptPublicKey;

}
/// @nodoc
class __$UtxoEntryCopyWithImpl<$Res>
    implements _$UtxoEntryCopyWith<$Res> {
  __$UtxoEntryCopyWithImpl(this._self, this._then);

  final _UtxoEntry _self;
  final $Res Function(_UtxoEntry) _then;

/// Create a copy of UtxoEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? amount = null,Object? scriptPublicKey = null,Object? blockDaaScore = null,Object? isCoinbase = null,Object? covenantId = freezed,}) {
  return _then(_UtxoEntry(
amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as BigInt,scriptPublicKey: null == scriptPublicKey ? _self.scriptPublicKey : scriptPublicKey // ignore: cast_nullable_to_non_nullable
as ScriptPublicKey,blockDaaScore: null == blockDaaScore ? _self.blockDaaScore : blockDaaScore // ignore: cast_nullable_to_non_nullable
as BigInt,isCoinbase: null == isCoinbase ? _self.isCoinbase : isCoinbase // ignore: cast_nullable_to_non_nullable
as bool,covenantId: freezed == covenantId ? _self.covenantId : covenantId // ignore: cast_nullable_to_non_nullable
as Uint8List?,
  ));
}

/// Create a copy of UtxoEntry
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScriptPublicKeyCopyWith<$Res> get scriptPublicKey {
  
  return $ScriptPublicKeyCopyWith<$Res>(_self.scriptPublicKey, (value) {
    return _then(_self.copyWith(scriptPublicKey: value));
  });
}
}


/// @nodoc
mixin _$ScriptPublicKey {

@JsonKey(fromJson: hexToBytes, toJson: bytesToHex) Uint8List get scriptPublicKey;/*uint16*/
 int get version;
/// Create a copy of ScriptPublicKey
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScriptPublicKeyCopyWith<ScriptPublicKey> get copyWith => _$ScriptPublicKeyCopyWithImpl<ScriptPublicKey>(this as ScriptPublicKey, _$identity);

  /// Serializes this ScriptPublicKey to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScriptPublicKey&&const DeepCollectionEquality().equals(other.scriptPublicKey, scriptPublicKey)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(scriptPublicKey),version);

@override
String toString() {
  return 'ScriptPublicKey(scriptPublicKey: $scriptPublicKey, version: $version)';
}


}

/// @nodoc
abstract mixin class $ScriptPublicKeyCopyWith<$Res>  {
  factory $ScriptPublicKeyCopyWith(ScriptPublicKey value, $Res Function(ScriptPublicKey) _then) = _$ScriptPublicKeyCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: hexToBytes, toJson: bytesToHex) Uint8List scriptPublicKey, int version
});




}
/// @nodoc
class _$ScriptPublicKeyCopyWithImpl<$Res>
    implements $ScriptPublicKeyCopyWith<$Res> {
  _$ScriptPublicKeyCopyWithImpl(this._self, this._then);

  final ScriptPublicKey _self;
  final $Res Function(ScriptPublicKey) _then;

/// Create a copy of ScriptPublicKey
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? scriptPublicKey = null,Object? version = null,}) {
  return _then(_self.copyWith(
scriptPublicKey: null == scriptPublicKey ? _self.scriptPublicKey : scriptPublicKey // ignore: cast_nullable_to_non_nullable
as Uint8List,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ScriptPublicKey].
extension ScriptPublicKeyPatterns on ScriptPublicKey {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScriptPublicKey value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScriptPublicKey() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScriptPublicKey value)  $default,){
final _that = this;
switch (_that) {
case _ScriptPublicKey():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScriptPublicKey value)?  $default,){
final _that = this;
switch (_that) {
case _ScriptPublicKey() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: hexToBytes, toJson: bytesToHex)  Uint8List scriptPublicKey,  int version)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScriptPublicKey() when $default != null:
return $default(_that.scriptPublicKey,_that.version);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: hexToBytes, toJson: bytesToHex)  Uint8List scriptPublicKey,  int version)  $default,) {final _that = this;
switch (_that) {
case _ScriptPublicKey():
return $default(_that.scriptPublicKey,_that.version);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: hexToBytes, toJson: bytesToHex)  Uint8List scriptPublicKey,  int version)?  $default,) {final _that = this;
switch (_that) {
case _ScriptPublicKey() when $default != null:
return $default(_that.scriptPublicKey,_that.version);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ScriptPublicKey extends ScriptPublicKey {
  const _ScriptPublicKey({@JsonKey(fromJson: hexToBytes, toJson: bytesToHex) required this.scriptPublicKey, required this.version}): super._();
  factory _ScriptPublicKey.fromJson(Map<String, dynamic> json) => _$ScriptPublicKeyFromJson(json);

@override@JsonKey(fromJson: hexToBytes, toJson: bytesToHex) final  Uint8List scriptPublicKey;
/*uint16*/
@override final  int version;

/// Create a copy of ScriptPublicKey
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScriptPublicKeyCopyWith<_ScriptPublicKey> get copyWith => __$ScriptPublicKeyCopyWithImpl<_ScriptPublicKey>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ScriptPublicKeyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScriptPublicKey&&const DeepCollectionEquality().equals(other.scriptPublicKey, scriptPublicKey)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(scriptPublicKey),version);

@override
String toString() {
  return 'ScriptPublicKey(scriptPublicKey: $scriptPublicKey, version: $version)';
}


}

/// @nodoc
abstract mixin class _$ScriptPublicKeyCopyWith<$Res> implements $ScriptPublicKeyCopyWith<$Res> {
  factory _$ScriptPublicKeyCopyWith(_ScriptPublicKey value, $Res Function(_ScriptPublicKey) _then) = __$ScriptPublicKeyCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: hexToBytes, toJson: bytesToHex) Uint8List scriptPublicKey, int version
});




}
/// @nodoc
class __$ScriptPublicKeyCopyWithImpl<$Res>
    implements _$ScriptPublicKeyCopyWith<$Res> {
  __$ScriptPublicKeyCopyWithImpl(this._self, this._then);

  final _ScriptPublicKey _self;
  final $Res Function(_ScriptPublicKey) _then;

/// Create a copy of ScriptPublicKey
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? scriptPublicKey = null,Object? version = null,}) {
  return _then(_ScriptPublicKey(
scriptPublicKey: null == scriptPublicKey ? _self.scriptPublicKey : scriptPublicKey // ignore: cast_nullable_to_non_nullable
as Uint8List,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$Outpoint {

 String get transactionId; int get index;
/// Create a copy of Outpoint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OutpointCopyWith<Outpoint> get copyWith => _$OutpointCopyWithImpl<Outpoint>(this as Outpoint, _$identity);

  /// Serializes this Outpoint to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Outpoint&&(identical(other.transactionId, transactionId) || other.transactionId == transactionId)&&(identical(other.index, index) || other.index == index));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,transactionId,index);

@override
String toString() {
  return 'Outpoint(transactionId: $transactionId, index: $index)';
}


}

/// @nodoc
abstract mixin class $OutpointCopyWith<$Res>  {
  factory $OutpointCopyWith(Outpoint value, $Res Function(Outpoint) _then) = _$OutpointCopyWithImpl;
@useResult
$Res call({
 String transactionId, int index
});




}
/// @nodoc
class _$OutpointCopyWithImpl<$Res>
    implements $OutpointCopyWith<$Res> {
  _$OutpointCopyWithImpl(this._self, this._then);

  final Outpoint _self;
  final $Res Function(Outpoint) _then;

/// Create a copy of Outpoint
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? transactionId = null,Object? index = null,}) {
  return _then(_self.copyWith(
transactionId: null == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as String,index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Outpoint].
extension OutpointPatterns on Outpoint {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Outpoint value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Outpoint() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Outpoint value)  $default,){
final _that = this;
switch (_that) {
case _Outpoint():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Outpoint value)?  $default,){
final _that = this;
switch (_that) {
case _Outpoint() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String transactionId,  int index)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Outpoint() when $default != null:
return $default(_that.transactionId,_that.index);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String transactionId,  int index)  $default,) {final _that = this;
switch (_that) {
case _Outpoint():
return $default(_that.transactionId,_that.index);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String transactionId,  int index)?  $default,) {final _that = this;
switch (_that) {
case _Outpoint() when $default != null:
return $default(_that.transactionId,_that.index);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Outpoint extends Outpoint {
   _Outpoint({required this.transactionId, required this.index}): super._();
  factory _Outpoint.fromJson(Map<String, dynamic> json) => _$OutpointFromJson(json);

@override final  String transactionId;
@override final  int index;

/// Create a copy of Outpoint
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OutpointCopyWith<_Outpoint> get copyWith => __$OutpointCopyWithImpl<_Outpoint>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OutpointToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Outpoint&&(identical(other.transactionId, transactionId) || other.transactionId == transactionId)&&(identical(other.index, index) || other.index == index));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,transactionId,index);

@override
String toString() {
  return 'Outpoint(transactionId: $transactionId, index: $index)';
}


}

/// @nodoc
abstract mixin class _$OutpointCopyWith<$Res> implements $OutpointCopyWith<$Res> {
  factory _$OutpointCopyWith(_Outpoint value, $Res Function(_Outpoint) _then) = __$OutpointCopyWithImpl;
@override @useResult
$Res call({
 String transactionId, int index
});




}
/// @nodoc
class __$OutpointCopyWithImpl<$Res>
    implements _$OutpointCopyWith<$Res> {
  __$OutpointCopyWithImpl(this._self, this._then);

  final _Outpoint _self;
  final $Res Function(_Outpoint) _then;

/// Create a copy of Outpoint
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? transactionId = null,Object? index = null,}) {
  return _then(_Outpoint(
transactionId: null == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as String,index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$TransactionInput {

 String get transactionId; int get index; String get previousOutpointHash; BigInt get previousOutpointIndex; String get signatureScript;@JsonKey(fromJson: _sigOpCountFromJson) int get sigOpCount;// new fields
 String? get previousOutpointAddress; int? get previousOutpointAmount;
/// Create a copy of TransactionInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionInputCopyWith<TransactionInput> get copyWith => _$TransactionInputCopyWithImpl<TransactionInput>(this as TransactionInput, _$identity);

  /// Serializes this TransactionInput to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionInput&&(identical(other.transactionId, transactionId) || other.transactionId == transactionId)&&(identical(other.index, index) || other.index == index)&&(identical(other.previousOutpointHash, previousOutpointHash) || other.previousOutpointHash == previousOutpointHash)&&(identical(other.previousOutpointIndex, previousOutpointIndex) || other.previousOutpointIndex == previousOutpointIndex)&&(identical(other.signatureScript, signatureScript) || other.signatureScript == signatureScript)&&(identical(other.sigOpCount, sigOpCount) || other.sigOpCount == sigOpCount)&&(identical(other.previousOutpointAddress, previousOutpointAddress) || other.previousOutpointAddress == previousOutpointAddress)&&(identical(other.previousOutpointAmount, previousOutpointAmount) || other.previousOutpointAmount == previousOutpointAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,transactionId,index,previousOutpointHash,previousOutpointIndex,signatureScript,sigOpCount,previousOutpointAddress,previousOutpointAmount);

@override
String toString() {
  return 'TransactionInput(transactionId: $transactionId, index: $index, previousOutpointHash: $previousOutpointHash, previousOutpointIndex: $previousOutpointIndex, signatureScript: $signatureScript, sigOpCount: $sigOpCount, previousOutpointAddress: $previousOutpointAddress, previousOutpointAmount: $previousOutpointAmount)';
}


}

/// @nodoc
abstract mixin class $TransactionInputCopyWith<$Res>  {
  factory $TransactionInputCopyWith(TransactionInput value, $Res Function(TransactionInput) _then) = _$TransactionInputCopyWithImpl;
@useResult
$Res call({
 String transactionId, int index, String previousOutpointHash, BigInt previousOutpointIndex, String signatureScript,@JsonKey(fromJson: _sigOpCountFromJson) int sigOpCount, String? previousOutpointAddress, int? previousOutpointAmount
});




}
/// @nodoc
class _$TransactionInputCopyWithImpl<$Res>
    implements $TransactionInputCopyWith<$Res> {
  _$TransactionInputCopyWithImpl(this._self, this._then);

  final TransactionInput _self;
  final $Res Function(TransactionInput) _then;

/// Create a copy of TransactionInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? transactionId = null,Object? index = null,Object? previousOutpointHash = null,Object? previousOutpointIndex = null,Object? signatureScript = null,Object? sigOpCount = null,Object? previousOutpointAddress = freezed,Object? previousOutpointAmount = freezed,}) {
  return _then(_self.copyWith(
transactionId: null == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as String,index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,previousOutpointHash: null == previousOutpointHash ? _self.previousOutpointHash : previousOutpointHash // ignore: cast_nullable_to_non_nullable
as String,previousOutpointIndex: null == previousOutpointIndex ? _self.previousOutpointIndex : previousOutpointIndex // ignore: cast_nullable_to_non_nullable
as BigInt,signatureScript: null == signatureScript ? _self.signatureScript : signatureScript // ignore: cast_nullable_to_non_nullable
as String,sigOpCount: null == sigOpCount ? _self.sigOpCount : sigOpCount // ignore: cast_nullable_to_non_nullable
as int,previousOutpointAddress: freezed == previousOutpointAddress ? _self.previousOutpointAddress : previousOutpointAddress // ignore: cast_nullable_to_non_nullable
as String?,previousOutpointAmount: freezed == previousOutpointAmount ? _self.previousOutpointAmount : previousOutpointAmount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [TransactionInput].
extension TransactionInputPatterns on TransactionInput {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransactionInput value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransactionInput() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransactionInput value)  $default,){
final _that = this;
switch (_that) {
case _TransactionInput():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransactionInput value)?  $default,){
final _that = this;
switch (_that) {
case _TransactionInput() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String transactionId,  int index,  String previousOutpointHash,  BigInt previousOutpointIndex,  String signatureScript, @JsonKey(fromJson: _sigOpCountFromJson)  int sigOpCount,  String? previousOutpointAddress,  int? previousOutpointAmount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransactionInput() when $default != null:
return $default(_that.transactionId,_that.index,_that.previousOutpointHash,_that.previousOutpointIndex,_that.signatureScript,_that.sigOpCount,_that.previousOutpointAddress,_that.previousOutpointAmount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String transactionId,  int index,  String previousOutpointHash,  BigInt previousOutpointIndex,  String signatureScript, @JsonKey(fromJson: _sigOpCountFromJson)  int sigOpCount,  String? previousOutpointAddress,  int? previousOutpointAmount)  $default,) {final _that = this;
switch (_that) {
case _TransactionInput():
return $default(_that.transactionId,_that.index,_that.previousOutpointHash,_that.previousOutpointIndex,_that.signatureScript,_that.sigOpCount,_that.previousOutpointAddress,_that.previousOutpointAmount);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String transactionId,  int index,  String previousOutpointHash,  BigInt previousOutpointIndex,  String signatureScript, @JsonKey(fromJson: _sigOpCountFromJson)  int sigOpCount,  String? previousOutpointAddress,  int? previousOutpointAmount)?  $default,) {final _that = this;
switch (_that) {
case _TransactionInput() when $default != null:
return $default(_that.transactionId,_that.index,_that.previousOutpointHash,_that.previousOutpointIndex,_that.signatureScript,_that.sigOpCount,_that.previousOutpointAddress,_that.previousOutpointAmount);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: .snake)
class _TransactionInput extends TransactionInput {
  const _TransactionInput({required this.transactionId, required this.index, required this.previousOutpointHash, required this.previousOutpointIndex, required this.signatureScript, @JsonKey(fromJson: _sigOpCountFromJson) required this.sigOpCount, this.previousOutpointAddress, this.previousOutpointAmount}): super._();
  factory _TransactionInput.fromJson(Map<String, dynamic> json) => _$TransactionInputFromJson(json);

@override final  String transactionId;
@override final  int index;
@override final  String previousOutpointHash;
@override final  BigInt previousOutpointIndex;
@override final  String signatureScript;
@override@JsonKey(fromJson: _sigOpCountFromJson) final  int sigOpCount;
// new fields
@override final  String? previousOutpointAddress;
@override final  int? previousOutpointAmount;

/// Create a copy of TransactionInput
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionInputCopyWith<_TransactionInput> get copyWith => __$TransactionInputCopyWithImpl<_TransactionInput>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransactionInputToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionInput&&(identical(other.transactionId, transactionId) || other.transactionId == transactionId)&&(identical(other.index, index) || other.index == index)&&(identical(other.previousOutpointHash, previousOutpointHash) || other.previousOutpointHash == previousOutpointHash)&&(identical(other.previousOutpointIndex, previousOutpointIndex) || other.previousOutpointIndex == previousOutpointIndex)&&(identical(other.signatureScript, signatureScript) || other.signatureScript == signatureScript)&&(identical(other.sigOpCount, sigOpCount) || other.sigOpCount == sigOpCount)&&(identical(other.previousOutpointAddress, previousOutpointAddress) || other.previousOutpointAddress == previousOutpointAddress)&&(identical(other.previousOutpointAmount, previousOutpointAmount) || other.previousOutpointAmount == previousOutpointAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,transactionId,index,previousOutpointHash,previousOutpointIndex,signatureScript,sigOpCount,previousOutpointAddress,previousOutpointAmount);

@override
String toString() {
  return 'TransactionInput(transactionId: $transactionId, index: $index, previousOutpointHash: $previousOutpointHash, previousOutpointIndex: $previousOutpointIndex, signatureScript: $signatureScript, sigOpCount: $sigOpCount, previousOutpointAddress: $previousOutpointAddress, previousOutpointAmount: $previousOutpointAmount)';
}


}

/// @nodoc
abstract mixin class _$TransactionInputCopyWith<$Res> implements $TransactionInputCopyWith<$Res> {
  factory _$TransactionInputCopyWith(_TransactionInput value, $Res Function(_TransactionInput) _then) = __$TransactionInputCopyWithImpl;
@override @useResult
$Res call({
 String transactionId, int index, String previousOutpointHash, BigInt previousOutpointIndex, String signatureScript,@JsonKey(fromJson: _sigOpCountFromJson) int sigOpCount, String? previousOutpointAddress, int? previousOutpointAmount
});




}
/// @nodoc
class __$TransactionInputCopyWithImpl<$Res>
    implements _$TransactionInputCopyWith<$Res> {
  __$TransactionInputCopyWithImpl(this._self, this._then);

  final _TransactionInput _self;
  final $Res Function(_TransactionInput) _then;

/// Create a copy of TransactionInput
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? transactionId = null,Object? index = null,Object? previousOutpointHash = null,Object? previousOutpointIndex = null,Object? signatureScript = null,Object? sigOpCount = null,Object? previousOutpointAddress = freezed,Object? previousOutpointAmount = freezed,}) {
  return _then(_TransactionInput(
transactionId: null == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as String,index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,previousOutpointHash: null == previousOutpointHash ? _self.previousOutpointHash : previousOutpointHash // ignore: cast_nullable_to_non_nullable
as String,previousOutpointIndex: null == previousOutpointIndex ? _self.previousOutpointIndex : previousOutpointIndex // ignore: cast_nullable_to_non_nullable
as BigInt,signatureScript: null == signatureScript ? _self.signatureScript : signatureScript // ignore: cast_nullable_to_non_nullable
as String,sigOpCount: null == sigOpCount ? _self.sigOpCount : sigOpCount // ignore: cast_nullable_to_non_nullable
as int,previousOutpointAddress: freezed == previousOutpointAddress ? _self.previousOutpointAddress : previousOutpointAddress // ignore: cast_nullable_to_non_nullable
as String?,previousOutpointAmount: freezed == previousOutpointAmount ? _self.previousOutpointAmount : previousOutpointAmount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$TransactionOutput {

 String get transactionId; int get index; int get amount; String get scriptPublicKey; String get scriptPublicKeyAddress; String get scriptPublicKeyType;
/// Create a copy of TransactionOutput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionOutputCopyWith<TransactionOutput> get copyWith => _$TransactionOutputCopyWithImpl<TransactionOutput>(this as TransactionOutput, _$identity);

  /// Serializes this TransactionOutput to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionOutput&&(identical(other.transactionId, transactionId) || other.transactionId == transactionId)&&(identical(other.index, index) || other.index == index)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.scriptPublicKey, scriptPublicKey) || other.scriptPublicKey == scriptPublicKey)&&(identical(other.scriptPublicKeyAddress, scriptPublicKeyAddress) || other.scriptPublicKeyAddress == scriptPublicKeyAddress)&&(identical(other.scriptPublicKeyType, scriptPublicKeyType) || other.scriptPublicKeyType == scriptPublicKeyType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,transactionId,index,amount,scriptPublicKey,scriptPublicKeyAddress,scriptPublicKeyType);

@override
String toString() {
  return 'TransactionOutput(transactionId: $transactionId, index: $index, amount: $amount, scriptPublicKey: $scriptPublicKey, scriptPublicKeyAddress: $scriptPublicKeyAddress, scriptPublicKeyType: $scriptPublicKeyType)';
}


}

/// @nodoc
abstract mixin class $TransactionOutputCopyWith<$Res>  {
  factory $TransactionOutputCopyWith(TransactionOutput value, $Res Function(TransactionOutput) _then) = _$TransactionOutputCopyWithImpl;
@useResult
$Res call({
 String transactionId, int index, int amount, String scriptPublicKey, String scriptPublicKeyAddress, String scriptPublicKeyType
});




}
/// @nodoc
class _$TransactionOutputCopyWithImpl<$Res>
    implements $TransactionOutputCopyWith<$Res> {
  _$TransactionOutputCopyWithImpl(this._self, this._then);

  final TransactionOutput _self;
  final $Res Function(TransactionOutput) _then;

/// Create a copy of TransactionOutput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? transactionId = null,Object? index = null,Object? amount = null,Object? scriptPublicKey = null,Object? scriptPublicKeyAddress = null,Object? scriptPublicKeyType = null,}) {
  return _then(_self.copyWith(
transactionId: null == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as String,index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,scriptPublicKey: null == scriptPublicKey ? _self.scriptPublicKey : scriptPublicKey // ignore: cast_nullable_to_non_nullable
as String,scriptPublicKeyAddress: null == scriptPublicKeyAddress ? _self.scriptPublicKeyAddress : scriptPublicKeyAddress // ignore: cast_nullable_to_non_nullable
as String,scriptPublicKeyType: null == scriptPublicKeyType ? _self.scriptPublicKeyType : scriptPublicKeyType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TransactionOutput].
extension TransactionOutputPatterns on TransactionOutput {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransactionOutput value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransactionOutput() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransactionOutput value)  $default,){
final _that = this;
switch (_that) {
case _TransactionOutput():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransactionOutput value)?  $default,){
final _that = this;
switch (_that) {
case _TransactionOutput() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String transactionId,  int index,  int amount,  String scriptPublicKey,  String scriptPublicKeyAddress,  String scriptPublicKeyType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransactionOutput() when $default != null:
return $default(_that.transactionId,_that.index,_that.amount,_that.scriptPublicKey,_that.scriptPublicKeyAddress,_that.scriptPublicKeyType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String transactionId,  int index,  int amount,  String scriptPublicKey,  String scriptPublicKeyAddress,  String scriptPublicKeyType)  $default,) {final _that = this;
switch (_that) {
case _TransactionOutput():
return $default(_that.transactionId,_that.index,_that.amount,_that.scriptPublicKey,_that.scriptPublicKeyAddress,_that.scriptPublicKeyType);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String transactionId,  int index,  int amount,  String scriptPublicKey,  String scriptPublicKeyAddress,  String scriptPublicKeyType)?  $default,) {final _that = this;
switch (_that) {
case _TransactionOutput() when $default != null:
return $default(_that.transactionId,_that.index,_that.amount,_that.scriptPublicKey,_that.scriptPublicKeyAddress,_that.scriptPublicKeyType);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: .snake)
class _TransactionOutput implements TransactionOutput {
  const _TransactionOutput({required this.transactionId, required this.index, required this.amount, required this.scriptPublicKey, required this.scriptPublicKeyAddress, required this.scriptPublicKeyType});
  factory _TransactionOutput.fromJson(Map<String, dynamic> json) => _$TransactionOutputFromJson(json);

@override final  String transactionId;
@override final  int index;
@override final  int amount;
@override final  String scriptPublicKey;
@override final  String scriptPublicKeyAddress;
@override final  String scriptPublicKeyType;

/// Create a copy of TransactionOutput
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionOutputCopyWith<_TransactionOutput> get copyWith => __$TransactionOutputCopyWithImpl<_TransactionOutput>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransactionOutputToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionOutput&&(identical(other.transactionId, transactionId) || other.transactionId == transactionId)&&(identical(other.index, index) || other.index == index)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.scriptPublicKey, scriptPublicKey) || other.scriptPublicKey == scriptPublicKey)&&(identical(other.scriptPublicKeyAddress, scriptPublicKeyAddress) || other.scriptPublicKeyAddress == scriptPublicKeyAddress)&&(identical(other.scriptPublicKeyType, scriptPublicKeyType) || other.scriptPublicKeyType == scriptPublicKeyType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,transactionId,index,amount,scriptPublicKey,scriptPublicKeyAddress,scriptPublicKeyType);

@override
String toString() {
  return 'TransactionOutput(transactionId: $transactionId, index: $index, amount: $amount, scriptPublicKey: $scriptPublicKey, scriptPublicKeyAddress: $scriptPublicKeyAddress, scriptPublicKeyType: $scriptPublicKeyType)';
}


}

/// @nodoc
abstract mixin class _$TransactionOutputCopyWith<$Res> implements $TransactionOutputCopyWith<$Res> {
  factory _$TransactionOutputCopyWith(_TransactionOutput value, $Res Function(_TransactionOutput) _then) = __$TransactionOutputCopyWithImpl;
@override @useResult
$Res call({
 String transactionId, int index, int amount, String scriptPublicKey, String scriptPublicKeyAddress, String scriptPublicKeyType
});




}
/// @nodoc
class __$TransactionOutputCopyWithImpl<$Res>
    implements _$TransactionOutputCopyWith<$Res> {
  __$TransactionOutputCopyWithImpl(this._self, this._then);

  final _TransactionOutput _self;
  final $Res Function(_TransactionOutput) _then;

/// Create a copy of TransactionOutput
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? transactionId = null,Object? index = null,Object? amount = null,Object? scriptPublicKey = null,Object? scriptPublicKeyAddress = null,Object? scriptPublicKeyType = null,}) {
  return _then(_TransactionOutput(
transactionId: null == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as String,index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,scriptPublicKey: null == scriptPublicKey ? _self.scriptPublicKey : scriptPublicKey // ignore: cast_nullable_to_non_nullable
as String,scriptPublicKeyAddress: null == scriptPublicKeyAddress ? _self.scriptPublicKeyAddress : scriptPublicKeyAddress // ignore: cast_nullable_to_non_nullable
as String,scriptPublicKeyType: null == scriptPublicKeyType ? _self.scriptPublicKeyType : scriptPublicKeyType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$Transaction {

 String? get subnetworkId; String get transactionId;// @Default([]) List<String> blockHash,
 int get blockTime; bool get isAccepted; String? get acceptingBlockHash; int? get acceptingBlockBlueScore; List<TransactionInput> get inputs; List<TransactionOutput> get outputs; String get payload;
/// Create a copy of Transaction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionCopyWith<Transaction> get copyWith => _$TransactionCopyWithImpl<Transaction>(this as Transaction, _$identity);

  /// Serializes this Transaction to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Transaction&&(identical(other.subnetworkId, subnetworkId) || other.subnetworkId == subnetworkId)&&(identical(other.transactionId, transactionId) || other.transactionId == transactionId)&&(identical(other.blockTime, blockTime) || other.blockTime == blockTime)&&(identical(other.isAccepted, isAccepted) || other.isAccepted == isAccepted)&&(identical(other.acceptingBlockHash, acceptingBlockHash) || other.acceptingBlockHash == acceptingBlockHash)&&(identical(other.acceptingBlockBlueScore, acceptingBlockBlueScore) || other.acceptingBlockBlueScore == acceptingBlockBlueScore)&&const DeepCollectionEquality().equals(other.inputs, inputs)&&const DeepCollectionEquality().equals(other.outputs, outputs)&&(identical(other.payload, payload) || other.payload == payload));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,subnetworkId,transactionId,blockTime,isAccepted,acceptingBlockHash,acceptingBlockBlueScore,const DeepCollectionEquality().hash(inputs),const DeepCollectionEquality().hash(outputs),payload);

@override
String toString() {
  return 'Transaction(subnetworkId: $subnetworkId, transactionId: $transactionId, blockTime: $blockTime, isAccepted: $isAccepted, acceptingBlockHash: $acceptingBlockHash, acceptingBlockBlueScore: $acceptingBlockBlueScore, inputs: $inputs, outputs: $outputs, payload: $payload)';
}


}

/// @nodoc
abstract mixin class $TransactionCopyWith<$Res>  {
  factory $TransactionCopyWith(Transaction value, $Res Function(Transaction) _then) = _$TransactionCopyWithImpl;
@useResult
$Res call({
 String? subnetworkId, String transactionId, int blockTime, bool isAccepted, String? acceptingBlockHash, int? acceptingBlockBlueScore, List<TransactionInput> inputs, List<TransactionOutput> outputs, String payload
});




}
/// @nodoc
class _$TransactionCopyWithImpl<$Res>
    implements $TransactionCopyWith<$Res> {
  _$TransactionCopyWithImpl(this._self, this._then);

  final Transaction _self;
  final $Res Function(Transaction) _then;

/// Create a copy of Transaction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? subnetworkId = freezed,Object? transactionId = null,Object? blockTime = null,Object? isAccepted = null,Object? acceptingBlockHash = freezed,Object? acceptingBlockBlueScore = freezed,Object? inputs = null,Object? outputs = null,Object? payload = null,}) {
  return _then(_self.copyWith(
subnetworkId: freezed == subnetworkId ? _self.subnetworkId : subnetworkId // ignore: cast_nullable_to_non_nullable
as String?,transactionId: null == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as String,blockTime: null == blockTime ? _self.blockTime : blockTime // ignore: cast_nullable_to_non_nullable
as int,isAccepted: null == isAccepted ? _self.isAccepted : isAccepted // ignore: cast_nullable_to_non_nullable
as bool,acceptingBlockHash: freezed == acceptingBlockHash ? _self.acceptingBlockHash : acceptingBlockHash // ignore: cast_nullable_to_non_nullable
as String?,acceptingBlockBlueScore: freezed == acceptingBlockBlueScore ? _self.acceptingBlockBlueScore : acceptingBlockBlueScore // ignore: cast_nullable_to_non_nullable
as int?,inputs: null == inputs ? _self.inputs : inputs // ignore: cast_nullable_to_non_nullable
as List<TransactionInput>,outputs: null == outputs ? _self.outputs : outputs // ignore: cast_nullable_to_non_nullable
as List<TransactionOutput>,payload: null == payload ? _self.payload : payload // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Transaction].
extension TransactionPatterns on Transaction {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Transaction value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Transaction() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Transaction value)  $default,){
final _that = this;
switch (_that) {
case _Transaction():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Transaction value)?  $default,){
final _that = this;
switch (_that) {
case _Transaction() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? subnetworkId,  String transactionId,  int blockTime,  bool isAccepted,  String? acceptingBlockHash,  int? acceptingBlockBlueScore,  List<TransactionInput> inputs,  List<TransactionOutput> outputs,  String payload)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Transaction() when $default != null:
return $default(_that.subnetworkId,_that.transactionId,_that.blockTime,_that.isAccepted,_that.acceptingBlockHash,_that.acceptingBlockBlueScore,_that.inputs,_that.outputs,_that.payload);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? subnetworkId,  String transactionId,  int blockTime,  bool isAccepted,  String? acceptingBlockHash,  int? acceptingBlockBlueScore,  List<TransactionInput> inputs,  List<TransactionOutput> outputs,  String payload)  $default,) {final _that = this;
switch (_that) {
case _Transaction():
return $default(_that.subnetworkId,_that.transactionId,_that.blockTime,_that.isAccepted,_that.acceptingBlockHash,_that.acceptingBlockBlueScore,_that.inputs,_that.outputs,_that.payload);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? subnetworkId,  String transactionId,  int blockTime,  bool isAccepted,  String? acceptingBlockHash,  int? acceptingBlockBlueScore,  List<TransactionInput> inputs,  List<TransactionOutput> outputs,  String payload)?  $default,) {final _that = this;
switch (_that) {
case _Transaction() when $default != null:
return $default(_that.subnetworkId,_that.transactionId,_that.blockTime,_that.isAccepted,_that.acceptingBlockHash,_that.acceptingBlockBlueScore,_that.inputs,_that.outputs,_that.payload);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: .snake)
class _Transaction extends Transaction {
   _Transaction({this.subnetworkId, required this.transactionId, required this.blockTime, required this.isAccepted, this.acceptingBlockHash, this.acceptingBlockBlueScore, final  List<TransactionInput> inputs = const [], final  List<TransactionOutput> outputs = const [], this.payload = ''}): _inputs = inputs,_outputs = outputs,super._();
  factory _Transaction.fromJson(Map<String, dynamic> json) => _$TransactionFromJson(json);

@override final  String? subnetworkId;
@override final  String transactionId;
// @Default([]) List<String> blockHash,
@override final  int blockTime;
@override final  bool isAccepted;
@override final  String? acceptingBlockHash;
@override final  int? acceptingBlockBlueScore;
 final  List<TransactionInput> _inputs;
@override@JsonKey() List<TransactionInput> get inputs {
  if (_inputs is EqualUnmodifiableListView) return _inputs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_inputs);
}

 final  List<TransactionOutput> _outputs;
@override@JsonKey() List<TransactionOutput> get outputs {
  if (_outputs is EqualUnmodifiableListView) return _outputs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_outputs);
}

@override@JsonKey() final  String payload;

/// Create a copy of Transaction
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionCopyWith<_Transaction> get copyWith => __$TransactionCopyWithImpl<_Transaction>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransactionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Transaction&&(identical(other.subnetworkId, subnetworkId) || other.subnetworkId == subnetworkId)&&(identical(other.transactionId, transactionId) || other.transactionId == transactionId)&&(identical(other.blockTime, blockTime) || other.blockTime == blockTime)&&(identical(other.isAccepted, isAccepted) || other.isAccepted == isAccepted)&&(identical(other.acceptingBlockHash, acceptingBlockHash) || other.acceptingBlockHash == acceptingBlockHash)&&(identical(other.acceptingBlockBlueScore, acceptingBlockBlueScore) || other.acceptingBlockBlueScore == acceptingBlockBlueScore)&&const DeepCollectionEquality().equals(other._inputs, _inputs)&&const DeepCollectionEquality().equals(other._outputs, _outputs)&&(identical(other.payload, payload) || other.payload == payload));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,subnetworkId,transactionId,blockTime,isAccepted,acceptingBlockHash,acceptingBlockBlueScore,const DeepCollectionEquality().hash(_inputs),const DeepCollectionEquality().hash(_outputs),payload);

@override
String toString() {
  return 'Transaction(subnetworkId: $subnetworkId, transactionId: $transactionId, blockTime: $blockTime, isAccepted: $isAccepted, acceptingBlockHash: $acceptingBlockHash, acceptingBlockBlueScore: $acceptingBlockBlueScore, inputs: $inputs, outputs: $outputs, payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$TransactionCopyWith<$Res> implements $TransactionCopyWith<$Res> {
  factory _$TransactionCopyWith(_Transaction value, $Res Function(_Transaction) _then) = __$TransactionCopyWithImpl;
@override @useResult
$Res call({
 String? subnetworkId, String transactionId, int blockTime, bool isAccepted, String? acceptingBlockHash, int? acceptingBlockBlueScore, List<TransactionInput> inputs, List<TransactionOutput> outputs, String payload
});




}
/// @nodoc
class __$TransactionCopyWithImpl<$Res>
    implements _$TransactionCopyWith<$Res> {
  __$TransactionCopyWithImpl(this._self, this._then);

  final _Transaction _self;
  final $Res Function(_Transaction) _then;

/// Create a copy of Transaction
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? subnetworkId = freezed,Object? transactionId = null,Object? blockTime = null,Object? isAccepted = null,Object? acceptingBlockHash = freezed,Object? acceptingBlockBlueScore = freezed,Object? inputs = null,Object? outputs = null,Object? payload = null,}) {
  return _then(_Transaction(
subnetworkId: freezed == subnetworkId ? _self.subnetworkId : subnetworkId // ignore: cast_nullable_to_non_nullable
as String?,transactionId: null == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as String,blockTime: null == blockTime ? _self.blockTime : blockTime // ignore: cast_nullable_to_non_nullable
as int,isAccepted: null == isAccepted ? _self.isAccepted : isAccepted // ignore: cast_nullable_to_non_nullable
as bool,acceptingBlockHash: freezed == acceptingBlockHash ? _self.acceptingBlockHash : acceptingBlockHash // ignore: cast_nullable_to_non_nullable
as String?,acceptingBlockBlueScore: freezed == acceptingBlockBlueScore ? _self.acceptingBlockBlueScore : acceptingBlockBlueScore // ignore: cast_nullable_to_non_nullable
as int?,inputs: null == inputs ? _self._inputs : inputs // ignore: cast_nullable_to_non_nullable
as List<TransactionInput>,outputs: null == outputs ? _self._outputs : outputs // ignore: cast_nullable_to_non_nullable
as List<TransactionOutput>,payload: null == payload ? _self.payload : payload // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
