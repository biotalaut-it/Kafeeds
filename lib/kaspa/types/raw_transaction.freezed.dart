// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'raw_transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RawInput {

 Address get address; Outpoint get previousOutpoint; Uint8List get signatureScript;/*uint64*/
 Int64 get sequence;/*byte*/
 int get sigOpCount; UtxoEntry get utxoEntry;
/// Create a copy of RawInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RawInputCopyWith<RawInput> get copyWith => _$RawInputCopyWithImpl<RawInput>(this as RawInput, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RawInput&&(identical(other.address, address) || other.address == address)&&(identical(other.previousOutpoint, previousOutpoint) || other.previousOutpoint == previousOutpoint)&&const DeepCollectionEquality().equals(other.signatureScript, signatureScript)&&(identical(other.sequence, sequence) || other.sequence == sequence)&&(identical(other.sigOpCount, sigOpCount) || other.sigOpCount == sigOpCount)&&(identical(other.utxoEntry, utxoEntry) || other.utxoEntry == utxoEntry));
}


@override
int get hashCode => Object.hash(runtimeType,address,previousOutpoint,const DeepCollectionEquality().hash(signatureScript),sequence,sigOpCount,utxoEntry);

@override
String toString() {
  return 'RawInput(address: $address, previousOutpoint: $previousOutpoint, signatureScript: $signatureScript, sequence: $sequence, sigOpCount: $sigOpCount, utxoEntry: $utxoEntry)';
}


}

/// @nodoc
abstract mixin class $RawInputCopyWith<$Res>  {
  factory $RawInputCopyWith(RawInput value, $Res Function(RawInput) _then) = _$RawInputCopyWithImpl;
@useResult
$Res call({
 Address address, Outpoint previousOutpoint, Uint8List signatureScript, Int64 sequence, int sigOpCount, UtxoEntry utxoEntry
});


$AddressCopyWith<$Res> get address;$OutpointCopyWith<$Res> get previousOutpoint;$UtxoEntryCopyWith<$Res> get utxoEntry;

}
/// @nodoc
class _$RawInputCopyWithImpl<$Res>
    implements $RawInputCopyWith<$Res> {
  _$RawInputCopyWithImpl(this._self, this._then);

  final RawInput _self;
  final $Res Function(RawInput) _then;

/// Create a copy of RawInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? address = null,Object? previousOutpoint = null,Object? signatureScript = null,Object? sequence = null,Object? sigOpCount = null,Object? utxoEntry = null,}) {
  return _then(_self.copyWith(
address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as Address,previousOutpoint: null == previousOutpoint ? _self.previousOutpoint : previousOutpoint // ignore: cast_nullable_to_non_nullable
as Outpoint,signatureScript: null == signatureScript ? _self.signatureScript : signatureScript // ignore: cast_nullable_to_non_nullable
as Uint8List,sequence: null == sequence ? _self.sequence : sequence // ignore: cast_nullable_to_non_nullable
as Int64,sigOpCount: null == sigOpCount ? _self.sigOpCount : sigOpCount // ignore: cast_nullable_to_non_nullable
as int,utxoEntry: null == utxoEntry ? _self.utxoEntry : utxoEntry // ignore: cast_nullable_to_non_nullable
as UtxoEntry,
  ));
}
/// Create a copy of RawInput
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddressCopyWith<$Res> get address {
  
  return $AddressCopyWith<$Res>(_self.address, (value) {
    return _then(_self.copyWith(address: value));
  });
}/// Create a copy of RawInput
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OutpointCopyWith<$Res> get previousOutpoint {
  
  return $OutpointCopyWith<$Res>(_self.previousOutpoint, (value) {
    return _then(_self.copyWith(previousOutpoint: value));
  });
}/// Create a copy of RawInput
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UtxoEntryCopyWith<$Res> get utxoEntry {
  
  return $UtxoEntryCopyWith<$Res>(_self.utxoEntry, (value) {
    return _then(_self.copyWith(utxoEntry: value));
  });
}
}


/// Adds pattern-matching-related methods to [RawInput].
extension RawInputPatterns on RawInput {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RawInput value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RawInput() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RawInput value)  $default,){
final _that = this;
switch (_that) {
case _RawInput():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RawInput value)?  $default,){
final _that = this;
switch (_that) {
case _RawInput() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Address address,  Outpoint previousOutpoint,  Uint8List signatureScript,  Int64 sequence,  int sigOpCount,  UtxoEntry utxoEntry)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RawInput() when $default != null:
return $default(_that.address,_that.previousOutpoint,_that.signatureScript,_that.sequence,_that.sigOpCount,_that.utxoEntry);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Address address,  Outpoint previousOutpoint,  Uint8List signatureScript,  Int64 sequence,  int sigOpCount,  UtxoEntry utxoEntry)  $default,) {final _that = this;
switch (_that) {
case _RawInput():
return $default(_that.address,_that.previousOutpoint,_that.signatureScript,_that.sequence,_that.sigOpCount,_that.utxoEntry);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Address address,  Outpoint previousOutpoint,  Uint8List signatureScript,  Int64 sequence,  int sigOpCount,  UtxoEntry utxoEntry)?  $default,) {final _that = this;
switch (_that) {
case _RawInput() when $default != null:
return $default(_that.address,_that.previousOutpoint,_that.signatureScript,_that.sequence,_that.sigOpCount,_that.utxoEntry);case _:
  return null;

}
}

}

/// @nodoc


class _RawInput extends RawInput {
  const _RawInput({required this.address, required this.previousOutpoint, required this.signatureScript, required this.sequence, required this.sigOpCount, required this.utxoEntry}): super._();
  

@override final  Address address;
@override final  Outpoint previousOutpoint;
@override final  Uint8List signatureScript;
/*uint64*/
@override final  Int64 sequence;
/*byte*/
@override final  int sigOpCount;
@override final  UtxoEntry utxoEntry;

/// Create a copy of RawInput
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RawInputCopyWith<_RawInput> get copyWith => __$RawInputCopyWithImpl<_RawInput>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RawInput&&(identical(other.address, address) || other.address == address)&&(identical(other.previousOutpoint, previousOutpoint) || other.previousOutpoint == previousOutpoint)&&const DeepCollectionEquality().equals(other.signatureScript, signatureScript)&&(identical(other.sequence, sequence) || other.sequence == sequence)&&(identical(other.sigOpCount, sigOpCount) || other.sigOpCount == sigOpCount)&&(identical(other.utxoEntry, utxoEntry) || other.utxoEntry == utxoEntry));
}


@override
int get hashCode => Object.hash(runtimeType,address,previousOutpoint,const DeepCollectionEquality().hash(signatureScript),sequence,sigOpCount,utxoEntry);

@override
String toString() {
  return 'RawInput(address: $address, previousOutpoint: $previousOutpoint, signatureScript: $signatureScript, sequence: $sequence, sigOpCount: $sigOpCount, utxoEntry: $utxoEntry)';
}


}

/// @nodoc
abstract mixin class _$RawInputCopyWith<$Res> implements $RawInputCopyWith<$Res> {
  factory _$RawInputCopyWith(_RawInput value, $Res Function(_RawInput) _then) = __$RawInputCopyWithImpl;
@override @useResult
$Res call({
 Address address, Outpoint previousOutpoint, Uint8List signatureScript, Int64 sequence, int sigOpCount, UtxoEntry utxoEntry
});


@override $AddressCopyWith<$Res> get address;@override $OutpointCopyWith<$Res> get previousOutpoint;@override $UtxoEntryCopyWith<$Res> get utxoEntry;

}
/// @nodoc
class __$RawInputCopyWithImpl<$Res>
    implements _$RawInputCopyWith<$Res> {
  __$RawInputCopyWithImpl(this._self, this._then);

  final _RawInput _self;
  final $Res Function(_RawInput) _then;

/// Create a copy of RawInput
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? address = null,Object? previousOutpoint = null,Object? signatureScript = null,Object? sequence = null,Object? sigOpCount = null,Object? utxoEntry = null,}) {
  return _then(_RawInput(
address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as Address,previousOutpoint: null == previousOutpoint ? _self.previousOutpoint : previousOutpoint // ignore: cast_nullable_to_non_nullable
as Outpoint,signatureScript: null == signatureScript ? _self.signatureScript : signatureScript // ignore: cast_nullable_to_non_nullable
as Uint8List,sequence: null == sequence ? _self.sequence : sequence // ignore: cast_nullable_to_non_nullable
as Int64,sigOpCount: null == sigOpCount ? _self.sigOpCount : sigOpCount // ignore: cast_nullable_to_non_nullable
as int,utxoEntry: null == utxoEntry ? _self.utxoEntry : utxoEntry // ignore: cast_nullable_to_non_nullable
as UtxoEntry,
  ));
}

/// Create a copy of RawInput
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddressCopyWith<$Res> get address {
  
  return $AddressCopyWith<$Res>(_self.address, (value) {
    return _then(_self.copyWith(address: value));
  });
}/// Create a copy of RawInput
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OutpointCopyWith<$Res> get previousOutpoint {
  
  return $OutpointCopyWith<$Res>(_self.previousOutpoint, (value) {
    return _then(_self.copyWith(previousOutpoint: value));
  });
}/// Create a copy of RawInput
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
mixin _$RawOutput {

/*uint64*/
 Int64 get value; ScriptPublicKey get scriptPublicKey;
/// Create a copy of RawOutput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RawOutputCopyWith<RawOutput> get copyWith => _$RawOutputCopyWithImpl<RawOutput>(this as RawOutput, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RawOutput&&(identical(other.value, value) || other.value == value)&&(identical(other.scriptPublicKey, scriptPublicKey) || other.scriptPublicKey == scriptPublicKey));
}


@override
int get hashCode => Object.hash(runtimeType,value,scriptPublicKey);

@override
String toString() {
  return 'RawOutput(value: $value, scriptPublicKey: $scriptPublicKey)';
}


}

/// @nodoc
abstract mixin class $RawOutputCopyWith<$Res>  {
  factory $RawOutputCopyWith(RawOutput value, $Res Function(RawOutput) _then) = _$RawOutputCopyWithImpl;
@useResult
$Res call({
 Int64 value, ScriptPublicKey scriptPublicKey
});


$ScriptPublicKeyCopyWith<$Res> get scriptPublicKey;

}
/// @nodoc
class _$RawOutputCopyWithImpl<$Res>
    implements $RawOutputCopyWith<$Res> {
  _$RawOutputCopyWithImpl(this._self, this._then);

  final RawOutput _self;
  final $Res Function(RawOutput) _then;

/// Create a copy of RawOutput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = null,Object? scriptPublicKey = null,}) {
  return _then(_self.copyWith(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as Int64,scriptPublicKey: null == scriptPublicKey ? _self.scriptPublicKey : scriptPublicKey // ignore: cast_nullable_to_non_nullable
as ScriptPublicKey,
  ));
}
/// Create a copy of RawOutput
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScriptPublicKeyCopyWith<$Res> get scriptPublicKey {
  
  return $ScriptPublicKeyCopyWith<$Res>(_self.scriptPublicKey, (value) {
    return _then(_self.copyWith(scriptPublicKey: value));
  });
}
}


/// Adds pattern-matching-related methods to [RawOutput].
extension RawOutputPatterns on RawOutput {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RawOutput value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RawOutput() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RawOutput value)  $default,){
final _that = this;
switch (_that) {
case _RawOutput():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RawOutput value)?  $default,){
final _that = this;
switch (_that) {
case _RawOutput() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Int64 value,  ScriptPublicKey scriptPublicKey)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RawOutput() when $default != null:
return $default(_that.value,_that.scriptPublicKey);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Int64 value,  ScriptPublicKey scriptPublicKey)  $default,) {final _that = this;
switch (_that) {
case _RawOutput():
return $default(_that.value,_that.scriptPublicKey);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Int64 value,  ScriptPublicKey scriptPublicKey)?  $default,) {final _that = this;
switch (_that) {
case _RawOutput() when $default != null:
return $default(_that.value,_that.scriptPublicKey);case _:
  return null;

}
}

}

/// @nodoc


class _RawOutput extends RawOutput {
  const _RawOutput({required this.value, required this.scriptPublicKey}): super._();
  

/*uint64*/
@override final  Int64 value;
@override final  ScriptPublicKey scriptPublicKey;

/// Create a copy of RawOutput
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RawOutputCopyWith<_RawOutput> get copyWith => __$RawOutputCopyWithImpl<_RawOutput>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RawOutput&&(identical(other.value, value) || other.value == value)&&(identical(other.scriptPublicKey, scriptPublicKey) || other.scriptPublicKey == scriptPublicKey));
}


@override
int get hashCode => Object.hash(runtimeType,value,scriptPublicKey);

@override
String toString() {
  return 'RawOutput(value: $value, scriptPublicKey: $scriptPublicKey)';
}


}

/// @nodoc
abstract mixin class _$RawOutputCopyWith<$Res> implements $RawOutputCopyWith<$Res> {
  factory _$RawOutputCopyWith(_RawOutput value, $Res Function(_RawOutput) _then) = __$RawOutputCopyWithImpl;
@override @useResult
$Res call({
 Int64 value, ScriptPublicKey scriptPublicKey
});


@override $ScriptPublicKeyCopyWith<$Res> get scriptPublicKey;

}
/// @nodoc
class __$RawOutputCopyWithImpl<$Res>
    implements _$RawOutputCopyWith<$Res> {
  __$RawOutputCopyWithImpl(this._self, this._then);

  final _RawOutput _self;
  final $Res Function(_RawOutput) _then;

/// Create a copy of RawOutput
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,Object? scriptPublicKey = null,}) {
  return _then(_RawOutput(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as Int64,scriptPublicKey: null == scriptPublicKey ? _self.scriptPublicKey : scriptPublicKey // ignore: cast_nullable_to_non_nullable
as ScriptPublicKey,
  ));
}

/// Create a copy of RawOutput
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
mixin _$RawTransaction {

/*uint16*/
 int get version; List<RawInput> get inputs; List<RawOutput> get outputs;/*uint64*/
 Int64 get lockTime;/*byte[20]*/
 Uint8List get subnetworkId;/*uint64*/
 Int64 get gas; Uint8List? get payload;/*uint64*/
 Int64? get fee;/*uint64*/
 Int64? get mass; Uint8List? get id;
/// Create a copy of RawTransaction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RawTransactionCopyWith<RawTransaction> get copyWith => _$RawTransactionCopyWithImpl<RawTransaction>(this as RawTransaction, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RawTransaction&&(identical(other.version, version) || other.version == version)&&const DeepCollectionEquality().equals(other.inputs, inputs)&&const DeepCollectionEquality().equals(other.outputs, outputs)&&(identical(other.lockTime, lockTime) || other.lockTime == lockTime)&&const DeepCollectionEquality().equals(other.subnetworkId, subnetworkId)&&(identical(other.gas, gas) || other.gas == gas)&&const DeepCollectionEquality().equals(other.payload, payload)&&(identical(other.fee, fee) || other.fee == fee)&&(identical(other.mass, mass) || other.mass == mass)&&const DeepCollectionEquality().equals(other.id, id));
}


@override
int get hashCode => Object.hash(runtimeType,version,const DeepCollectionEquality().hash(inputs),const DeepCollectionEquality().hash(outputs),lockTime,const DeepCollectionEquality().hash(subnetworkId),gas,const DeepCollectionEquality().hash(payload),fee,mass,const DeepCollectionEquality().hash(id));

@override
String toString() {
  return 'RawTransaction(version: $version, inputs: $inputs, outputs: $outputs, lockTime: $lockTime, subnetworkId: $subnetworkId, gas: $gas, payload: $payload, fee: $fee, mass: $mass, id: $id)';
}


}

/// @nodoc
abstract mixin class $RawTransactionCopyWith<$Res>  {
  factory $RawTransactionCopyWith(RawTransaction value, $Res Function(RawTransaction) _then) = _$RawTransactionCopyWithImpl;
@useResult
$Res call({
 int version, List<RawInput> inputs, List<RawOutput> outputs, Int64 lockTime, Uint8List subnetworkId, Int64 gas, Uint8List? payload, Int64? fee, Int64? mass, Uint8List? id
});




}
/// @nodoc
class _$RawTransactionCopyWithImpl<$Res>
    implements $RawTransactionCopyWith<$Res> {
  _$RawTransactionCopyWithImpl(this._self, this._then);

  final RawTransaction _self;
  final $Res Function(RawTransaction) _then;

/// Create a copy of RawTransaction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? version = null,Object? inputs = null,Object? outputs = null,Object? lockTime = null,Object? subnetworkId = null,Object? gas = null,Object? payload = freezed,Object? fee = freezed,Object? mass = freezed,Object? id = freezed,}) {
  return _then(_self.copyWith(
version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,inputs: null == inputs ? _self.inputs : inputs // ignore: cast_nullable_to_non_nullable
as List<RawInput>,outputs: null == outputs ? _self.outputs : outputs // ignore: cast_nullable_to_non_nullable
as List<RawOutput>,lockTime: null == lockTime ? _self.lockTime : lockTime // ignore: cast_nullable_to_non_nullable
as Int64,subnetworkId: null == subnetworkId ? _self.subnetworkId : subnetworkId // ignore: cast_nullable_to_non_nullable
as Uint8List,gas: null == gas ? _self.gas : gas // ignore: cast_nullable_to_non_nullable
as Int64,payload: freezed == payload ? _self.payload : payload // ignore: cast_nullable_to_non_nullable
as Uint8List?,fee: freezed == fee ? _self.fee : fee // ignore: cast_nullable_to_non_nullable
as Int64?,mass: freezed == mass ? _self.mass : mass // ignore: cast_nullable_to_non_nullable
as Int64?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as Uint8List?,
  ));
}

}


/// Adds pattern-matching-related methods to [RawTransaction].
extension RawTransactionPatterns on RawTransaction {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int version,  List<RawInput> inputs,  List<RawOutput> outputs,  Int64 lockTime,  Uint8List subnetworkId,  Int64 gas,  Uint8List? payload,  Int64? fee,  Int64? mass,  Uint8List? id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Transaction() when $default != null:
return $default(_that.version,_that.inputs,_that.outputs,_that.lockTime,_that.subnetworkId,_that.gas,_that.payload,_that.fee,_that.mass,_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int version,  List<RawInput> inputs,  List<RawOutput> outputs,  Int64 lockTime,  Uint8List subnetworkId,  Int64 gas,  Uint8List? payload,  Int64? fee,  Int64? mass,  Uint8List? id)  $default,) {final _that = this;
switch (_that) {
case _Transaction():
return $default(_that.version,_that.inputs,_that.outputs,_that.lockTime,_that.subnetworkId,_that.gas,_that.payload,_that.fee,_that.mass,_that.id);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int version,  List<RawInput> inputs,  List<RawOutput> outputs,  Int64 lockTime,  Uint8List subnetworkId,  Int64 gas,  Uint8List? payload,  Int64? fee,  Int64? mass,  Uint8List? id)?  $default,) {final _that = this;
switch (_that) {
case _Transaction() when $default != null:
return $default(_that.version,_that.inputs,_that.outputs,_that.lockTime,_that.subnetworkId,_that.gas,_that.payload,_that.fee,_that.mass,_that.id);case _:
  return null;

}
}

}

/// @nodoc


class _Transaction extends RawTransaction {
  const _Transaction({required this.version, required final  List<RawInput> inputs, required final  List<RawOutput> outputs, required this.lockTime, required this.subnetworkId, required this.gas, this.payload, this.fee, this.mass, this.id}): _inputs = inputs,_outputs = outputs,super._();
  

/*uint16*/
@override final  int version;
 final  List<RawInput> _inputs;
@override List<RawInput> get inputs {
  if (_inputs is EqualUnmodifiableListView) return _inputs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_inputs);
}

 final  List<RawOutput> _outputs;
@override List<RawOutput> get outputs {
  if (_outputs is EqualUnmodifiableListView) return _outputs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_outputs);
}

/*uint64*/
@override final  Int64 lockTime;
/*byte[20]*/
@override final  Uint8List subnetworkId;
/*uint64*/
@override final  Int64 gas;
@override final  Uint8List? payload;
/*uint64*/
@override final  Int64? fee;
/*uint64*/
@override final  Int64? mass;
@override final  Uint8List? id;

/// Create a copy of RawTransaction
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionCopyWith<_Transaction> get copyWith => __$TransactionCopyWithImpl<_Transaction>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Transaction&&(identical(other.version, version) || other.version == version)&&const DeepCollectionEquality().equals(other._inputs, _inputs)&&const DeepCollectionEquality().equals(other._outputs, _outputs)&&(identical(other.lockTime, lockTime) || other.lockTime == lockTime)&&const DeepCollectionEquality().equals(other.subnetworkId, subnetworkId)&&(identical(other.gas, gas) || other.gas == gas)&&const DeepCollectionEquality().equals(other.payload, payload)&&(identical(other.fee, fee) || other.fee == fee)&&(identical(other.mass, mass) || other.mass == mass)&&const DeepCollectionEquality().equals(other.id, id));
}


@override
int get hashCode => Object.hash(runtimeType,version,const DeepCollectionEquality().hash(_inputs),const DeepCollectionEquality().hash(_outputs),lockTime,const DeepCollectionEquality().hash(subnetworkId),gas,const DeepCollectionEquality().hash(payload),fee,mass,const DeepCollectionEquality().hash(id));

@override
String toString() {
  return 'RawTransaction(version: $version, inputs: $inputs, outputs: $outputs, lockTime: $lockTime, subnetworkId: $subnetworkId, gas: $gas, payload: $payload, fee: $fee, mass: $mass, id: $id)';
}


}

/// @nodoc
abstract mixin class _$TransactionCopyWith<$Res> implements $RawTransactionCopyWith<$Res> {
  factory _$TransactionCopyWith(_Transaction value, $Res Function(_Transaction) _then) = __$TransactionCopyWithImpl;
@override @useResult
$Res call({
 int version, List<RawInput> inputs, List<RawOutput> outputs, Int64 lockTime, Uint8List subnetworkId, Int64 gas, Uint8List? payload, Int64? fee, Int64? mass, Uint8List? id
});




}
/// @nodoc
class __$TransactionCopyWithImpl<$Res>
    implements _$TransactionCopyWith<$Res> {
  __$TransactionCopyWithImpl(this._self, this._then);

  final _Transaction _self;
  final $Res Function(_Transaction) _then;

/// Create a copy of RawTransaction
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? version = null,Object? inputs = null,Object? outputs = null,Object? lockTime = null,Object? subnetworkId = null,Object? gas = null,Object? payload = freezed,Object? fee = freezed,Object? mass = freezed,Object? id = freezed,}) {
  return _then(_Transaction(
version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,inputs: null == inputs ? _self._inputs : inputs // ignore: cast_nullable_to_non_nullable
as List<RawInput>,outputs: null == outputs ? _self._outputs : outputs // ignore: cast_nullable_to_non_nullable
as List<RawOutput>,lockTime: null == lockTime ? _self.lockTime : lockTime // ignore: cast_nullable_to_non_nullable
as Int64,subnetworkId: null == subnetworkId ? _self.subnetworkId : subnetworkId // ignore: cast_nullable_to_non_nullable
as Uint8List,gas: null == gas ? _self.gas : gas // ignore: cast_nullable_to_non_nullable
as Int64,payload: freezed == payload ? _self.payload : payload // ignore: cast_nullable_to_non_nullable
as Uint8List?,fee: freezed == fee ? _self.fee : fee // ignore: cast_nullable_to_non_nullable
as Int64?,mass: freezed == mass ? _self.mass : mass // ignore: cast_nullable_to_non_nullable
as Int64?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as Uint8List?,
  ));
}


}

// dart format on
