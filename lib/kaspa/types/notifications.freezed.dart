// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notifications.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UtxosChanged {

 Iterable<Utxo> get added; Iterable<Utxo> get removed;
/// Create a copy of UtxosChanged
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UtxosChangedCopyWith<UtxosChanged> get copyWith => _$UtxosChangedCopyWithImpl<UtxosChanged>(this as UtxosChanged, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UtxosChanged&&const DeepCollectionEquality().equals(other.added, added)&&const DeepCollectionEquality().equals(other.removed, removed));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(added),const DeepCollectionEquality().hash(removed));

@override
String toString() {
  return 'UtxosChanged(added: $added, removed: $removed)';
}


}

/// @nodoc
abstract mixin class $UtxosChangedCopyWith<$Res>  {
  factory $UtxosChangedCopyWith(UtxosChanged value, $Res Function(UtxosChanged) _then) = _$UtxosChangedCopyWithImpl;
@useResult
$Res call({
 Iterable<Utxo> added, Iterable<Utxo> removed
});




}
/// @nodoc
class _$UtxosChangedCopyWithImpl<$Res>
    implements $UtxosChangedCopyWith<$Res> {
  _$UtxosChangedCopyWithImpl(this._self, this._then);

  final UtxosChanged _self;
  final $Res Function(UtxosChanged) _then;

/// Create a copy of UtxosChanged
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? added = null,Object? removed = null,}) {
  return _then(_self.copyWith(
added: null == added ? _self.added : added // ignore: cast_nullable_to_non_nullable
as Iterable<Utxo>,removed: null == removed ? _self.removed : removed // ignore: cast_nullable_to_non_nullable
as Iterable<Utxo>,
  ));
}

}


/// Adds pattern-matching-related methods to [UtxosChanged].
extension UtxosChangedPatterns on UtxosChanged {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UtxosChanged value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UtxosChanged() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UtxosChanged value)  $default,){
final _that = this;
switch (_that) {
case _UtxosChanged():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UtxosChanged value)?  $default,){
final _that = this;
switch (_that) {
case _UtxosChanged() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Iterable<Utxo> added,  Iterable<Utxo> removed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UtxosChanged() when $default != null:
return $default(_that.added,_that.removed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Iterable<Utxo> added,  Iterable<Utxo> removed)  $default,) {final _that = this;
switch (_that) {
case _UtxosChanged():
return $default(_that.added,_that.removed);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Iterable<Utxo> added,  Iterable<Utxo> removed)?  $default,) {final _that = this;
switch (_that) {
case _UtxosChanged() when $default != null:
return $default(_that.added,_that.removed);case _:
  return null;

}
}

}

/// @nodoc


class _UtxosChanged implements UtxosChanged {
  const _UtxosChanged({required this.added, required this.removed});
  

@override final  Iterable<Utxo> added;
@override final  Iterable<Utxo> removed;

/// Create a copy of UtxosChanged
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UtxosChangedCopyWith<_UtxosChanged> get copyWith => __$UtxosChangedCopyWithImpl<_UtxosChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UtxosChanged&&const DeepCollectionEquality().equals(other.added, added)&&const DeepCollectionEquality().equals(other.removed, removed));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(added),const DeepCollectionEquality().hash(removed));

@override
String toString() {
  return 'UtxosChanged(added: $added, removed: $removed)';
}


}

/// @nodoc
abstract mixin class _$UtxosChangedCopyWith<$Res> implements $UtxosChangedCopyWith<$Res> {
  factory _$UtxosChangedCopyWith(_UtxosChanged value, $Res Function(_UtxosChanged) _then) = __$UtxosChangedCopyWithImpl;
@override @useResult
$Res call({
 Iterable<Utxo> added, Iterable<Utxo> removed
});




}
/// @nodoc
class __$UtxosChangedCopyWithImpl<$Res>
    implements _$UtxosChangedCopyWith<$Res> {
  __$UtxosChangedCopyWithImpl(this._self, this._then);

  final _UtxosChanged _self;
  final $Res Function(_UtxosChanged) _then;

/// Create a copy of UtxosChanged
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? added = null,Object? removed = null,}) {
  return _then(_UtxosChanged(
added: null == added ? _self.added : added // ignore: cast_nullable_to_non_nullable
as Iterable<Utxo>,removed: null == removed ? _self.removed : removed // ignore: cast_nullable_to_non_nullable
as Iterable<Utxo>,
  ));
}


}

/// @nodoc
mixin _$AcceptedTransactionIds {

 String get acceptingBlockHash; Iterable<String> get acceptedTransactionIds;
/// Create a copy of AcceptedTransactionIds
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AcceptedTransactionIdsCopyWith<AcceptedTransactionIds> get copyWith => _$AcceptedTransactionIdsCopyWithImpl<AcceptedTransactionIds>(this as AcceptedTransactionIds, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AcceptedTransactionIds&&(identical(other.acceptingBlockHash, acceptingBlockHash) || other.acceptingBlockHash == acceptingBlockHash)&&const DeepCollectionEquality().equals(other.acceptedTransactionIds, acceptedTransactionIds));
}


@override
int get hashCode => Object.hash(runtimeType,acceptingBlockHash,const DeepCollectionEquality().hash(acceptedTransactionIds));

@override
String toString() {
  return 'AcceptedTransactionIds(acceptingBlockHash: $acceptingBlockHash, acceptedTransactionIds: $acceptedTransactionIds)';
}


}

/// @nodoc
abstract mixin class $AcceptedTransactionIdsCopyWith<$Res>  {
  factory $AcceptedTransactionIdsCopyWith(AcceptedTransactionIds value, $Res Function(AcceptedTransactionIds) _then) = _$AcceptedTransactionIdsCopyWithImpl;
@useResult
$Res call({
 String acceptingBlockHash, Iterable<String> acceptedTransactionIds
});




}
/// @nodoc
class _$AcceptedTransactionIdsCopyWithImpl<$Res>
    implements $AcceptedTransactionIdsCopyWith<$Res> {
  _$AcceptedTransactionIdsCopyWithImpl(this._self, this._then);

  final AcceptedTransactionIds _self;
  final $Res Function(AcceptedTransactionIds) _then;

/// Create a copy of AcceptedTransactionIds
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? acceptingBlockHash = null,Object? acceptedTransactionIds = null,}) {
  return _then(_self.copyWith(
acceptingBlockHash: null == acceptingBlockHash ? _self.acceptingBlockHash : acceptingBlockHash // ignore: cast_nullable_to_non_nullable
as String,acceptedTransactionIds: null == acceptedTransactionIds ? _self.acceptedTransactionIds : acceptedTransactionIds // ignore: cast_nullable_to_non_nullable
as Iterable<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [AcceptedTransactionIds].
extension AcceptedTransactionIdsPatterns on AcceptedTransactionIds {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AcceptedTransactionIds value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AcceptedTransactionIds() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AcceptedTransactionIds value)  $default,){
final _that = this;
switch (_that) {
case _AcceptedTransactionIds():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AcceptedTransactionIds value)?  $default,){
final _that = this;
switch (_that) {
case _AcceptedTransactionIds() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String acceptingBlockHash,  Iterable<String> acceptedTransactionIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AcceptedTransactionIds() when $default != null:
return $default(_that.acceptingBlockHash,_that.acceptedTransactionIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String acceptingBlockHash,  Iterable<String> acceptedTransactionIds)  $default,) {final _that = this;
switch (_that) {
case _AcceptedTransactionIds():
return $default(_that.acceptingBlockHash,_that.acceptedTransactionIds);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String acceptingBlockHash,  Iterable<String> acceptedTransactionIds)?  $default,) {final _that = this;
switch (_that) {
case _AcceptedTransactionIds() when $default != null:
return $default(_that.acceptingBlockHash,_that.acceptedTransactionIds);case _:
  return null;

}
}

}

/// @nodoc


class _AcceptedTransactionIds implements AcceptedTransactionIds {
  const _AcceptedTransactionIds({required this.acceptingBlockHash, required this.acceptedTransactionIds});
  

@override final  String acceptingBlockHash;
@override final  Iterable<String> acceptedTransactionIds;

/// Create a copy of AcceptedTransactionIds
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AcceptedTransactionIdsCopyWith<_AcceptedTransactionIds> get copyWith => __$AcceptedTransactionIdsCopyWithImpl<_AcceptedTransactionIds>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AcceptedTransactionIds&&(identical(other.acceptingBlockHash, acceptingBlockHash) || other.acceptingBlockHash == acceptingBlockHash)&&const DeepCollectionEquality().equals(other.acceptedTransactionIds, acceptedTransactionIds));
}


@override
int get hashCode => Object.hash(runtimeType,acceptingBlockHash,const DeepCollectionEquality().hash(acceptedTransactionIds));

@override
String toString() {
  return 'AcceptedTransactionIds(acceptingBlockHash: $acceptingBlockHash, acceptedTransactionIds: $acceptedTransactionIds)';
}


}

/// @nodoc
abstract mixin class _$AcceptedTransactionIdsCopyWith<$Res> implements $AcceptedTransactionIdsCopyWith<$Res> {
  factory _$AcceptedTransactionIdsCopyWith(_AcceptedTransactionIds value, $Res Function(_AcceptedTransactionIds) _then) = __$AcceptedTransactionIdsCopyWithImpl;
@override @useResult
$Res call({
 String acceptingBlockHash, Iterable<String> acceptedTransactionIds
});




}
/// @nodoc
class __$AcceptedTransactionIdsCopyWithImpl<$Res>
    implements _$AcceptedTransactionIdsCopyWith<$Res> {
  __$AcceptedTransactionIdsCopyWithImpl(this._self, this._then);

  final _AcceptedTransactionIds _self;
  final $Res Function(_AcceptedTransactionIds) _then;

/// Create a copy of AcceptedTransactionIds
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? acceptingBlockHash = null,Object? acceptedTransactionIds = null,}) {
  return _then(_AcceptedTransactionIds(
acceptingBlockHash: null == acceptingBlockHash ? _self.acceptingBlockHash : acceptingBlockHash // ignore: cast_nullable_to_non_nullable
as String,acceptedTransactionIds: null == acceptedTransactionIds ? _self.acceptedTransactionIds : acceptedTransactionIds // ignore: cast_nullable_to_non_nullable
as Iterable<String>,
  ));
}


}

/// @nodoc
mixin _$VirtualChainChanged {

 Iterable<String> get removedChainBlockHashes; Iterable<String> get addedChainBlockHashes; Iterable<AcceptedTransactionIds> get acceptedTransactionIds;
/// Create a copy of VirtualChainChanged
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VirtualChainChangedCopyWith<VirtualChainChanged> get copyWith => _$VirtualChainChangedCopyWithImpl<VirtualChainChanged>(this as VirtualChainChanged, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VirtualChainChanged&&const DeepCollectionEquality().equals(other.removedChainBlockHashes, removedChainBlockHashes)&&const DeepCollectionEquality().equals(other.addedChainBlockHashes, addedChainBlockHashes)&&const DeepCollectionEquality().equals(other.acceptedTransactionIds, acceptedTransactionIds));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(removedChainBlockHashes),const DeepCollectionEquality().hash(addedChainBlockHashes),const DeepCollectionEquality().hash(acceptedTransactionIds));

@override
String toString() {
  return 'VirtualChainChanged(removedChainBlockHashes: $removedChainBlockHashes, addedChainBlockHashes: $addedChainBlockHashes, acceptedTransactionIds: $acceptedTransactionIds)';
}


}

/// @nodoc
abstract mixin class $VirtualChainChangedCopyWith<$Res>  {
  factory $VirtualChainChangedCopyWith(VirtualChainChanged value, $Res Function(VirtualChainChanged) _then) = _$VirtualChainChangedCopyWithImpl;
@useResult
$Res call({
 Iterable<String> removedChainBlockHashes, Iterable<String> addedChainBlockHashes, Iterable<AcceptedTransactionIds> acceptedTransactionIds
});




}
/// @nodoc
class _$VirtualChainChangedCopyWithImpl<$Res>
    implements $VirtualChainChangedCopyWith<$Res> {
  _$VirtualChainChangedCopyWithImpl(this._self, this._then);

  final VirtualChainChanged _self;
  final $Res Function(VirtualChainChanged) _then;

/// Create a copy of VirtualChainChanged
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? removedChainBlockHashes = null,Object? addedChainBlockHashes = null,Object? acceptedTransactionIds = null,}) {
  return _then(_self.copyWith(
removedChainBlockHashes: null == removedChainBlockHashes ? _self.removedChainBlockHashes : removedChainBlockHashes // ignore: cast_nullable_to_non_nullable
as Iterable<String>,addedChainBlockHashes: null == addedChainBlockHashes ? _self.addedChainBlockHashes : addedChainBlockHashes // ignore: cast_nullable_to_non_nullable
as Iterable<String>,acceptedTransactionIds: null == acceptedTransactionIds ? _self.acceptedTransactionIds : acceptedTransactionIds // ignore: cast_nullable_to_non_nullable
as Iterable<AcceptedTransactionIds>,
  ));
}

}


/// Adds pattern-matching-related methods to [VirtualChainChanged].
extension VirtualChainChangedPatterns on VirtualChainChanged {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VirtualChainChanged value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VirtualChainChanged() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VirtualChainChanged value)  $default,){
final _that = this;
switch (_that) {
case _VirtualChainChanged():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VirtualChainChanged value)?  $default,){
final _that = this;
switch (_that) {
case _VirtualChainChanged() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Iterable<String> removedChainBlockHashes,  Iterable<String> addedChainBlockHashes,  Iterable<AcceptedTransactionIds> acceptedTransactionIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VirtualChainChanged() when $default != null:
return $default(_that.removedChainBlockHashes,_that.addedChainBlockHashes,_that.acceptedTransactionIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Iterable<String> removedChainBlockHashes,  Iterable<String> addedChainBlockHashes,  Iterable<AcceptedTransactionIds> acceptedTransactionIds)  $default,) {final _that = this;
switch (_that) {
case _VirtualChainChanged():
return $default(_that.removedChainBlockHashes,_that.addedChainBlockHashes,_that.acceptedTransactionIds);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Iterable<String> removedChainBlockHashes,  Iterable<String> addedChainBlockHashes,  Iterable<AcceptedTransactionIds> acceptedTransactionIds)?  $default,) {final _that = this;
switch (_that) {
case _VirtualChainChanged() when $default != null:
return $default(_that.removedChainBlockHashes,_that.addedChainBlockHashes,_that.acceptedTransactionIds);case _:
  return null;

}
}

}

/// @nodoc


class _VirtualChainChanged implements VirtualChainChanged {
  const _VirtualChainChanged({required this.removedChainBlockHashes, required this.addedChainBlockHashes, required this.acceptedTransactionIds});
  

@override final  Iterable<String> removedChainBlockHashes;
@override final  Iterable<String> addedChainBlockHashes;
@override final  Iterable<AcceptedTransactionIds> acceptedTransactionIds;

/// Create a copy of VirtualChainChanged
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VirtualChainChangedCopyWith<_VirtualChainChanged> get copyWith => __$VirtualChainChangedCopyWithImpl<_VirtualChainChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VirtualChainChanged&&const DeepCollectionEquality().equals(other.removedChainBlockHashes, removedChainBlockHashes)&&const DeepCollectionEquality().equals(other.addedChainBlockHashes, addedChainBlockHashes)&&const DeepCollectionEquality().equals(other.acceptedTransactionIds, acceptedTransactionIds));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(removedChainBlockHashes),const DeepCollectionEquality().hash(addedChainBlockHashes),const DeepCollectionEquality().hash(acceptedTransactionIds));

@override
String toString() {
  return 'VirtualChainChanged(removedChainBlockHashes: $removedChainBlockHashes, addedChainBlockHashes: $addedChainBlockHashes, acceptedTransactionIds: $acceptedTransactionIds)';
}


}

/// @nodoc
abstract mixin class _$VirtualChainChangedCopyWith<$Res> implements $VirtualChainChangedCopyWith<$Res> {
  factory _$VirtualChainChangedCopyWith(_VirtualChainChanged value, $Res Function(_VirtualChainChanged) _then) = __$VirtualChainChangedCopyWithImpl;
@override @useResult
$Res call({
 Iterable<String> removedChainBlockHashes, Iterable<String> addedChainBlockHashes, Iterable<AcceptedTransactionIds> acceptedTransactionIds
});




}
/// @nodoc
class __$VirtualChainChangedCopyWithImpl<$Res>
    implements _$VirtualChainChangedCopyWith<$Res> {
  __$VirtualChainChangedCopyWithImpl(this._self, this._then);

  final _VirtualChainChanged _self;
  final $Res Function(_VirtualChainChanged) _then;

/// Create a copy of VirtualChainChanged
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? removedChainBlockHashes = null,Object? addedChainBlockHashes = null,Object? acceptedTransactionIds = null,}) {
  return _then(_VirtualChainChanged(
removedChainBlockHashes: null == removedChainBlockHashes ? _self.removedChainBlockHashes : removedChainBlockHashes // ignore: cast_nullable_to_non_nullable
as Iterable<String>,addedChainBlockHashes: null == addedChainBlockHashes ? _self.addedChainBlockHashes : addedChainBlockHashes // ignore: cast_nullable_to_non_nullable
as Iterable<String>,acceptedTransactionIds: null == acceptedTransactionIds ? _self.acceptedTransactionIds : acceptedTransactionIds // ignore: cast_nullable_to_non_nullable
as Iterable<AcceptedTransactionIds>,
  ));
}


}

// dart format on
