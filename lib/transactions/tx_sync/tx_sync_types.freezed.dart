// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tx_sync_types.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TxSyncProgress {

 int get completed; int get total;
/// Create a copy of TxSyncProgress
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TxSyncProgressCopyWith<TxSyncProgress> get copyWith => _$TxSyncProgressCopyWithImpl<TxSyncProgress>(this as TxSyncProgress, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TxSyncProgress&&(identical(other.completed, completed) || other.completed == completed)&&(identical(other.total, total) || other.total == total));
}


@override
int get hashCode => Object.hash(runtimeType,completed,total);

@override
String toString() {
  return 'TxSyncProgress(completed: $completed, total: $total)';
}


}

/// @nodoc
abstract mixin class $TxSyncProgressCopyWith<$Res>  {
  factory $TxSyncProgressCopyWith(TxSyncProgress value, $Res Function(TxSyncProgress) _then) = _$TxSyncProgressCopyWithImpl;
@useResult
$Res call({
 int completed, int total
});




}
/// @nodoc
class _$TxSyncProgressCopyWithImpl<$Res>
    implements $TxSyncProgressCopyWith<$Res> {
  _$TxSyncProgressCopyWithImpl(this._self, this._then);

  final TxSyncProgress _self;
  final $Res Function(TxSyncProgress) _then;

/// Create a copy of TxSyncProgress
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? completed = null,Object? total = null,}) {
  return _then(_self.copyWith(
completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TxSyncProgress].
extension TxSyncProgressPatterns on TxSyncProgress {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TxSyncProgress value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TxSyncProgress() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TxSyncProgress value)  $default,){
final _that = this;
switch (_that) {
case _TxSyncProgress():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TxSyncProgress value)?  $default,){
final _that = this;
switch (_that) {
case _TxSyncProgress() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int completed,  int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TxSyncProgress() when $default != null:
return $default(_that.completed,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int completed,  int total)  $default,) {final _that = this;
switch (_that) {
case _TxSyncProgress():
return $default(_that.completed,_that.total);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int completed,  int total)?  $default,) {final _that = this;
switch (_that) {
case _TxSyncProgress() when $default != null:
return $default(_that.completed,_that.total);case _:
  return null;

}
}

}

/// @nodoc


class _TxSyncProgress extends TxSyncProgress {
  const _TxSyncProgress({this.completed = 0, this.total = 0}): super._();
  

@override@JsonKey() final  int completed;
@override@JsonKey() final  int total;

/// Create a copy of TxSyncProgress
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TxSyncProgressCopyWith<_TxSyncProgress> get copyWith => __$TxSyncProgressCopyWithImpl<_TxSyncProgress>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TxSyncProgress&&(identical(other.completed, completed) || other.completed == completed)&&(identical(other.total, total) || other.total == total));
}


@override
int get hashCode => Object.hash(runtimeType,completed,total);

@override
String toString() {
  return 'TxSyncProgress(completed: $completed, total: $total)';
}


}

/// @nodoc
abstract mixin class _$TxSyncProgressCopyWith<$Res> implements $TxSyncProgressCopyWith<$Res> {
  factory _$TxSyncProgressCopyWith(_TxSyncProgress value, $Res Function(_TxSyncProgress) _then) = __$TxSyncProgressCopyWithImpl;
@override @useResult
$Res call({
 int completed, int total
});




}
/// @nodoc
class __$TxSyncProgressCopyWithImpl<$Res>
    implements _$TxSyncProgressCopyWith<$Res> {
  __$TxSyncProgressCopyWithImpl(this._self, this._then);

  final _TxSyncProgress _self;
  final $Res Function(_TxSyncProgress) _then;

/// Create a copy of TxSyncProgress
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? completed = null,Object? total = null,}) {
  return _then(_TxSyncProgress(
completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$AddressTxSync {

 String get address; int get newestBlockTime; int get oldestBlockTime; bool get backfilled; int get lastSyncMs;
/// Create a copy of AddressTxSync
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddressTxSyncCopyWith<AddressTxSync> get copyWith => _$AddressTxSyncCopyWithImpl<AddressTxSync>(this as AddressTxSync, _$identity);

  /// Serializes this AddressTxSync to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddressTxSync&&(identical(other.address, address) || other.address == address)&&(identical(other.newestBlockTime, newestBlockTime) || other.newestBlockTime == newestBlockTime)&&(identical(other.oldestBlockTime, oldestBlockTime) || other.oldestBlockTime == oldestBlockTime)&&(identical(other.backfilled, backfilled) || other.backfilled == backfilled)&&(identical(other.lastSyncMs, lastSyncMs) || other.lastSyncMs == lastSyncMs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,address,newestBlockTime,oldestBlockTime,backfilled,lastSyncMs);

@override
String toString() {
  return 'AddressTxSync(address: $address, newestBlockTime: $newestBlockTime, oldestBlockTime: $oldestBlockTime, backfilled: $backfilled, lastSyncMs: $lastSyncMs)';
}


}

/// @nodoc
abstract mixin class $AddressTxSyncCopyWith<$Res>  {
  factory $AddressTxSyncCopyWith(AddressTxSync value, $Res Function(AddressTxSync) _then) = _$AddressTxSyncCopyWithImpl;
@useResult
$Res call({
 String address, int newestBlockTime, int oldestBlockTime, bool backfilled, int lastSyncMs
});




}
/// @nodoc
class _$AddressTxSyncCopyWithImpl<$Res>
    implements $AddressTxSyncCopyWith<$Res> {
  _$AddressTxSyncCopyWithImpl(this._self, this._then);

  final AddressTxSync _self;
  final $Res Function(AddressTxSync) _then;

/// Create a copy of AddressTxSync
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? address = null,Object? newestBlockTime = null,Object? oldestBlockTime = null,Object? backfilled = null,Object? lastSyncMs = null,}) {
  return _then(_self.copyWith(
address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,newestBlockTime: null == newestBlockTime ? _self.newestBlockTime : newestBlockTime // ignore: cast_nullable_to_non_nullable
as int,oldestBlockTime: null == oldestBlockTime ? _self.oldestBlockTime : oldestBlockTime // ignore: cast_nullable_to_non_nullable
as int,backfilled: null == backfilled ? _self.backfilled : backfilled // ignore: cast_nullable_to_non_nullable
as bool,lastSyncMs: null == lastSyncMs ? _self.lastSyncMs : lastSyncMs // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [AddressTxSync].
extension AddressTxSyncPatterns on AddressTxSync {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddressTxSync value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddressTxSync() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddressTxSync value)  $default,){
final _that = this;
switch (_that) {
case _AddressTxSync():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddressTxSync value)?  $default,){
final _that = this;
switch (_that) {
case _AddressTxSync() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String address,  int newestBlockTime,  int oldestBlockTime,  bool backfilled,  int lastSyncMs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddressTxSync() when $default != null:
return $default(_that.address,_that.newestBlockTime,_that.oldestBlockTime,_that.backfilled,_that.lastSyncMs);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String address,  int newestBlockTime,  int oldestBlockTime,  bool backfilled,  int lastSyncMs)  $default,) {final _that = this;
switch (_that) {
case _AddressTxSync():
return $default(_that.address,_that.newestBlockTime,_that.oldestBlockTime,_that.backfilled,_that.lastSyncMs);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String address,  int newestBlockTime,  int oldestBlockTime,  bool backfilled,  int lastSyncMs)?  $default,) {final _that = this;
switch (_that) {
case _AddressTxSync() when $default != null:
return $default(_that.address,_that.newestBlockTime,_that.oldestBlockTime,_that.backfilled,_that.lastSyncMs);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AddressTxSync extends AddressTxSync {
  const _AddressTxSync({required this.address, this.newestBlockTime = 0, this.oldestBlockTime = 0, this.backfilled = false, this.lastSyncMs = 0}): super._();
  factory _AddressTxSync.fromJson(Map<String, dynamic> json) => _$AddressTxSyncFromJson(json);

@override final  String address;
@override@JsonKey() final  int newestBlockTime;
@override@JsonKey() final  int oldestBlockTime;
@override@JsonKey() final  bool backfilled;
@override@JsonKey() final  int lastSyncMs;

/// Create a copy of AddressTxSync
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddressTxSyncCopyWith<_AddressTxSync> get copyWith => __$AddressTxSyncCopyWithImpl<_AddressTxSync>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AddressTxSyncToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddressTxSync&&(identical(other.address, address) || other.address == address)&&(identical(other.newestBlockTime, newestBlockTime) || other.newestBlockTime == newestBlockTime)&&(identical(other.oldestBlockTime, oldestBlockTime) || other.oldestBlockTime == oldestBlockTime)&&(identical(other.backfilled, backfilled) || other.backfilled == backfilled)&&(identical(other.lastSyncMs, lastSyncMs) || other.lastSyncMs == lastSyncMs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,address,newestBlockTime,oldestBlockTime,backfilled,lastSyncMs);

@override
String toString() {
  return 'AddressTxSync(address: $address, newestBlockTime: $newestBlockTime, oldestBlockTime: $oldestBlockTime, backfilled: $backfilled, lastSyncMs: $lastSyncMs)';
}


}

/// @nodoc
abstract mixin class _$AddressTxSyncCopyWith<$Res> implements $AddressTxSyncCopyWith<$Res> {
  factory _$AddressTxSyncCopyWith(_AddressTxSync value, $Res Function(_AddressTxSync) _then) = __$AddressTxSyncCopyWithImpl;
@override @useResult
$Res call({
 String address, int newestBlockTime, int oldestBlockTime, bool backfilled, int lastSyncMs
});




}
/// @nodoc
class __$AddressTxSyncCopyWithImpl<$Res>
    implements _$AddressTxSyncCopyWith<$Res> {
  __$AddressTxSyncCopyWithImpl(this._self, this._then);

  final _AddressTxSync _self;
  final $Res Function(_AddressTxSync) _then;

/// Create a copy of AddressTxSync
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? address = null,Object? newestBlockTime = null,Object? oldestBlockTime = null,Object? backfilled = null,Object? lastSyncMs = null,}) {
  return _then(_AddressTxSync(
address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,newestBlockTime: null == newestBlockTime ? _self.newestBlockTime : newestBlockTime // ignore: cast_nullable_to_non_nullable
as int,oldestBlockTime: null == oldestBlockTime ? _self.oldestBlockTime : oldestBlockTime // ignore: cast_nullable_to_non_nullable
as int,backfilled: null == backfilled ? _self.backfilled : backfilled // ignore: cast_nullable_to_non_nullable
as bool,lastSyncMs: null == lastSyncMs ? _self.lastSyncMs : lastSyncMs // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
