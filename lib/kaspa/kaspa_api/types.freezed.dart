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
mixin _$ApiAddressBalance {

 String get address; int get balance;
/// Create a copy of ApiAddressBalance
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiAddressBalanceCopyWith<ApiAddressBalance> get copyWith => _$ApiAddressBalanceCopyWithImpl<ApiAddressBalance>(this as ApiAddressBalance, _$identity);

  /// Serializes this ApiAddressBalance to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiAddressBalance&&(identical(other.address, address) || other.address == address)&&(identical(other.balance, balance) || other.balance == balance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,address,balance);

@override
String toString() {
  return 'ApiAddressBalance(address: $address, balance: $balance)';
}


}

/// @nodoc
abstract mixin class $ApiAddressBalanceCopyWith<$Res>  {
  factory $ApiAddressBalanceCopyWith(ApiAddressBalance value, $Res Function(ApiAddressBalance) _then) = _$ApiAddressBalanceCopyWithImpl;
@useResult
$Res call({
 String address, int balance
});




}
/// @nodoc
class _$ApiAddressBalanceCopyWithImpl<$Res>
    implements $ApiAddressBalanceCopyWith<$Res> {
  _$ApiAddressBalanceCopyWithImpl(this._self, this._then);

  final ApiAddressBalance _self;
  final $Res Function(ApiAddressBalance) _then;

/// Create a copy of ApiAddressBalance
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? address = null,Object? balance = null,}) {
  return _then(_self.copyWith(
address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ApiAddressBalance].
extension ApiAddressBalancePatterns on ApiAddressBalance {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApiAddressBalance value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApiAddressBalance() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApiAddressBalance value)  $default,){
final _that = this;
switch (_that) {
case _ApiAddressBalance():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApiAddressBalance value)?  $default,){
final _that = this;
switch (_that) {
case _ApiAddressBalance() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String address,  int balance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApiAddressBalance() when $default != null:
return $default(_that.address,_that.balance);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String address,  int balance)  $default,) {final _that = this;
switch (_that) {
case _ApiAddressBalance():
return $default(_that.address,_that.balance);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String address,  int balance)?  $default,) {final _that = this;
switch (_that) {
case _ApiAddressBalance() when $default != null:
return $default(_that.address,_that.balance);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ApiAddressBalance implements ApiAddressBalance {
  const _ApiAddressBalance({required this.address, required this.balance});
  factory _ApiAddressBalance.fromJson(Map<String, dynamic> json) => _$ApiAddressBalanceFromJson(json);

@override final  String address;
@override final  int balance;

/// Create a copy of ApiAddressBalance
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApiAddressBalanceCopyWith<_ApiAddressBalance> get copyWith => __$ApiAddressBalanceCopyWithImpl<_ApiAddressBalance>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ApiAddressBalanceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApiAddressBalance&&(identical(other.address, address) || other.address == address)&&(identical(other.balance, balance) || other.balance == balance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,address,balance);

@override
String toString() {
  return 'ApiAddressBalance(address: $address, balance: $balance)';
}


}

/// @nodoc
abstract mixin class _$ApiAddressBalanceCopyWith<$Res> implements $ApiAddressBalanceCopyWith<$Res> {
  factory _$ApiAddressBalanceCopyWith(_ApiAddressBalance value, $Res Function(_ApiAddressBalance) _then) = __$ApiAddressBalanceCopyWithImpl;
@override @useResult
$Res call({
 String address, int balance
});




}
/// @nodoc
class __$ApiAddressBalanceCopyWithImpl<$Res>
    implements _$ApiAddressBalanceCopyWith<$Res> {
  __$ApiAddressBalanceCopyWithImpl(this._self, this._then);

  final _ApiAddressBalance _self;
  final $Res Function(_ApiAddressBalance) _then;

/// Create a copy of ApiAddressBalance
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? address = null,Object? balance = null,}) {
  return _then(_ApiAddressBalance(
address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ApiUtxo {

 String get address; ApiOutpoint get outpoint; ApiUtxoEntry get utxoEntry;
/// Create a copy of ApiUtxo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiUtxoCopyWith<ApiUtxo> get copyWith => _$ApiUtxoCopyWithImpl<ApiUtxo>(this as ApiUtxo, _$identity);

  /// Serializes this ApiUtxo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiUtxo&&(identical(other.address, address) || other.address == address)&&(identical(other.outpoint, outpoint) || other.outpoint == outpoint)&&(identical(other.utxoEntry, utxoEntry) || other.utxoEntry == utxoEntry));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,address,outpoint,utxoEntry);

@override
String toString() {
  return 'ApiUtxo(address: $address, outpoint: $outpoint, utxoEntry: $utxoEntry)';
}


}

/// @nodoc
abstract mixin class $ApiUtxoCopyWith<$Res>  {
  factory $ApiUtxoCopyWith(ApiUtxo value, $Res Function(ApiUtxo) _then) = _$ApiUtxoCopyWithImpl;
@useResult
$Res call({
 String address, ApiOutpoint outpoint, ApiUtxoEntry utxoEntry
});


$ApiOutpointCopyWith<$Res> get outpoint;$ApiUtxoEntryCopyWith<$Res> get utxoEntry;

}
/// @nodoc
class _$ApiUtxoCopyWithImpl<$Res>
    implements $ApiUtxoCopyWith<$Res> {
  _$ApiUtxoCopyWithImpl(this._self, this._then);

  final ApiUtxo _self;
  final $Res Function(ApiUtxo) _then;

/// Create a copy of ApiUtxo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? address = null,Object? outpoint = null,Object? utxoEntry = null,}) {
  return _then(_self.copyWith(
address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,outpoint: null == outpoint ? _self.outpoint : outpoint // ignore: cast_nullable_to_non_nullable
as ApiOutpoint,utxoEntry: null == utxoEntry ? _self.utxoEntry : utxoEntry // ignore: cast_nullable_to_non_nullable
as ApiUtxoEntry,
  ));
}
/// Create a copy of ApiUtxo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApiOutpointCopyWith<$Res> get outpoint {
  
  return $ApiOutpointCopyWith<$Res>(_self.outpoint, (value) {
    return _then(_self.copyWith(outpoint: value));
  });
}/// Create a copy of ApiUtxo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApiUtxoEntryCopyWith<$Res> get utxoEntry {
  
  return $ApiUtxoEntryCopyWith<$Res>(_self.utxoEntry, (value) {
    return _then(_self.copyWith(utxoEntry: value));
  });
}
}


/// Adds pattern-matching-related methods to [ApiUtxo].
extension ApiUtxoPatterns on ApiUtxo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApiUtxo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApiUtxo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApiUtxo value)  $default,){
final _that = this;
switch (_that) {
case _ApiUtxo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApiUtxo value)?  $default,){
final _that = this;
switch (_that) {
case _ApiUtxo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String address,  ApiOutpoint outpoint,  ApiUtxoEntry utxoEntry)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApiUtxo() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String address,  ApiOutpoint outpoint,  ApiUtxoEntry utxoEntry)  $default,) {final _that = this;
switch (_that) {
case _ApiUtxo():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String address,  ApiOutpoint outpoint,  ApiUtxoEntry utxoEntry)?  $default,) {final _that = this;
switch (_that) {
case _ApiUtxo() when $default != null:
return $default(_that.address,_that.outpoint,_that.utxoEntry);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ApiUtxo implements ApiUtxo {
  const _ApiUtxo({required this.address, required this.outpoint, required this.utxoEntry});
  factory _ApiUtxo.fromJson(Map<String, dynamic> json) => _$ApiUtxoFromJson(json);

@override final  String address;
@override final  ApiOutpoint outpoint;
@override final  ApiUtxoEntry utxoEntry;

/// Create a copy of ApiUtxo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApiUtxoCopyWith<_ApiUtxo> get copyWith => __$ApiUtxoCopyWithImpl<_ApiUtxo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ApiUtxoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApiUtxo&&(identical(other.address, address) || other.address == address)&&(identical(other.outpoint, outpoint) || other.outpoint == outpoint)&&(identical(other.utxoEntry, utxoEntry) || other.utxoEntry == utxoEntry));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,address,outpoint,utxoEntry);

@override
String toString() {
  return 'ApiUtxo(address: $address, outpoint: $outpoint, utxoEntry: $utxoEntry)';
}


}

/// @nodoc
abstract mixin class _$ApiUtxoCopyWith<$Res> implements $ApiUtxoCopyWith<$Res> {
  factory _$ApiUtxoCopyWith(_ApiUtxo value, $Res Function(_ApiUtxo) _then) = __$ApiUtxoCopyWithImpl;
@override @useResult
$Res call({
 String address, ApiOutpoint outpoint, ApiUtxoEntry utxoEntry
});


@override $ApiOutpointCopyWith<$Res> get outpoint;@override $ApiUtxoEntryCopyWith<$Res> get utxoEntry;

}
/// @nodoc
class __$ApiUtxoCopyWithImpl<$Res>
    implements _$ApiUtxoCopyWith<$Res> {
  __$ApiUtxoCopyWithImpl(this._self, this._then);

  final _ApiUtxo _self;
  final $Res Function(_ApiUtxo) _then;

/// Create a copy of ApiUtxo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? address = null,Object? outpoint = null,Object? utxoEntry = null,}) {
  return _then(_ApiUtxo(
address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,outpoint: null == outpoint ? _self.outpoint : outpoint // ignore: cast_nullable_to_non_nullable
as ApiOutpoint,utxoEntry: null == utxoEntry ? _self.utxoEntry : utxoEntry // ignore: cast_nullable_to_non_nullable
as ApiUtxoEntry,
  ));
}

/// Create a copy of ApiUtxo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApiOutpointCopyWith<$Res> get outpoint {
  
  return $ApiOutpointCopyWith<$Res>(_self.outpoint, (value) {
    return _then(_self.copyWith(outpoint: value));
  });
}/// Create a copy of ApiUtxo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApiUtxoEntryCopyWith<$Res> get utxoEntry {
  
  return $ApiUtxoEntryCopyWith<$Res>(_self.utxoEntry, (value) {
    return _then(_self.copyWith(utxoEntry: value));
  });
}
}

ApiOutpoint _$ApiOutpointFromJson(
  Map<String, dynamic> json
) {
    return _Outpoint.fromJson(
      json
    );
}

/// @nodoc
mixin _$ApiOutpoint {

 String get transactionId; int get index;
/// Create a copy of ApiOutpoint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiOutpointCopyWith<ApiOutpoint> get copyWith => _$ApiOutpointCopyWithImpl<ApiOutpoint>(this as ApiOutpoint, _$identity);

  /// Serializes this ApiOutpoint to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiOutpoint&&(identical(other.transactionId, transactionId) || other.transactionId == transactionId)&&(identical(other.index, index) || other.index == index));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,transactionId,index);

@override
String toString() {
  return 'ApiOutpoint(transactionId: $transactionId, index: $index)';
}


}

/// @nodoc
abstract mixin class $ApiOutpointCopyWith<$Res>  {
  factory $ApiOutpointCopyWith(ApiOutpoint value, $Res Function(ApiOutpoint) _then) = _$ApiOutpointCopyWithImpl;
@useResult
$Res call({
 String transactionId, int index
});




}
/// @nodoc
class _$ApiOutpointCopyWithImpl<$Res>
    implements $ApiOutpointCopyWith<$Res> {
  _$ApiOutpointCopyWithImpl(this._self, this._then);

  final ApiOutpoint _self;
  final $Res Function(ApiOutpoint) _then;

/// Create a copy of ApiOutpoint
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? transactionId = null,Object? index = null,}) {
  return _then(_self.copyWith(
transactionId: null == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as String,index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ApiOutpoint].
extension ApiOutpointPatterns on ApiOutpoint {
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

class _Outpoint implements ApiOutpoint {
  const _Outpoint({required this.transactionId, required this.index});
  factory _Outpoint.fromJson(Map<String, dynamic> json) => _$OutpointFromJson(json);

@override final  String transactionId;
@override final  int index;

/// Create a copy of ApiOutpoint
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
  return 'ApiOutpoint(transactionId: $transactionId, index: $index)';
}


}

/// @nodoc
abstract mixin class _$OutpointCopyWith<$Res> implements $ApiOutpointCopyWith<$Res> {
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

/// Create a copy of ApiOutpoint
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
mixin _$ApiUtxoEntry {

 BigInt get amount; ApiScriptPublicKey get scriptPublicKey; BigInt get blockDaaScore; bool get isCoinbase;
/// Create a copy of ApiUtxoEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiUtxoEntryCopyWith<ApiUtxoEntry> get copyWith => _$ApiUtxoEntryCopyWithImpl<ApiUtxoEntry>(this as ApiUtxoEntry, _$identity);

  /// Serializes this ApiUtxoEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiUtxoEntry&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.scriptPublicKey, scriptPublicKey) || other.scriptPublicKey == scriptPublicKey)&&(identical(other.blockDaaScore, blockDaaScore) || other.blockDaaScore == blockDaaScore)&&(identical(other.isCoinbase, isCoinbase) || other.isCoinbase == isCoinbase));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,amount,scriptPublicKey,blockDaaScore,isCoinbase);

@override
String toString() {
  return 'ApiUtxoEntry(amount: $amount, scriptPublicKey: $scriptPublicKey, blockDaaScore: $blockDaaScore, isCoinbase: $isCoinbase)';
}


}

/// @nodoc
abstract mixin class $ApiUtxoEntryCopyWith<$Res>  {
  factory $ApiUtxoEntryCopyWith(ApiUtxoEntry value, $Res Function(ApiUtxoEntry) _then) = _$ApiUtxoEntryCopyWithImpl;
@useResult
$Res call({
 BigInt amount, ApiScriptPublicKey scriptPublicKey, BigInt blockDaaScore, bool isCoinbase
});


$ApiScriptPublicKeyCopyWith<$Res> get scriptPublicKey;

}
/// @nodoc
class _$ApiUtxoEntryCopyWithImpl<$Res>
    implements $ApiUtxoEntryCopyWith<$Res> {
  _$ApiUtxoEntryCopyWithImpl(this._self, this._then);

  final ApiUtxoEntry _self;
  final $Res Function(ApiUtxoEntry) _then;

/// Create a copy of ApiUtxoEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? amount = null,Object? scriptPublicKey = null,Object? blockDaaScore = null,Object? isCoinbase = null,}) {
  return _then(_self.copyWith(
amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as BigInt,scriptPublicKey: null == scriptPublicKey ? _self.scriptPublicKey : scriptPublicKey // ignore: cast_nullable_to_non_nullable
as ApiScriptPublicKey,blockDaaScore: null == blockDaaScore ? _self.blockDaaScore : blockDaaScore // ignore: cast_nullable_to_non_nullable
as BigInt,isCoinbase: null == isCoinbase ? _self.isCoinbase : isCoinbase // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of ApiUtxoEntry
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApiScriptPublicKeyCopyWith<$Res> get scriptPublicKey {
  
  return $ApiScriptPublicKeyCopyWith<$Res>(_self.scriptPublicKey, (value) {
    return _then(_self.copyWith(scriptPublicKey: value));
  });
}
}


/// Adds pattern-matching-related methods to [ApiUtxoEntry].
extension ApiUtxoEntryPatterns on ApiUtxoEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApiUtxoEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApiUtxoEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApiUtxoEntry value)  $default,){
final _that = this;
switch (_that) {
case _ApiUtxoEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApiUtxoEntry value)?  $default,){
final _that = this;
switch (_that) {
case _ApiUtxoEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BigInt amount,  ApiScriptPublicKey scriptPublicKey,  BigInt blockDaaScore,  bool isCoinbase)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApiUtxoEntry() when $default != null:
return $default(_that.amount,_that.scriptPublicKey,_that.blockDaaScore,_that.isCoinbase);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BigInt amount,  ApiScriptPublicKey scriptPublicKey,  BigInt blockDaaScore,  bool isCoinbase)  $default,) {final _that = this;
switch (_that) {
case _ApiUtxoEntry():
return $default(_that.amount,_that.scriptPublicKey,_that.blockDaaScore,_that.isCoinbase);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BigInt amount,  ApiScriptPublicKey scriptPublicKey,  BigInt blockDaaScore,  bool isCoinbase)?  $default,) {final _that = this;
switch (_that) {
case _ApiUtxoEntry() when $default != null:
return $default(_that.amount,_that.scriptPublicKey,_that.blockDaaScore,_that.isCoinbase);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ApiUtxoEntry implements ApiUtxoEntry {
  const _ApiUtxoEntry({required this.amount, required this.scriptPublicKey, required this.blockDaaScore, this.isCoinbase = false});
  factory _ApiUtxoEntry.fromJson(Map<String, dynamic> json) => _$ApiUtxoEntryFromJson(json);

@override final  BigInt amount;
@override final  ApiScriptPublicKey scriptPublicKey;
@override final  BigInt blockDaaScore;
@override@JsonKey() final  bool isCoinbase;

/// Create a copy of ApiUtxoEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApiUtxoEntryCopyWith<_ApiUtxoEntry> get copyWith => __$ApiUtxoEntryCopyWithImpl<_ApiUtxoEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ApiUtxoEntryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApiUtxoEntry&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.scriptPublicKey, scriptPublicKey) || other.scriptPublicKey == scriptPublicKey)&&(identical(other.blockDaaScore, blockDaaScore) || other.blockDaaScore == blockDaaScore)&&(identical(other.isCoinbase, isCoinbase) || other.isCoinbase == isCoinbase));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,amount,scriptPublicKey,blockDaaScore,isCoinbase);

@override
String toString() {
  return 'ApiUtxoEntry(amount: $amount, scriptPublicKey: $scriptPublicKey, blockDaaScore: $blockDaaScore, isCoinbase: $isCoinbase)';
}


}

/// @nodoc
abstract mixin class _$ApiUtxoEntryCopyWith<$Res> implements $ApiUtxoEntryCopyWith<$Res> {
  factory _$ApiUtxoEntryCopyWith(_ApiUtxoEntry value, $Res Function(_ApiUtxoEntry) _then) = __$ApiUtxoEntryCopyWithImpl;
@override @useResult
$Res call({
 BigInt amount, ApiScriptPublicKey scriptPublicKey, BigInt blockDaaScore, bool isCoinbase
});


@override $ApiScriptPublicKeyCopyWith<$Res> get scriptPublicKey;

}
/// @nodoc
class __$ApiUtxoEntryCopyWithImpl<$Res>
    implements _$ApiUtxoEntryCopyWith<$Res> {
  __$ApiUtxoEntryCopyWithImpl(this._self, this._then);

  final _ApiUtxoEntry _self;
  final $Res Function(_ApiUtxoEntry) _then;

/// Create a copy of ApiUtxoEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? amount = null,Object? scriptPublicKey = null,Object? blockDaaScore = null,Object? isCoinbase = null,}) {
  return _then(_ApiUtxoEntry(
amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as BigInt,scriptPublicKey: null == scriptPublicKey ? _self.scriptPublicKey : scriptPublicKey // ignore: cast_nullable_to_non_nullable
as ApiScriptPublicKey,blockDaaScore: null == blockDaaScore ? _self.blockDaaScore : blockDaaScore // ignore: cast_nullable_to_non_nullable
as BigInt,isCoinbase: null == isCoinbase ? _self.isCoinbase : isCoinbase // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of ApiUtxoEntry
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApiScriptPublicKeyCopyWith<$Res> get scriptPublicKey {
  
  return $ApiScriptPublicKeyCopyWith<$Res>(_self.scriptPublicKey, (value) {
    return _then(_self.copyWith(scriptPublicKey: value));
  });
}
}


/// @nodoc
mixin _$ApiScriptPublicKey {

 String get scriptPublicKey; int get version;
/// Create a copy of ApiScriptPublicKey
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiScriptPublicKeyCopyWith<ApiScriptPublicKey> get copyWith => _$ApiScriptPublicKeyCopyWithImpl<ApiScriptPublicKey>(this as ApiScriptPublicKey, _$identity);

  /// Serializes this ApiScriptPublicKey to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiScriptPublicKey&&(identical(other.scriptPublicKey, scriptPublicKey) || other.scriptPublicKey == scriptPublicKey)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,scriptPublicKey,version);

@override
String toString() {
  return 'ApiScriptPublicKey(scriptPublicKey: $scriptPublicKey, version: $version)';
}


}

/// @nodoc
abstract mixin class $ApiScriptPublicKeyCopyWith<$Res>  {
  factory $ApiScriptPublicKeyCopyWith(ApiScriptPublicKey value, $Res Function(ApiScriptPublicKey) _then) = _$ApiScriptPublicKeyCopyWithImpl;
@useResult
$Res call({
 String scriptPublicKey, int version
});




}
/// @nodoc
class _$ApiScriptPublicKeyCopyWithImpl<$Res>
    implements $ApiScriptPublicKeyCopyWith<$Res> {
  _$ApiScriptPublicKeyCopyWithImpl(this._self, this._then);

  final ApiScriptPublicKey _self;
  final $Res Function(ApiScriptPublicKey) _then;

/// Create a copy of ApiScriptPublicKey
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? scriptPublicKey = null,Object? version = null,}) {
  return _then(_self.copyWith(
scriptPublicKey: null == scriptPublicKey ? _self.scriptPublicKey : scriptPublicKey // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ApiScriptPublicKey].
extension ApiScriptPublicKeyPatterns on ApiScriptPublicKey {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApiScriptPublicKey value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApiScriptPublicKey() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApiScriptPublicKey value)  $default,){
final _that = this;
switch (_that) {
case _ApiScriptPublicKey():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApiScriptPublicKey value)?  $default,){
final _that = this;
switch (_that) {
case _ApiScriptPublicKey() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String scriptPublicKey,  int version)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApiScriptPublicKey() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String scriptPublicKey,  int version)  $default,) {final _that = this;
switch (_that) {
case _ApiScriptPublicKey():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String scriptPublicKey,  int version)?  $default,) {final _that = this;
switch (_that) {
case _ApiScriptPublicKey() when $default != null:
return $default(_that.scriptPublicKey,_that.version);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ApiScriptPublicKey implements ApiScriptPublicKey {
  const _ApiScriptPublicKey({required this.scriptPublicKey, this.version = 0});
  factory _ApiScriptPublicKey.fromJson(Map<String, dynamic> json) => _$ApiScriptPublicKeyFromJson(json);

@override final  String scriptPublicKey;
@override@JsonKey() final  int version;

/// Create a copy of ApiScriptPublicKey
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApiScriptPublicKeyCopyWith<_ApiScriptPublicKey> get copyWith => __$ApiScriptPublicKeyCopyWithImpl<_ApiScriptPublicKey>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ApiScriptPublicKeyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApiScriptPublicKey&&(identical(other.scriptPublicKey, scriptPublicKey) || other.scriptPublicKey == scriptPublicKey)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,scriptPublicKey,version);

@override
String toString() {
  return 'ApiScriptPublicKey(scriptPublicKey: $scriptPublicKey, version: $version)';
}


}

/// @nodoc
abstract mixin class _$ApiScriptPublicKeyCopyWith<$Res> implements $ApiScriptPublicKeyCopyWith<$Res> {
  factory _$ApiScriptPublicKeyCopyWith(_ApiScriptPublicKey value, $Res Function(_ApiScriptPublicKey) _then) = __$ApiScriptPublicKeyCopyWithImpl;
@override @useResult
$Res call({
 String scriptPublicKey, int version
});




}
/// @nodoc
class __$ApiScriptPublicKeyCopyWithImpl<$Res>
    implements _$ApiScriptPublicKeyCopyWith<$Res> {
  __$ApiScriptPublicKeyCopyWithImpl(this._self, this._then);

  final _ApiScriptPublicKey _self;
  final $Res Function(_ApiScriptPublicKey) _then;

/// Create a copy of ApiScriptPublicKey
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? scriptPublicKey = null,Object? version = null,}) {
  return _then(_ApiScriptPublicKey(
scriptPublicKey: null == scriptPublicKey ? _self.scriptPublicKey : scriptPublicKey // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ApiTxLink {

 String? get txReceived; String? get txSpent;
/// Create a copy of ApiTxLink
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiTxLinkCopyWith<ApiTxLink> get copyWith => _$ApiTxLinkCopyWithImpl<ApiTxLink>(this as ApiTxLink, _$identity);

  /// Serializes this ApiTxLink to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiTxLink&&(identical(other.txReceived, txReceived) || other.txReceived == txReceived)&&(identical(other.txSpent, txSpent) || other.txSpent == txSpent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,txReceived,txSpent);

@override
String toString() {
  return 'ApiTxLink(txReceived: $txReceived, txSpent: $txSpent)';
}


}

/// @nodoc
abstract mixin class $ApiTxLinkCopyWith<$Res>  {
  factory $ApiTxLinkCopyWith(ApiTxLink value, $Res Function(ApiTxLink) _then) = _$ApiTxLinkCopyWithImpl;
@useResult
$Res call({
 String? txReceived, String? txSpent
});




}
/// @nodoc
class _$ApiTxLinkCopyWithImpl<$Res>
    implements $ApiTxLinkCopyWith<$Res> {
  _$ApiTxLinkCopyWithImpl(this._self, this._then);

  final ApiTxLink _self;
  final $Res Function(ApiTxLink) _then;

/// Create a copy of ApiTxLink
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? txReceived = freezed,Object? txSpent = freezed,}) {
  return _then(_self.copyWith(
txReceived: freezed == txReceived ? _self.txReceived : txReceived // ignore: cast_nullable_to_non_nullable
as String?,txSpent: freezed == txSpent ? _self.txSpent : txSpent // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ApiTxLink].
extension ApiTxLinkPatterns on ApiTxLink {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApiTxLink value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApiTxLink() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApiTxLink value)  $default,){
final _that = this;
switch (_that) {
case _ApiTxLink():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApiTxLink value)?  $default,){
final _that = this;
switch (_that) {
case _ApiTxLink() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? txReceived,  String? txSpent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApiTxLink() when $default != null:
return $default(_that.txReceived,_that.txSpent);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? txReceived,  String? txSpent)  $default,) {final _that = this;
switch (_that) {
case _ApiTxLink():
return $default(_that.txReceived,_that.txSpent);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? txReceived,  String? txSpent)?  $default,) {final _that = this;
switch (_that) {
case _ApiTxLink() when $default != null:
return $default(_that.txReceived,_that.txSpent);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _ApiTxLink implements ApiTxLink {
  const _ApiTxLink({this.txReceived, this.txSpent});
  factory _ApiTxLink.fromJson(Map<String, dynamic> json) => _$ApiTxLinkFromJson(json);

@override final  String? txReceived;
@override final  String? txSpent;

/// Create a copy of ApiTxLink
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApiTxLinkCopyWith<_ApiTxLink> get copyWith => __$ApiTxLinkCopyWithImpl<_ApiTxLink>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ApiTxLinkToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApiTxLink&&(identical(other.txReceived, txReceived) || other.txReceived == txReceived)&&(identical(other.txSpent, txSpent) || other.txSpent == txSpent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,txReceived,txSpent);

@override
String toString() {
  return 'ApiTxLink(txReceived: $txReceived, txSpent: $txSpent)';
}


}

/// @nodoc
abstract mixin class _$ApiTxLinkCopyWith<$Res> implements $ApiTxLinkCopyWith<$Res> {
  factory _$ApiTxLinkCopyWith(_ApiTxLink value, $Res Function(_ApiTxLink) _then) = __$ApiTxLinkCopyWithImpl;
@override @useResult
$Res call({
 String? txReceived, String? txSpent
});




}
/// @nodoc
class __$ApiTxLinkCopyWithImpl<$Res>
    implements _$ApiTxLinkCopyWith<$Res> {
  __$ApiTxLinkCopyWithImpl(this._self, this._then);

  final _ApiTxLink _self;
  final $Res Function(_ApiTxLink) _then;

/// Create a copy of ApiTxLink
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? txReceived = freezed,Object? txSpent = freezed,}) {
  return _then(_ApiTxLink(
txReceived: freezed == txReceived ? _self.txReceived : txReceived // ignore: cast_nullable_to_non_nullable
as String?,txSpent: freezed == txSpent ? _self.txSpent : txSpent // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ApiTxId {

 String get transactionId; int? get blockTime;
/// Create a copy of ApiTxId
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiTxIdCopyWith<ApiTxId> get copyWith => _$ApiTxIdCopyWithImpl<ApiTxId>(this as ApiTxId, _$identity);

  /// Serializes this ApiTxId to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiTxId&&(identical(other.transactionId, transactionId) || other.transactionId == transactionId)&&(identical(other.blockTime, blockTime) || other.blockTime == blockTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,transactionId,blockTime);

@override
String toString() {
  return 'ApiTxId(transactionId: $transactionId, blockTime: $blockTime)';
}


}

/// @nodoc
abstract mixin class $ApiTxIdCopyWith<$Res>  {
  factory $ApiTxIdCopyWith(ApiTxId value, $Res Function(ApiTxId) _then) = _$ApiTxIdCopyWithImpl;
@useResult
$Res call({
 String transactionId, int? blockTime
});




}
/// @nodoc
class _$ApiTxIdCopyWithImpl<$Res>
    implements $ApiTxIdCopyWith<$Res> {
  _$ApiTxIdCopyWithImpl(this._self, this._then);

  final ApiTxId _self;
  final $Res Function(ApiTxId) _then;

/// Create a copy of ApiTxId
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? transactionId = null,Object? blockTime = freezed,}) {
  return _then(_self.copyWith(
transactionId: null == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as String,blockTime: freezed == blockTime ? _self.blockTime : blockTime // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ApiTxId].
extension ApiTxIdPatterns on ApiTxId {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApiTxId value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApiTxId() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApiTxId value)  $default,){
final _that = this;
switch (_that) {
case _ApiTxId():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApiTxId value)?  $default,){
final _that = this;
switch (_that) {
case _ApiTxId() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String transactionId,  int? blockTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApiTxId() when $default != null:
return $default(_that.transactionId,_that.blockTime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String transactionId,  int? blockTime)  $default,) {final _that = this;
switch (_that) {
case _ApiTxId():
return $default(_that.transactionId,_that.blockTime);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String transactionId,  int? blockTime)?  $default,) {final _that = this;
switch (_that) {
case _ApiTxId() when $default != null:
return $default(_that.transactionId,_that.blockTime);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _ApiTxId implements ApiTxId {
  const _ApiTxId({required this.transactionId, this.blockTime});
  factory _ApiTxId.fromJson(Map<String, dynamic> json) => _$ApiTxIdFromJson(json);

@override final  String transactionId;
@override final  int? blockTime;

/// Create a copy of ApiTxId
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApiTxIdCopyWith<_ApiTxId> get copyWith => __$ApiTxIdCopyWithImpl<_ApiTxId>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ApiTxIdToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApiTxId&&(identical(other.transactionId, transactionId) || other.transactionId == transactionId)&&(identical(other.blockTime, blockTime) || other.blockTime == blockTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,transactionId,blockTime);

@override
String toString() {
  return 'ApiTxId(transactionId: $transactionId, blockTime: $blockTime)';
}


}

/// @nodoc
abstract mixin class _$ApiTxIdCopyWith<$Res> implements $ApiTxIdCopyWith<$Res> {
  factory _$ApiTxIdCopyWith(_ApiTxId value, $Res Function(_ApiTxId) _then) = __$ApiTxIdCopyWithImpl;
@override @useResult
$Res call({
 String transactionId, int? blockTime
});




}
/// @nodoc
class __$ApiTxIdCopyWithImpl<$Res>
    implements _$ApiTxIdCopyWith<$Res> {
  __$ApiTxIdCopyWithImpl(this._self, this._then);

  final _ApiTxId _self;
  final $Res Function(_ApiTxId) _then;

/// Create a copy of ApiTxId
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? transactionId = null,Object? blockTime = freezed,}) {
  return _then(_ApiTxId(
transactionId: null == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as String,blockTime: freezed == blockTime ? _self.blockTime : blockTime // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
