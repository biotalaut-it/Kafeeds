// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'push_types.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PushTokenSettings {

 PushToken get token; ClientId get clientId; String get privateKey; bool get published;
/// Create a copy of PushTokenSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PushTokenSettingsCopyWith<PushTokenSettings> get copyWith => _$PushTokenSettingsCopyWithImpl<PushTokenSettings>(this as PushTokenSettings, _$identity);

  /// Serializes this PushTokenSettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PushTokenSettings&&(identical(other.token, token) || other.token == token)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.privateKey, privateKey) || other.privateKey == privateKey)&&(identical(other.published, published) || other.published == published));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,clientId,privateKey,published);

@override
String toString() {
  return 'PushTokenSettings(token: $token, clientId: $clientId, privateKey: $privateKey, published: $published)';
}


}

/// @nodoc
abstract mixin class $PushTokenSettingsCopyWith<$Res>  {
  factory $PushTokenSettingsCopyWith(PushTokenSettings value, $Res Function(PushTokenSettings) _then) = _$PushTokenSettingsCopyWithImpl;
@useResult
$Res call({
 PushToken token, ClientId clientId, String privateKey, bool published
});




}
/// @nodoc
class _$PushTokenSettingsCopyWithImpl<$Res>
    implements $PushTokenSettingsCopyWith<$Res> {
  _$PushTokenSettingsCopyWithImpl(this._self, this._then);

  final PushTokenSettings _self;
  final $Res Function(PushTokenSettings) _then;

/// Create a copy of PushTokenSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? token = null,Object? clientId = null,Object? privateKey = null,Object? published = null,}) {
  return _then(_self.copyWith(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as PushToken,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as ClientId,privateKey: null == privateKey ? _self.privateKey : privateKey // ignore: cast_nullable_to_non_nullable
as String,published: null == published ? _self.published : published // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PushTokenSettings].
extension PushTokenSettingsPatterns on PushTokenSettings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PushTokenSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PushTokenSettings() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PushTokenSettings value)  $default,){
final _that = this;
switch (_that) {
case _PushTokenSettings():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PushTokenSettings value)?  $default,){
final _that = this;
switch (_that) {
case _PushTokenSettings() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PushToken token,  ClientId clientId,  String privateKey,  bool published)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PushTokenSettings() when $default != null:
return $default(_that.token,_that.clientId,_that.privateKey,_that.published);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PushToken token,  ClientId clientId,  String privateKey,  bool published)  $default,) {final _that = this;
switch (_that) {
case _PushTokenSettings():
return $default(_that.token,_that.clientId,_that.privateKey,_that.published);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PushToken token,  ClientId clientId,  String privateKey,  bool published)?  $default,) {final _that = this;
switch (_that) {
case _PushTokenSettings() when $default != null:
return $default(_that.token,_that.clientId,_that.privateKey,_that.published);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PushTokenSettings extends PushTokenSettings {
  const _PushTokenSettings({required this.token, required this.clientId, required this.privateKey, this.published = false}): super._();
  factory _PushTokenSettings.fromJson(Map<String, dynamic> json) => _$PushTokenSettingsFromJson(json);

@override final  PushToken token;
@override final  ClientId clientId;
@override final  String privateKey;
@override@JsonKey() final  bool published;

/// Create a copy of PushTokenSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PushTokenSettingsCopyWith<_PushTokenSettings> get copyWith => __$PushTokenSettingsCopyWithImpl<_PushTokenSettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PushTokenSettingsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PushTokenSettings&&(identical(other.token, token) || other.token == token)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.privateKey, privateKey) || other.privateKey == privateKey)&&(identical(other.published, published) || other.published == published));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,clientId,privateKey,published);

@override
String toString() {
  return 'PushTokenSettings(token: $token, clientId: $clientId, privateKey: $privateKey, published: $published)';
}


}

/// @nodoc
abstract mixin class _$PushTokenSettingsCopyWith<$Res> implements $PushTokenSettingsCopyWith<$Res> {
  factory _$PushTokenSettingsCopyWith(_PushTokenSettings value, $Res Function(_PushTokenSettings) _then) = __$PushTokenSettingsCopyWithImpl;
@override @useResult
$Res call({
 PushToken token, ClientId clientId, String privateKey, bool published
});




}
/// @nodoc
class __$PushTokenSettingsCopyWithImpl<$Res>
    implements _$PushTokenSettingsCopyWith<$Res> {
  __$PushTokenSettingsCopyWithImpl(this._self, this._then);

  final _PushTokenSettings _self;
  final $Res Function(_PushTokenSettings) _then;

/// Create a copy of PushTokenSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? token = null,Object? clientId = null,Object? privateKey = null,Object? published = null,}) {
  return _then(_PushTokenSettings(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as PushToken,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as ClientId,privateKey: null == privateKey ? _self.privateKey : privateKey // ignore: cast_nullable_to_non_nullable
as String,published: null == published ? _self.published : published // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$PushOptions {

 bool get enabled;
/// Create a copy of PushOptions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PushOptionsCopyWith<PushOptions> get copyWith => _$PushOptionsCopyWithImpl<PushOptions>(this as PushOptions, _$identity);

  /// Serializes this PushOptions to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PushOptions&&(identical(other.enabled, enabled) || other.enabled == enabled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,enabled);

@override
String toString() {
  return 'PushOptions(enabled: $enabled)';
}


}

/// @nodoc
abstract mixin class $PushOptionsCopyWith<$Res>  {
  factory $PushOptionsCopyWith(PushOptions value, $Res Function(PushOptions) _then) = _$PushOptionsCopyWithImpl;
@useResult
$Res call({
 bool enabled
});




}
/// @nodoc
class _$PushOptionsCopyWithImpl<$Res>
    implements $PushOptionsCopyWith<$Res> {
  _$PushOptionsCopyWithImpl(this._self, this._then);

  final PushOptions _self;
  final $Res Function(PushOptions) _then;

/// Create a copy of PushOptions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? enabled = null,}) {
  return _then(_self.copyWith(
enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PushOptions].
extension PushOptionsPatterns on PushOptions {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PushOptions value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PushOptions() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PushOptions value)  $default,){
final _that = this;
switch (_that) {
case _PushOptions():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PushOptions value)?  $default,){
final _that = this;
switch (_that) {
case _PushOptions() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool enabled)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PushOptions() when $default != null:
return $default(_that.enabled);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool enabled)  $default,) {final _that = this;
switch (_that) {
case _PushOptions():
return $default(_that.enabled);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool enabled)?  $default,) {final _that = this;
switch (_that) {
case _PushOptions() when $default != null:
return $default(_that.enabled);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PushOptions extends PushOptions {
  const _PushOptions({this.enabled = false}): super._();
  factory _PushOptions.fromJson(Map<String, dynamic> json) => _$PushOptionsFromJson(json);

@override@JsonKey() final  bool enabled;

/// Create a copy of PushOptions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PushOptionsCopyWith<_PushOptions> get copyWith => __$PushOptionsCopyWithImpl<_PushOptions>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PushOptionsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PushOptions&&(identical(other.enabled, enabled) || other.enabled == enabled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,enabled);

@override
String toString() {
  return 'PushOptions(enabled: $enabled)';
}


}

/// @nodoc
abstract mixin class _$PushOptionsCopyWith<$Res> implements $PushOptionsCopyWith<$Res> {
  factory _$PushOptionsCopyWith(_PushOptions value, $Res Function(_PushOptions) _then) = __$PushOptionsCopyWithImpl;
@override @useResult
$Res call({
 bool enabled
});




}
/// @nodoc
class __$PushOptionsCopyWithImpl<$Res>
    implements _$PushOptionsCopyWith<$Res> {
  __$PushOptionsCopyWithImpl(this._self, this._then);

  final _PushOptions _self;
  final $Res Function(_PushOptions) _then;

/// Create a copy of PushOptions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? enabled = null,}) {
  return _then(_PushOptions(
enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$WatchPreferences {

 Set<String> get pinnedAddresses; Set<String> get excludedAddresses; bool get autoWatch;
/// Create a copy of WatchPreferences
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WatchPreferencesCopyWith<WatchPreferences> get copyWith => _$WatchPreferencesCopyWithImpl<WatchPreferences>(this as WatchPreferences, _$identity);

  /// Serializes this WatchPreferences to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WatchPreferences&&const DeepCollectionEquality().equals(other.pinnedAddresses, pinnedAddresses)&&const DeepCollectionEquality().equals(other.excludedAddresses, excludedAddresses)&&(identical(other.autoWatch, autoWatch) || other.autoWatch == autoWatch));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(pinnedAddresses),const DeepCollectionEquality().hash(excludedAddresses),autoWatch);

@override
String toString() {
  return 'WatchPreferences(pinnedAddresses: $pinnedAddresses, excludedAddresses: $excludedAddresses, autoWatch: $autoWatch)';
}


}

/// @nodoc
abstract mixin class $WatchPreferencesCopyWith<$Res>  {
  factory $WatchPreferencesCopyWith(WatchPreferences value, $Res Function(WatchPreferences) _then) = _$WatchPreferencesCopyWithImpl;
@useResult
$Res call({
 Set<String> pinnedAddresses, Set<String> excludedAddresses, bool autoWatch
});




}
/// @nodoc
class _$WatchPreferencesCopyWithImpl<$Res>
    implements $WatchPreferencesCopyWith<$Res> {
  _$WatchPreferencesCopyWithImpl(this._self, this._then);

  final WatchPreferences _self;
  final $Res Function(WatchPreferences) _then;

/// Create a copy of WatchPreferences
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pinnedAddresses = null,Object? excludedAddresses = null,Object? autoWatch = null,}) {
  return _then(_self.copyWith(
pinnedAddresses: null == pinnedAddresses ? _self.pinnedAddresses : pinnedAddresses // ignore: cast_nullable_to_non_nullable
as Set<String>,excludedAddresses: null == excludedAddresses ? _self.excludedAddresses : excludedAddresses // ignore: cast_nullable_to_non_nullable
as Set<String>,autoWatch: null == autoWatch ? _self.autoWatch : autoWatch // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [WatchPreferences].
extension WatchPreferencesPatterns on WatchPreferences {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WatchPreferences value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WatchPreferences() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WatchPreferences value)  $default,){
final _that = this;
switch (_that) {
case _WatchPreferences():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WatchPreferences value)?  $default,){
final _that = this;
switch (_that) {
case _WatchPreferences() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Set<String> pinnedAddresses,  Set<String> excludedAddresses,  bool autoWatch)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WatchPreferences() when $default != null:
return $default(_that.pinnedAddresses,_that.excludedAddresses,_that.autoWatch);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Set<String> pinnedAddresses,  Set<String> excludedAddresses,  bool autoWatch)  $default,) {final _that = this;
switch (_that) {
case _WatchPreferences():
return $default(_that.pinnedAddresses,_that.excludedAddresses,_that.autoWatch);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Set<String> pinnedAddresses,  Set<String> excludedAddresses,  bool autoWatch)?  $default,) {final _that = this;
switch (_that) {
case _WatchPreferences() when $default != null:
return $default(_that.pinnedAddresses,_that.excludedAddresses,_that.autoWatch);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WatchPreferences extends WatchPreferences {
  const _WatchPreferences({final  Set<String> pinnedAddresses = const <String>{}, final  Set<String> excludedAddresses = const <String>{}, this.autoWatch = true}): _pinnedAddresses = pinnedAddresses,_excludedAddresses = excludedAddresses,super._();
  factory _WatchPreferences.fromJson(Map<String, dynamic> json) => _$WatchPreferencesFromJson(json);

 final  Set<String> _pinnedAddresses;
@override@JsonKey() Set<String> get pinnedAddresses {
  if (_pinnedAddresses is EqualUnmodifiableSetView) return _pinnedAddresses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_pinnedAddresses);
}

 final  Set<String> _excludedAddresses;
@override@JsonKey() Set<String> get excludedAddresses {
  if (_excludedAddresses is EqualUnmodifiableSetView) return _excludedAddresses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_excludedAddresses);
}

@override@JsonKey() final  bool autoWatch;

/// Create a copy of WatchPreferences
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WatchPreferencesCopyWith<_WatchPreferences> get copyWith => __$WatchPreferencesCopyWithImpl<_WatchPreferences>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WatchPreferencesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WatchPreferences&&const DeepCollectionEquality().equals(other._pinnedAddresses, _pinnedAddresses)&&const DeepCollectionEquality().equals(other._excludedAddresses, _excludedAddresses)&&(identical(other.autoWatch, autoWatch) || other.autoWatch == autoWatch));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_pinnedAddresses),const DeepCollectionEquality().hash(_excludedAddresses),autoWatch);

@override
String toString() {
  return 'WatchPreferences(pinnedAddresses: $pinnedAddresses, excludedAddresses: $excludedAddresses, autoWatch: $autoWatch)';
}


}

/// @nodoc
abstract mixin class _$WatchPreferencesCopyWith<$Res> implements $WatchPreferencesCopyWith<$Res> {
  factory _$WatchPreferencesCopyWith(_WatchPreferences value, $Res Function(_WatchPreferences) _then) = __$WatchPreferencesCopyWithImpl;
@override @useResult
$Res call({
 Set<String> pinnedAddresses, Set<String> excludedAddresses, bool autoWatch
});




}
/// @nodoc
class __$WatchPreferencesCopyWithImpl<$Res>
    implements _$WatchPreferencesCopyWith<$Res> {
  __$WatchPreferencesCopyWithImpl(this._self, this._then);

  final _WatchPreferences _self;
  final $Res Function(_WatchPreferences) _then;

/// Create a copy of WatchPreferences
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pinnedAddresses = null,Object? excludedAddresses = null,Object? autoWatch = null,}) {
  return _then(_WatchPreferences(
pinnedAddresses: null == pinnedAddresses ? _self._pinnedAddresses : pinnedAddresses // ignore: cast_nullable_to_non_nullable
as Set<String>,excludedAddresses: null == excludedAddresses ? _self._excludedAddresses : excludedAddresses // ignore: cast_nullable_to_non_nullable
as Set<String>,autoWatch: null == autoWatch ? _self.autoWatch : autoWatch // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

PushSettings _$PushSettingsFromJson(
  Map<String, dynamic> json
) {
    return _PushInfo.fromJson(
      json
    );
}

/// @nodoc
mixin _$PushSettings {

 AccountId get accountId; String get walletId; int get index; PushOptions get options; List<String> get addresses; WatchPreferences get watchPreferences; bool get synced;
/// Create a copy of PushSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PushSettingsCopyWith<PushSettings> get copyWith => _$PushSettingsCopyWithImpl<PushSettings>(this as PushSettings, _$identity);

  /// Serializes this PushSettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PushSettings&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.walletId, walletId) || other.walletId == walletId)&&(identical(other.index, index) || other.index == index)&&(identical(other.options, options) || other.options == options)&&const DeepCollectionEquality().equals(other.addresses, addresses)&&(identical(other.watchPreferences, watchPreferences) || other.watchPreferences == watchPreferences)&&(identical(other.synced, synced) || other.synced == synced));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accountId,walletId,index,options,const DeepCollectionEquality().hash(addresses),watchPreferences,synced);

@override
String toString() {
  return 'PushSettings(accountId: $accountId, walletId: $walletId, index: $index, options: $options, addresses: $addresses, watchPreferences: $watchPreferences, synced: $synced)';
}


}

/// @nodoc
abstract mixin class $PushSettingsCopyWith<$Res>  {
  factory $PushSettingsCopyWith(PushSettings value, $Res Function(PushSettings) _then) = _$PushSettingsCopyWithImpl;
@useResult
$Res call({
 AccountId accountId, String walletId, int index, PushOptions options, List<String> addresses, WatchPreferences watchPreferences, bool synced
});


$PushOptionsCopyWith<$Res> get options;$WatchPreferencesCopyWith<$Res> get watchPreferences;

}
/// @nodoc
class _$PushSettingsCopyWithImpl<$Res>
    implements $PushSettingsCopyWith<$Res> {
  _$PushSettingsCopyWithImpl(this._self, this._then);

  final PushSettings _self;
  final $Res Function(PushSettings) _then;

/// Create a copy of PushSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accountId = null,Object? walletId = null,Object? index = null,Object? options = null,Object? addresses = null,Object? watchPreferences = null,Object? synced = null,}) {
  return _then(_self.copyWith(
accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as AccountId,walletId: null == walletId ? _self.walletId : walletId // ignore: cast_nullable_to_non_nullable
as String,index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as PushOptions,addresses: null == addresses ? _self.addresses : addresses // ignore: cast_nullable_to_non_nullable
as List<String>,watchPreferences: null == watchPreferences ? _self.watchPreferences : watchPreferences // ignore: cast_nullable_to_non_nullable
as WatchPreferences,synced: null == synced ? _self.synced : synced // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of PushSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PushOptionsCopyWith<$Res> get options {
  
  return $PushOptionsCopyWith<$Res>(_self.options, (value) {
    return _then(_self.copyWith(options: value));
  });
}/// Create a copy of PushSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WatchPreferencesCopyWith<$Res> get watchPreferences {
  
  return $WatchPreferencesCopyWith<$Res>(_self.watchPreferences, (value) {
    return _then(_self.copyWith(watchPreferences: value));
  });
}
}


/// Adds pattern-matching-related methods to [PushSettings].
extension PushSettingsPatterns on PushSettings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PushInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PushInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PushInfo value)  $default,){
final _that = this;
switch (_that) {
case _PushInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PushInfo value)?  $default,){
final _that = this;
switch (_that) {
case _PushInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AccountId accountId,  String walletId,  int index,  PushOptions options,  List<String> addresses,  WatchPreferences watchPreferences,  bool synced)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PushInfo() when $default != null:
return $default(_that.accountId,_that.walletId,_that.index,_that.options,_that.addresses,_that.watchPreferences,_that.synced);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AccountId accountId,  String walletId,  int index,  PushOptions options,  List<String> addresses,  WatchPreferences watchPreferences,  bool synced)  $default,) {final _that = this;
switch (_that) {
case _PushInfo():
return $default(_that.accountId,_that.walletId,_that.index,_that.options,_that.addresses,_that.watchPreferences,_that.synced);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AccountId accountId,  String walletId,  int index,  PushOptions options,  List<String> addresses,  WatchPreferences watchPreferences,  bool synced)?  $default,) {final _that = this;
switch (_that) {
case _PushInfo() when $default != null:
return $default(_that.accountId,_that.walletId,_that.index,_that.options,_that.addresses,_that.watchPreferences,_that.synced);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PushInfo extends PushSettings {
   _PushInfo({required this.accountId, required this.walletId, required this.index, this.options = const PushOptions(), final  List<String> addresses = const [], this.watchPreferences = const WatchPreferences(), this.synced = true}): _addresses = addresses,super._();
  factory _PushInfo.fromJson(Map<String, dynamic> json) => _$PushInfoFromJson(json);

@override final  AccountId accountId;
@override final  String walletId;
@override final  int index;
@override@JsonKey() final  PushOptions options;
 final  List<String> _addresses;
@override@JsonKey() List<String> get addresses {
  if (_addresses is EqualUnmodifiableListView) return _addresses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_addresses);
}

@override@JsonKey() final  WatchPreferences watchPreferences;
@override@JsonKey() final  bool synced;

/// Create a copy of PushSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PushInfoCopyWith<_PushInfo> get copyWith => __$PushInfoCopyWithImpl<_PushInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PushInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PushInfo&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.walletId, walletId) || other.walletId == walletId)&&(identical(other.index, index) || other.index == index)&&(identical(other.options, options) || other.options == options)&&const DeepCollectionEquality().equals(other._addresses, _addresses)&&(identical(other.watchPreferences, watchPreferences) || other.watchPreferences == watchPreferences)&&(identical(other.synced, synced) || other.synced == synced));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accountId,walletId,index,options,const DeepCollectionEquality().hash(_addresses),watchPreferences,synced);

@override
String toString() {
  return 'PushSettings(accountId: $accountId, walletId: $walletId, index: $index, options: $options, addresses: $addresses, watchPreferences: $watchPreferences, synced: $synced)';
}


}

/// @nodoc
abstract mixin class _$PushInfoCopyWith<$Res> implements $PushSettingsCopyWith<$Res> {
  factory _$PushInfoCopyWith(_PushInfo value, $Res Function(_PushInfo) _then) = __$PushInfoCopyWithImpl;
@override @useResult
$Res call({
 AccountId accountId, String walletId, int index, PushOptions options, List<String> addresses, WatchPreferences watchPreferences, bool synced
});


@override $PushOptionsCopyWith<$Res> get options;@override $WatchPreferencesCopyWith<$Res> get watchPreferences;

}
/// @nodoc
class __$PushInfoCopyWithImpl<$Res>
    implements _$PushInfoCopyWith<$Res> {
  __$PushInfoCopyWithImpl(this._self, this._then);

  final _PushInfo _self;
  final $Res Function(_PushInfo) _then;

/// Create a copy of PushSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accountId = null,Object? walletId = null,Object? index = null,Object? options = null,Object? addresses = null,Object? watchPreferences = null,Object? synced = null,}) {
  return _then(_PushInfo(
accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as AccountId,walletId: null == walletId ? _self.walletId : walletId // ignore: cast_nullable_to_non_nullable
as String,index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as PushOptions,addresses: null == addresses ? _self._addresses : addresses // ignore: cast_nullable_to_non_nullable
as List<String>,watchPreferences: null == watchPreferences ? _self.watchPreferences : watchPreferences // ignore: cast_nullable_to_non_nullable
as WatchPreferences,synced: null == synced ? _self.synced : synced // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of PushSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PushOptionsCopyWith<$Res> get options {
  
  return $PushOptionsCopyWith<$Res>(_self.options, (value) {
    return _then(_self.copyWith(options: value));
  });
}/// Create a copy of PushSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WatchPreferencesCopyWith<$Res> get watchPreferences {
  
  return $WatchPreferencesCopyWith<$Res>(_self.watchPreferences, (value) {
    return _then(_self.copyWith(watchPreferences: value));
  });
}
}


/// @nodoc
mixin _$PushApiData {

 PushToken? get token; ClientId? get clientId; AccountId? get accountId; PushOptions? get options; List<String>? get addresses;// Unix milliseconds; part of the signed body, so the service can bound
// how long a captured request stays replayable.
 int? get ts;// Unregisters this client entirely. Explicit, since a bare
// {token, clientId} is a registration.
 bool get reset;// Answers a claim challenge: the nonce the service pushed to whoever
// holds [token], proving this device is that holder.
 String? get claim;
/// Create a copy of PushApiData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PushApiDataCopyWith<PushApiData> get copyWith => _$PushApiDataCopyWithImpl<PushApiData>(this as PushApiData, _$identity);

  /// Serializes this PushApiData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PushApiData&&(identical(other.token, token) || other.token == token)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.options, options) || other.options == options)&&const DeepCollectionEquality().equals(other.addresses, addresses)&&(identical(other.ts, ts) || other.ts == ts)&&(identical(other.reset, reset) || other.reset == reset)&&(identical(other.claim, claim) || other.claim == claim));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,clientId,accountId,options,const DeepCollectionEquality().hash(addresses),ts,reset,claim);

@override
String toString() {
  return 'PushApiData(token: $token, clientId: $clientId, accountId: $accountId, options: $options, addresses: $addresses, ts: $ts, reset: $reset, claim: $claim)';
}


}

/// @nodoc
abstract mixin class $PushApiDataCopyWith<$Res>  {
  factory $PushApiDataCopyWith(PushApiData value, $Res Function(PushApiData) _then) = _$PushApiDataCopyWithImpl;
@useResult
$Res call({
 PushToken? token, ClientId? clientId, AccountId? accountId, PushOptions? options, List<String>? addresses, int? ts, bool reset, String? claim
});


$PushOptionsCopyWith<$Res>? get options;

}
/// @nodoc
class _$PushApiDataCopyWithImpl<$Res>
    implements $PushApiDataCopyWith<$Res> {
  _$PushApiDataCopyWithImpl(this._self, this._then);

  final PushApiData _self;
  final $Res Function(PushApiData) _then;

/// Create a copy of PushApiData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? token = freezed,Object? clientId = freezed,Object? accountId = freezed,Object? options = freezed,Object? addresses = freezed,Object? ts = freezed,Object? reset = null,Object? claim = freezed,}) {
  return _then(_self.copyWith(
token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as PushToken?,clientId: freezed == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as ClientId?,accountId: freezed == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as AccountId?,options: freezed == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as PushOptions?,addresses: freezed == addresses ? _self.addresses : addresses // ignore: cast_nullable_to_non_nullable
as List<String>?,ts: freezed == ts ? _self.ts : ts // ignore: cast_nullable_to_non_nullable
as int?,reset: null == reset ? _self.reset : reset // ignore: cast_nullable_to_non_nullable
as bool,claim: freezed == claim ? _self.claim : claim // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of PushApiData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PushOptionsCopyWith<$Res>? get options {
    if (_self.options == null) {
    return null;
  }

  return $PushOptionsCopyWith<$Res>(_self.options!, (value) {
    return _then(_self.copyWith(options: value));
  });
}
}


/// Adds pattern-matching-related methods to [PushApiData].
extension PushApiDataPatterns on PushApiData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PushApiData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PushApiData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PushApiData value)  $default,){
final _that = this;
switch (_that) {
case _PushApiData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PushApiData value)?  $default,){
final _that = this;
switch (_that) {
case _PushApiData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PushToken? token,  ClientId? clientId,  AccountId? accountId,  PushOptions? options,  List<String>? addresses,  int? ts,  bool reset,  String? claim)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PushApiData() when $default != null:
return $default(_that.token,_that.clientId,_that.accountId,_that.options,_that.addresses,_that.ts,_that.reset,_that.claim);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PushToken? token,  ClientId? clientId,  AccountId? accountId,  PushOptions? options,  List<String>? addresses,  int? ts,  bool reset,  String? claim)  $default,) {final _that = this;
switch (_that) {
case _PushApiData():
return $default(_that.token,_that.clientId,_that.accountId,_that.options,_that.addresses,_that.ts,_that.reset,_that.claim);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PushToken? token,  ClientId? clientId,  AccountId? accountId,  PushOptions? options,  List<String>? addresses,  int? ts,  bool reset,  String? claim)?  $default,) {final _that = this;
switch (_that) {
case _PushApiData() when $default != null:
return $default(_that.token,_that.clientId,_that.accountId,_that.options,_that.addresses,_that.ts,_that.reset,_that.claim);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PushApiData implements PushApiData {
  const _PushApiData({this.token, this.clientId, this.accountId, this.options, final  List<String>? addresses, this.ts, this.reset = false, this.claim}): _addresses = addresses;
  factory _PushApiData.fromJson(Map<String, dynamic> json) => _$PushApiDataFromJson(json);

@override final  PushToken? token;
@override final  ClientId? clientId;
@override final  AccountId? accountId;
@override final  PushOptions? options;
 final  List<String>? _addresses;
@override List<String>? get addresses {
  final value = _addresses;
  if (value == null) return null;
  if (_addresses is EqualUnmodifiableListView) return _addresses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

// Unix milliseconds; part of the signed body, so the service can bound
// how long a captured request stays replayable.
@override final  int? ts;
// Unregisters this client entirely. Explicit, since a bare
// {token, clientId} is a registration.
@override@JsonKey() final  bool reset;
// Answers a claim challenge: the nonce the service pushed to whoever
// holds [token], proving this device is that holder.
@override final  String? claim;

/// Create a copy of PushApiData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PushApiDataCopyWith<_PushApiData> get copyWith => __$PushApiDataCopyWithImpl<_PushApiData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PushApiDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PushApiData&&(identical(other.token, token) || other.token == token)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.options, options) || other.options == options)&&const DeepCollectionEquality().equals(other._addresses, _addresses)&&(identical(other.ts, ts) || other.ts == ts)&&(identical(other.reset, reset) || other.reset == reset)&&(identical(other.claim, claim) || other.claim == claim));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,clientId,accountId,options,const DeepCollectionEquality().hash(_addresses),ts,reset,claim);

@override
String toString() {
  return 'PushApiData(token: $token, clientId: $clientId, accountId: $accountId, options: $options, addresses: $addresses, ts: $ts, reset: $reset, claim: $claim)';
}


}

/// @nodoc
abstract mixin class _$PushApiDataCopyWith<$Res> implements $PushApiDataCopyWith<$Res> {
  factory _$PushApiDataCopyWith(_PushApiData value, $Res Function(_PushApiData) _then) = __$PushApiDataCopyWithImpl;
@override @useResult
$Res call({
 PushToken? token, ClientId? clientId, AccountId? accountId, PushOptions? options, List<String>? addresses, int? ts, bool reset, String? claim
});


@override $PushOptionsCopyWith<$Res>? get options;

}
/// @nodoc
class __$PushApiDataCopyWithImpl<$Res>
    implements _$PushApiDataCopyWith<$Res> {
  __$PushApiDataCopyWithImpl(this._self, this._then);

  final _PushApiData _self;
  final $Res Function(_PushApiData) _then;

/// Create a copy of PushApiData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? token = freezed,Object? clientId = freezed,Object? accountId = freezed,Object? options = freezed,Object? addresses = freezed,Object? ts = freezed,Object? reset = null,Object? claim = freezed,}) {
  return _then(_PushApiData(
token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as PushToken?,clientId: freezed == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as ClientId?,accountId: freezed == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as AccountId?,options: freezed == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as PushOptions?,addresses: freezed == addresses ? _self._addresses : addresses // ignore: cast_nullable_to_non_nullable
as List<String>?,ts: freezed == ts ? _self.ts : ts // ignore: cast_nullable_to_non_nullable
as int?,reset: null == reset ? _self.reset : reset // ignore: cast_nullable_to_non_nullable
as bool,claim: freezed == claim ? _self.claim : claim // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of PushApiData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PushOptionsCopyWith<$Res>? get options {
    if (_self.options == null) {
    return null;
  }

  return $PushOptionsCopyWith<$Res>(_self.options!, (value) {
    return _then(_self.copyWith(options: value));
  });
}
}

// dart format on
