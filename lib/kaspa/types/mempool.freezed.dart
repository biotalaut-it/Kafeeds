// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mempool.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MempoolEntry {

 int get fee; Transaction get transaction; bool get isOrphan;
/// Create a copy of MempoolEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MempoolEntryCopyWith<MempoolEntry> get copyWith => _$MempoolEntryCopyWithImpl<MempoolEntry>(this as MempoolEntry, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MempoolEntry&&(identical(other.fee, fee) || other.fee == fee)&&(identical(other.transaction, transaction) || other.transaction == transaction)&&(identical(other.isOrphan, isOrphan) || other.isOrphan == isOrphan));
}


@override
int get hashCode => Object.hash(runtimeType,fee,transaction,isOrphan);

@override
String toString() {
  return 'MempoolEntry(fee: $fee, transaction: $transaction, isOrphan: $isOrphan)';
}


}

/// @nodoc
abstract mixin class $MempoolEntryCopyWith<$Res>  {
  factory $MempoolEntryCopyWith(MempoolEntry value, $Res Function(MempoolEntry) _then) = _$MempoolEntryCopyWithImpl;
@useResult
$Res call({
 int fee, Transaction transaction, bool isOrphan
});


$TransactionCopyWith<$Res> get transaction;

}
/// @nodoc
class _$MempoolEntryCopyWithImpl<$Res>
    implements $MempoolEntryCopyWith<$Res> {
  _$MempoolEntryCopyWithImpl(this._self, this._then);

  final MempoolEntry _self;
  final $Res Function(MempoolEntry) _then;

/// Create a copy of MempoolEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fee = null,Object? transaction = null,Object? isOrphan = null,}) {
  return _then(_self.copyWith(
fee: null == fee ? _self.fee : fee // ignore: cast_nullable_to_non_nullable
as int,transaction: null == transaction ? _self.transaction : transaction // ignore: cast_nullable_to_non_nullable
as Transaction,isOrphan: null == isOrphan ? _self.isOrphan : isOrphan // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of MempoolEntry
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TransactionCopyWith<$Res> get transaction {
  
  return $TransactionCopyWith<$Res>(_self.transaction, (value) {
    return _then(_self.copyWith(transaction: value));
  });
}
}


/// Adds pattern-matching-related methods to [MempoolEntry].
extension MempoolEntryPatterns on MempoolEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MempoolEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MempoolEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MempoolEntry value)  $default,){
final _that = this;
switch (_that) {
case _MempoolEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MempoolEntry value)?  $default,){
final _that = this;
switch (_that) {
case _MempoolEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int fee,  Transaction transaction,  bool isOrphan)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MempoolEntry() when $default != null:
return $default(_that.fee,_that.transaction,_that.isOrphan);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int fee,  Transaction transaction,  bool isOrphan)  $default,) {final _that = this;
switch (_that) {
case _MempoolEntry():
return $default(_that.fee,_that.transaction,_that.isOrphan);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int fee,  Transaction transaction,  bool isOrphan)?  $default,) {final _that = this;
switch (_that) {
case _MempoolEntry() when $default != null:
return $default(_that.fee,_that.transaction,_that.isOrphan);case _:
  return null;

}
}

}

/// @nodoc


class _MempoolEntry extends MempoolEntry {
  const _MempoolEntry({required this.fee, required this.transaction, required this.isOrphan}): super._();
  

@override final  int fee;
@override final  Transaction transaction;
@override final  bool isOrphan;

/// Create a copy of MempoolEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MempoolEntryCopyWith<_MempoolEntry> get copyWith => __$MempoolEntryCopyWithImpl<_MempoolEntry>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MempoolEntry&&(identical(other.fee, fee) || other.fee == fee)&&(identical(other.transaction, transaction) || other.transaction == transaction)&&(identical(other.isOrphan, isOrphan) || other.isOrphan == isOrphan));
}


@override
int get hashCode => Object.hash(runtimeType,fee,transaction,isOrphan);

@override
String toString() {
  return 'MempoolEntry(fee: $fee, transaction: $transaction, isOrphan: $isOrphan)';
}


}

/// @nodoc
abstract mixin class _$MempoolEntryCopyWith<$Res> implements $MempoolEntryCopyWith<$Res> {
  factory _$MempoolEntryCopyWith(_MempoolEntry value, $Res Function(_MempoolEntry) _then) = __$MempoolEntryCopyWithImpl;
@override @useResult
$Res call({
 int fee, Transaction transaction, bool isOrphan
});


@override $TransactionCopyWith<$Res> get transaction;

}
/// @nodoc
class __$MempoolEntryCopyWithImpl<$Res>
    implements _$MempoolEntryCopyWith<$Res> {
  __$MempoolEntryCopyWithImpl(this._self, this._then);

  final _MempoolEntry _self;
  final $Res Function(_MempoolEntry) _then;

/// Create a copy of MempoolEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fee = null,Object? transaction = null,Object? isOrphan = null,}) {
  return _then(_MempoolEntry(
fee: null == fee ? _self.fee : fee // ignore: cast_nullable_to_non_nullable
as int,transaction: null == transaction ? _self.transaction : transaction // ignore: cast_nullable_to_non_nullable
as Transaction,isOrphan: null == isOrphan ? _self.isOrphan : isOrphan // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of MempoolEntry
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TransactionCopyWith<$Res> get transaction {
  
  return $TransactionCopyWith<$Res>(_self.transaction, (value) {
    return _then(_self.copyWith(transaction: value));
  });
}
}

/// @nodoc
mixin _$MempoolEntryByAddress {

 String get address; Iterable<MempoolEntry> get sending; Iterable<MempoolEntry> get receiving;
/// Create a copy of MempoolEntryByAddress
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MempoolEntryByAddressCopyWith<MempoolEntryByAddress> get copyWith => _$MempoolEntryByAddressCopyWithImpl<MempoolEntryByAddress>(this as MempoolEntryByAddress, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MempoolEntryByAddress&&(identical(other.address, address) || other.address == address)&&const DeepCollectionEquality().equals(other.sending, sending)&&const DeepCollectionEquality().equals(other.receiving, receiving));
}


@override
int get hashCode => Object.hash(runtimeType,address,const DeepCollectionEquality().hash(sending),const DeepCollectionEquality().hash(receiving));

@override
String toString() {
  return 'MempoolEntryByAddress(address: $address, sending: $sending, receiving: $receiving)';
}


}

/// @nodoc
abstract mixin class $MempoolEntryByAddressCopyWith<$Res>  {
  factory $MempoolEntryByAddressCopyWith(MempoolEntryByAddress value, $Res Function(MempoolEntryByAddress) _then) = _$MempoolEntryByAddressCopyWithImpl;
@useResult
$Res call({
 String address, Iterable<MempoolEntry> sending, Iterable<MempoolEntry> receiving
});




}
/// @nodoc
class _$MempoolEntryByAddressCopyWithImpl<$Res>
    implements $MempoolEntryByAddressCopyWith<$Res> {
  _$MempoolEntryByAddressCopyWithImpl(this._self, this._then);

  final MempoolEntryByAddress _self;
  final $Res Function(MempoolEntryByAddress) _then;

/// Create a copy of MempoolEntryByAddress
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? address = null,Object? sending = null,Object? receiving = null,}) {
  return _then(_self.copyWith(
address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,sending: null == sending ? _self.sending : sending // ignore: cast_nullable_to_non_nullable
as Iterable<MempoolEntry>,receiving: null == receiving ? _self.receiving : receiving // ignore: cast_nullable_to_non_nullable
as Iterable<MempoolEntry>,
  ));
}

}


/// Adds pattern-matching-related methods to [MempoolEntryByAddress].
extension MempoolEntryByAddressPatterns on MempoolEntryByAddress {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MempoolEntryByAddress value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MempoolEntryByAddress() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MempoolEntryByAddress value)  $default,){
final _that = this;
switch (_that) {
case _MempoolEntryByAddress():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MempoolEntryByAddress value)?  $default,){
final _that = this;
switch (_that) {
case _MempoolEntryByAddress() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String address,  Iterable<MempoolEntry> sending,  Iterable<MempoolEntry> receiving)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MempoolEntryByAddress() when $default != null:
return $default(_that.address,_that.sending,_that.receiving);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String address,  Iterable<MempoolEntry> sending,  Iterable<MempoolEntry> receiving)  $default,) {final _that = this;
switch (_that) {
case _MempoolEntryByAddress():
return $default(_that.address,_that.sending,_that.receiving);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String address,  Iterable<MempoolEntry> sending,  Iterable<MempoolEntry> receiving)?  $default,) {final _that = this;
switch (_that) {
case _MempoolEntryByAddress() when $default != null:
return $default(_that.address,_that.sending,_that.receiving);case _:
  return null;

}
}

}

/// @nodoc


class _MempoolEntryByAddress extends MempoolEntryByAddress {
  const _MempoolEntryByAddress({required this.address, this.sending = const [], this.receiving = const []}): super._();
  

@override final  String address;
@override@JsonKey() final  Iterable<MempoolEntry> sending;
@override@JsonKey() final  Iterable<MempoolEntry> receiving;

/// Create a copy of MempoolEntryByAddress
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MempoolEntryByAddressCopyWith<_MempoolEntryByAddress> get copyWith => __$MempoolEntryByAddressCopyWithImpl<_MempoolEntryByAddress>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MempoolEntryByAddress&&(identical(other.address, address) || other.address == address)&&const DeepCollectionEquality().equals(other.sending, sending)&&const DeepCollectionEquality().equals(other.receiving, receiving));
}


@override
int get hashCode => Object.hash(runtimeType,address,const DeepCollectionEquality().hash(sending),const DeepCollectionEquality().hash(receiving));

@override
String toString() {
  return 'MempoolEntryByAddress(address: $address, sending: $sending, receiving: $receiving)';
}


}

/// @nodoc
abstract mixin class _$MempoolEntryByAddressCopyWith<$Res> implements $MempoolEntryByAddressCopyWith<$Res> {
  factory _$MempoolEntryByAddressCopyWith(_MempoolEntryByAddress value, $Res Function(_MempoolEntryByAddress) _then) = __$MempoolEntryByAddressCopyWithImpl;
@override @useResult
$Res call({
 String address, Iterable<MempoolEntry> sending, Iterable<MempoolEntry> receiving
});




}
/// @nodoc
class __$MempoolEntryByAddressCopyWithImpl<$Res>
    implements _$MempoolEntryByAddressCopyWith<$Res> {
  __$MempoolEntryByAddressCopyWithImpl(this._self, this._then);

  final _MempoolEntryByAddress _self;
  final $Res Function(_MempoolEntryByAddress) _then;

/// Create a copy of MempoolEntryByAddress
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? address = null,Object? sending = null,Object? receiving = null,}) {
  return _then(_MempoolEntryByAddress(
address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,sending: null == sending ? _self.sending : sending // ignore: cast_nullable_to_non_nullable
as Iterable<MempoolEntry>,receiving: null == receiving ? _self.receiving : receiving // ignore: cast_nullable_to_non_nullable
as Iterable<MempoolEntry>,
  ));
}


}

// dart format on
