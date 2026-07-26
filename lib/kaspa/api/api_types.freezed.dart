// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_types.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ApiActiveAddress {

 String get address; bool get active;// Block time of the address' newest transaction, null when never active
 int? get lastTxBlockTime;
/// Create a copy of ApiActiveAddress
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiActiveAddressCopyWith<ApiActiveAddress> get copyWith => _$ApiActiveAddressCopyWithImpl<ApiActiveAddress>(this as ApiActiveAddress, _$identity);

  /// Serializes this ApiActiveAddress to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiActiveAddress&&(identical(other.address, address) || other.address == address)&&(identical(other.active, active) || other.active == active)&&(identical(other.lastTxBlockTime, lastTxBlockTime) || other.lastTxBlockTime == lastTxBlockTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,address,active,lastTxBlockTime);

@override
String toString() {
  return 'ApiActiveAddress(address: $address, active: $active, lastTxBlockTime: $lastTxBlockTime)';
}


}

/// @nodoc
abstract mixin class $ApiActiveAddressCopyWith<$Res>  {
  factory $ApiActiveAddressCopyWith(ApiActiveAddress value, $Res Function(ApiActiveAddress) _then) = _$ApiActiveAddressCopyWithImpl;
@useResult
$Res call({
 String address, bool active, int? lastTxBlockTime
});




}
/// @nodoc
class _$ApiActiveAddressCopyWithImpl<$Res>
    implements $ApiActiveAddressCopyWith<$Res> {
  _$ApiActiveAddressCopyWithImpl(this._self, this._then);

  final ApiActiveAddress _self;
  final $Res Function(ApiActiveAddress) _then;

/// Create a copy of ApiActiveAddress
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? address = null,Object? active = null,Object? lastTxBlockTime = freezed,}) {
  return _then(_self.copyWith(
address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,lastTxBlockTime: freezed == lastTxBlockTime ? _self.lastTxBlockTime : lastTxBlockTime // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ApiActiveAddress].
extension ApiActiveAddressPatterns on ApiActiveAddress {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApiActiveAddress value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApiActiveAddress() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApiActiveAddress value)  $default,){
final _that = this;
switch (_that) {
case _ApiActiveAddress():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApiActiveAddress value)?  $default,){
final _that = this;
switch (_that) {
case _ApiActiveAddress() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String address,  bool active,  int? lastTxBlockTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApiActiveAddress() when $default != null:
return $default(_that.address,_that.active,_that.lastTxBlockTime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String address,  bool active,  int? lastTxBlockTime)  $default,) {final _that = this;
switch (_that) {
case _ApiActiveAddress():
return $default(_that.address,_that.active,_that.lastTxBlockTime);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String address,  bool active,  int? lastTxBlockTime)?  $default,) {final _that = this;
switch (_that) {
case _ApiActiveAddress() when $default != null:
return $default(_that.address,_that.active,_that.lastTxBlockTime);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ApiActiveAddress implements ApiActiveAddress {
  const _ApiActiveAddress({required this.address, required this.active, this.lastTxBlockTime});
  factory _ApiActiveAddress.fromJson(Map<String, dynamic> json) => _$ApiActiveAddressFromJson(json);

@override final  String address;
@override final  bool active;
// Block time of the address' newest transaction, null when never active
@override final  int? lastTxBlockTime;

/// Create a copy of ApiActiveAddress
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApiActiveAddressCopyWith<_ApiActiveAddress> get copyWith => __$ApiActiveAddressCopyWithImpl<_ApiActiveAddress>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ApiActiveAddressToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApiActiveAddress&&(identical(other.address, address) || other.address == address)&&(identical(other.active, active) || other.active == active)&&(identical(other.lastTxBlockTime, lastTxBlockTime) || other.lastTxBlockTime == lastTxBlockTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,address,active,lastTxBlockTime);

@override
String toString() {
  return 'ApiActiveAddress(address: $address, active: $active, lastTxBlockTime: $lastTxBlockTime)';
}


}

/// @nodoc
abstract mixin class _$ApiActiveAddressCopyWith<$Res> implements $ApiActiveAddressCopyWith<$Res> {
  factory _$ApiActiveAddressCopyWith(_ApiActiveAddress value, $Res Function(_ApiActiveAddress) _then) = __$ApiActiveAddressCopyWithImpl;
@override @useResult
$Res call({
 String address, bool active, int? lastTxBlockTime
});




}
/// @nodoc
class __$ApiActiveAddressCopyWithImpl<$Res>
    implements _$ApiActiveAddressCopyWith<$Res> {
  __$ApiActiveAddressCopyWithImpl(this._self, this._then);

  final _ApiActiveAddress _self;
  final $Res Function(_ApiActiveAddress) _then;

/// Create a copy of ApiActiveAddress
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? address = null,Object? active = null,Object? lastTxBlockTime = freezed,}) {
  return _then(_ApiActiveAddress(
address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,lastTxBlockTime: freezed == lastTxBlockTime ? _self.lastTxBlockTime : lastTxBlockTime // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$ApiTxId {

 String get transactionId;// The id projection asks for this by name. Required rather than defaulted
// because a zero here would be written to the index and never revisited,
// stranding a real transaction at the bottom of the history; failing the
// parse instead leaves the address to be retried by the next sync.
 int get blockTime;
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
 String transactionId, int blockTime
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
@pragma('vm:prefer-inline') @override $Res call({Object? transactionId = null,Object? blockTime = null,}) {
  return _then(_self.copyWith(
transactionId: null == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as String,blockTime: null == blockTime ? _self.blockTime : blockTime // ignore: cast_nullable_to_non_nullable
as int,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String transactionId,  int blockTime)?  $default,{required TResult orElse(),}) {final _that = this;
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String transactionId,  int blockTime)  $default,) {final _that = this;
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String transactionId,  int blockTime)?  $default,) {final _that = this;
switch (_that) {
case _ApiTxId() when $default != null:
return $default(_that.transactionId,_that.blockTime);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: .snake)
class _ApiTxId implements ApiTxId {
  const _ApiTxId({required this.transactionId, required this.blockTime});
  factory _ApiTxId.fromJson(Map<String, dynamic> json) => _$ApiTxIdFromJson(json);

@override final  String transactionId;
// The id projection asks for this by name. Required rather than defaulted
// because a zero here would be written to the index and never revisited,
// stranding a real transaction at the bottom of the history; failing the
// parse instead leaves the address to be retried by the next sync.
@override final  int blockTime;

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
 String transactionId, int blockTime
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
@override @pragma('vm:prefer-inline') $Res call({Object? transactionId = null,Object? blockTime = null,}) {
  return _then(_ApiTxId(
transactionId: null == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as String,blockTime: null == blockTime ? _self.blockTime : blockTime // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
