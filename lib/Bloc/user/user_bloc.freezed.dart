// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) updateProfilePatientRequest,
    required TResult Function() getProfileUserByIdRequest,
    required TResult Function(String fullName) getFullName,
    required TResult Function(String address) getAddress,
    required TResult Function() updateProfilePatientCheckRequested,
    required TResult Function() setStateFlase,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String userId)? updateProfilePatientRequest,
    TResult Function()? getProfileUserByIdRequest,
    TResult Function(String fullName)? getFullName,
    TResult Function(String address)? getAddress,
    TResult Function()? updateProfilePatientCheckRequested,
    TResult Function()? setStateFlase,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? updateProfilePatientRequest,
    TResult Function()? getProfileUserByIdRequest,
    TResult Function(String fullName)? getFullName,
    TResult Function(String address)? getAddress,
    TResult Function()? updateProfilePatientCheckRequested,
    TResult Function()? setStateFlase,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateProfilePatientRequest value)
        updateProfilePatientRequest,
    required TResult Function(_GetProfileUserByIdRequest value)
        getProfileUserByIdRequest,
    required TResult Function(_GetFullName value) getFullName,
    required TResult Function(_GetAddress value) getAddress,
    required TResult Function(_UpdateProfilePatientCheckRequested value)
        updateProfilePatientCheckRequested,
    required TResult Function(_SetStateFlase value) setStateFlase,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_UpdateProfilePatientRequest value)?
        updateProfilePatientRequest,
    TResult Function(_GetProfileUserByIdRequest value)?
        getProfileUserByIdRequest,
    TResult Function(_GetFullName value)? getFullName,
    TResult Function(_GetAddress value)? getAddress,
    TResult Function(_UpdateProfilePatientCheckRequested value)?
        updateProfilePatientCheckRequested,
    TResult Function(_SetStateFlase value)? setStateFlase,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateProfilePatientRequest value)?
        updateProfilePatientRequest,
    TResult Function(_GetProfileUserByIdRequest value)?
        getProfileUserByIdRequest,
    TResult Function(_GetFullName value)? getFullName,
    TResult Function(_GetAddress value)? getAddress,
    TResult Function(_UpdateProfilePatientCheckRequested value)?
        updateProfilePatientCheckRequested,
    TResult Function(_SetStateFlase value)? setStateFlase,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserEventCopyWith<$Res> {
  factory $UserEventCopyWith(UserEvent value, $Res Function(UserEvent) then) =
      _$UserEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$UserEventCopyWithImpl<$Res> implements $UserEventCopyWith<$Res> {
  _$UserEventCopyWithImpl(this._value, this._then);

  final UserEvent _value;
  // ignore: unused_field
  final $Res Function(UserEvent) _then;
}

/// @nodoc
abstract class _$$_UpdateProfilePatientRequestCopyWith<$Res> {
  factory _$$_UpdateProfilePatientRequestCopyWith(
          _$_UpdateProfilePatientRequest value,
          $Res Function(_$_UpdateProfilePatientRequest) then) =
      __$$_UpdateProfilePatientRequestCopyWithImpl<$Res>;
  $Res call({String userId});
}

/// @nodoc
class __$$_UpdateProfilePatientRequestCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res>
    implements _$$_UpdateProfilePatientRequestCopyWith<$Res> {
  __$$_UpdateProfilePatientRequestCopyWithImpl(
      _$_UpdateProfilePatientRequest _value,
      $Res Function(_$_UpdateProfilePatientRequest) _then)
      : super(_value, (v) => _then(v as _$_UpdateProfilePatientRequest));

  @override
  _$_UpdateProfilePatientRequest get _value =>
      super._value as _$_UpdateProfilePatientRequest;

  @override
  $Res call({
    Object? userId = freezed,
  }) {
    return _then(_$_UpdateProfilePatientRequest(
      userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UpdateProfilePatientRequest implements _UpdateProfilePatientRequest {
  const _$_UpdateProfilePatientRequest(this.userId);

  @override
  final String userId;

  @override
  String toString() {
    return 'UserEvent.updateProfilePatientRequest(userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateProfilePatientRequest &&
            const DeepCollectionEquality().equals(other.userId, userId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(userId));

  @JsonKey(ignore: true)
  @override
  _$$_UpdateProfilePatientRequestCopyWith<_$_UpdateProfilePatientRequest>
      get copyWith => __$$_UpdateProfilePatientRequestCopyWithImpl<
          _$_UpdateProfilePatientRequest>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) updateProfilePatientRequest,
    required TResult Function() getProfileUserByIdRequest,
    required TResult Function(String fullName) getFullName,
    required TResult Function(String address) getAddress,
    required TResult Function() updateProfilePatientCheckRequested,
    required TResult Function() setStateFlase,
  }) {
    return updateProfilePatientRequest(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String userId)? updateProfilePatientRequest,
    TResult Function()? getProfileUserByIdRequest,
    TResult Function(String fullName)? getFullName,
    TResult Function(String address)? getAddress,
    TResult Function()? updateProfilePatientCheckRequested,
    TResult Function()? setStateFlase,
  }) {
    return updateProfilePatientRequest?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? updateProfilePatientRequest,
    TResult Function()? getProfileUserByIdRequest,
    TResult Function(String fullName)? getFullName,
    TResult Function(String address)? getAddress,
    TResult Function()? updateProfilePatientCheckRequested,
    TResult Function()? setStateFlase,
    required TResult orElse(),
  }) {
    if (updateProfilePatientRequest != null) {
      return updateProfilePatientRequest(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateProfilePatientRequest value)
        updateProfilePatientRequest,
    required TResult Function(_GetProfileUserByIdRequest value)
        getProfileUserByIdRequest,
    required TResult Function(_GetFullName value) getFullName,
    required TResult Function(_GetAddress value) getAddress,
    required TResult Function(_UpdateProfilePatientCheckRequested value)
        updateProfilePatientCheckRequested,
    required TResult Function(_SetStateFlase value) setStateFlase,
  }) {
    return updateProfilePatientRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_UpdateProfilePatientRequest value)?
        updateProfilePatientRequest,
    TResult Function(_GetProfileUserByIdRequest value)?
        getProfileUserByIdRequest,
    TResult Function(_GetFullName value)? getFullName,
    TResult Function(_GetAddress value)? getAddress,
    TResult Function(_UpdateProfilePatientCheckRequested value)?
        updateProfilePatientCheckRequested,
    TResult Function(_SetStateFlase value)? setStateFlase,
  }) {
    return updateProfilePatientRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateProfilePatientRequest value)?
        updateProfilePatientRequest,
    TResult Function(_GetProfileUserByIdRequest value)?
        getProfileUserByIdRequest,
    TResult Function(_GetFullName value)? getFullName,
    TResult Function(_GetAddress value)? getAddress,
    TResult Function(_UpdateProfilePatientCheckRequested value)?
        updateProfilePatientCheckRequested,
    TResult Function(_SetStateFlase value)? setStateFlase,
    required TResult orElse(),
  }) {
    if (updateProfilePatientRequest != null) {
      return updateProfilePatientRequest(this);
    }
    return orElse();
  }
}

abstract class _UpdateProfilePatientRequest implements UserEvent {
  const factory _UpdateProfilePatientRequest(final String userId) =
      _$_UpdateProfilePatientRequest;

  String get userId;
  @JsonKey(ignore: true)
  _$$_UpdateProfilePatientRequestCopyWith<_$_UpdateProfilePatientRequest>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GetProfileUserByIdRequestCopyWith<$Res> {
  factory _$$_GetProfileUserByIdRequestCopyWith(
          _$_GetProfileUserByIdRequest value,
          $Res Function(_$_GetProfileUserByIdRequest) then) =
      __$$_GetProfileUserByIdRequestCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetProfileUserByIdRequestCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res>
    implements _$$_GetProfileUserByIdRequestCopyWith<$Res> {
  __$$_GetProfileUserByIdRequestCopyWithImpl(
      _$_GetProfileUserByIdRequest _value,
      $Res Function(_$_GetProfileUserByIdRequest) _then)
      : super(_value, (v) => _then(v as _$_GetProfileUserByIdRequest));

  @override
  _$_GetProfileUserByIdRequest get _value =>
      super._value as _$_GetProfileUserByIdRequest;
}

/// @nodoc

class _$_GetProfileUserByIdRequest implements _GetProfileUserByIdRequest {
  const _$_GetProfileUserByIdRequest();

  @override
  String toString() {
    return 'UserEvent.getProfileUserByIdRequest()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetProfileUserByIdRequest);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) updateProfilePatientRequest,
    required TResult Function() getProfileUserByIdRequest,
    required TResult Function(String fullName) getFullName,
    required TResult Function(String address) getAddress,
    required TResult Function() updateProfilePatientCheckRequested,
    required TResult Function() setStateFlase,
  }) {
    return getProfileUserByIdRequest();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String userId)? updateProfilePatientRequest,
    TResult Function()? getProfileUserByIdRequest,
    TResult Function(String fullName)? getFullName,
    TResult Function(String address)? getAddress,
    TResult Function()? updateProfilePatientCheckRequested,
    TResult Function()? setStateFlase,
  }) {
    return getProfileUserByIdRequest?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? updateProfilePatientRequest,
    TResult Function()? getProfileUserByIdRequest,
    TResult Function(String fullName)? getFullName,
    TResult Function(String address)? getAddress,
    TResult Function()? updateProfilePatientCheckRequested,
    TResult Function()? setStateFlase,
    required TResult orElse(),
  }) {
    if (getProfileUserByIdRequest != null) {
      return getProfileUserByIdRequest();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateProfilePatientRequest value)
        updateProfilePatientRequest,
    required TResult Function(_GetProfileUserByIdRequest value)
        getProfileUserByIdRequest,
    required TResult Function(_GetFullName value) getFullName,
    required TResult Function(_GetAddress value) getAddress,
    required TResult Function(_UpdateProfilePatientCheckRequested value)
        updateProfilePatientCheckRequested,
    required TResult Function(_SetStateFlase value) setStateFlase,
  }) {
    return getProfileUserByIdRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_UpdateProfilePatientRequest value)?
        updateProfilePatientRequest,
    TResult Function(_GetProfileUserByIdRequest value)?
        getProfileUserByIdRequest,
    TResult Function(_GetFullName value)? getFullName,
    TResult Function(_GetAddress value)? getAddress,
    TResult Function(_UpdateProfilePatientCheckRequested value)?
        updateProfilePatientCheckRequested,
    TResult Function(_SetStateFlase value)? setStateFlase,
  }) {
    return getProfileUserByIdRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateProfilePatientRequest value)?
        updateProfilePatientRequest,
    TResult Function(_GetProfileUserByIdRequest value)?
        getProfileUserByIdRequest,
    TResult Function(_GetFullName value)? getFullName,
    TResult Function(_GetAddress value)? getAddress,
    TResult Function(_UpdateProfilePatientCheckRequested value)?
        updateProfilePatientCheckRequested,
    TResult Function(_SetStateFlase value)? setStateFlase,
    required TResult orElse(),
  }) {
    if (getProfileUserByIdRequest != null) {
      return getProfileUserByIdRequest(this);
    }
    return orElse();
  }
}

abstract class _GetProfileUserByIdRequest implements UserEvent {
  const factory _GetProfileUserByIdRequest() = _$_GetProfileUserByIdRequest;
}

/// @nodoc
abstract class _$$_GetFullNameCopyWith<$Res> {
  factory _$$_GetFullNameCopyWith(
          _$_GetFullName value, $Res Function(_$_GetFullName) then) =
      __$$_GetFullNameCopyWithImpl<$Res>;
  $Res call({String fullName});
}

/// @nodoc
class __$$_GetFullNameCopyWithImpl<$Res> extends _$UserEventCopyWithImpl<$Res>
    implements _$$_GetFullNameCopyWith<$Res> {
  __$$_GetFullNameCopyWithImpl(
      _$_GetFullName _value, $Res Function(_$_GetFullName) _then)
      : super(_value, (v) => _then(v as _$_GetFullName));

  @override
  _$_GetFullName get _value => super._value as _$_GetFullName;

  @override
  $Res call({
    Object? fullName = freezed,
  }) {
    return _then(_$_GetFullName(
      fullName == freezed
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GetFullName implements _GetFullName {
  const _$_GetFullName(this.fullName);

  @override
  final String fullName;

  @override
  String toString() {
    return 'UserEvent.getFullName(fullName: $fullName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetFullName &&
            const DeepCollectionEquality().equals(other.fullName, fullName));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(fullName));

  @JsonKey(ignore: true)
  @override
  _$$_GetFullNameCopyWith<_$_GetFullName> get copyWith =>
      __$$_GetFullNameCopyWithImpl<_$_GetFullName>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) updateProfilePatientRequest,
    required TResult Function() getProfileUserByIdRequest,
    required TResult Function(String fullName) getFullName,
    required TResult Function(String address) getAddress,
    required TResult Function() updateProfilePatientCheckRequested,
    required TResult Function() setStateFlase,
  }) {
    return getFullName(fullName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String userId)? updateProfilePatientRequest,
    TResult Function()? getProfileUserByIdRequest,
    TResult Function(String fullName)? getFullName,
    TResult Function(String address)? getAddress,
    TResult Function()? updateProfilePatientCheckRequested,
    TResult Function()? setStateFlase,
  }) {
    return getFullName?.call(fullName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? updateProfilePatientRequest,
    TResult Function()? getProfileUserByIdRequest,
    TResult Function(String fullName)? getFullName,
    TResult Function(String address)? getAddress,
    TResult Function()? updateProfilePatientCheckRequested,
    TResult Function()? setStateFlase,
    required TResult orElse(),
  }) {
    if (getFullName != null) {
      return getFullName(fullName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateProfilePatientRequest value)
        updateProfilePatientRequest,
    required TResult Function(_GetProfileUserByIdRequest value)
        getProfileUserByIdRequest,
    required TResult Function(_GetFullName value) getFullName,
    required TResult Function(_GetAddress value) getAddress,
    required TResult Function(_UpdateProfilePatientCheckRequested value)
        updateProfilePatientCheckRequested,
    required TResult Function(_SetStateFlase value) setStateFlase,
  }) {
    return getFullName(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_UpdateProfilePatientRequest value)?
        updateProfilePatientRequest,
    TResult Function(_GetProfileUserByIdRequest value)?
        getProfileUserByIdRequest,
    TResult Function(_GetFullName value)? getFullName,
    TResult Function(_GetAddress value)? getAddress,
    TResult Function(_UpdateProfilePatientCheckRequested value)?
        updateProfilePatientCheckRequested,
    TResult Function(_SetStateFlase value)? setStateFlase,
  }) {
    return getFullName?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateProfilePatientRequest value)?
        updateProfilePatientRequest,
    TResult Function(_GetProfileUserByIdRequest value)?
        getProfileUserByIdRequest,
    TResult Function(_GetFullName value)? getFullName,
    TResult Function(_GetAddress value)? getAddress,
    TResult Function(_UpdateProfilePatientCheckRequested value)?
        updateProfilePatientCheckRequested,
    TResult Function(_SetStateFlase value)? setStateFlase,
    required TResult orElse(),
  }) {
    if (getFullName != null) {
      return getFullName(this);
    }
    return orElse();
  }
}

abstract class _GetFullName implements UserEvent {
  const factory _GetFullName(final String fullName) = _$_GetFullName;

  String get fullName;
  @JsonKey(ignore: true)
  _$$_GetFullNameCopyWith<_$_GetFullName> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GetAddressCopyWith<$Res> {
  factory _$$_GetAddressCopyWith(
          _$_GetAddress value, $Res Function(_$_GetAddress) then) =
      __$$_GetAddressCopyWithImpl<$Res>;
  $Res call({String address});
}

/// @nodoc
class __$$_GetAddressCopyWithImpl<$Res> extends _$UserEventCopyWithImpl<$Res>
    implements _$$_GetAddressCopyWith<$Res> {
  __$$_GetAddressCopyWithImpl(
      _$_GetAddress _value, $Res Function(_$_GetAddress) _then)
      : super(_value, (v) => _then(v as _$_GetAddress));

  @override
  _$_GetAddress get _value => super._value as _$_GetAddress;

  @override
  $Res call({
    Object? address = freezed,
  }) {
    return _then(_$_GetAddress(
      address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GetAddress implements _GetAddress {
  const _$_GetAddress(this.address);

  @override
  final String address;

  @override
  String toString() {
    return 'UserEvent.getAddress(address: $address)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetAddress &&
            const DeepCollectionEquality().equals(other.address, address));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(address));

  @JsonKey(ignore: true)
  @override
  _$$_GetAddressCopyWith<_$_GetAddress> get copyWith =>
      __$$_GetAddressCopyWithImpl<_$_GetAddress>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) updateProfilePatientRequest,
    required TResult Function() getProfileUserByIdRequest,
    required TResult Function(String fullName) getFullName,
    required TResult Function(String address) getAddress,
    required TResult Function() updateProfilePatientCheckRequested,
    required TResult Function() setStateFlase,
  }) {
    return getAddress(address);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String userId)? updateProfilePatientRequest,
    TResult Function()? getProfileUserByIdRequest,
    TResult Function(String fullName)? getFullName,
    TResult Function(String address)? getAddress,
    TResult Function()? updateProfilePatientCheckRequested,
    TResult Function()? setStateFlase,
  }) {
    return getAddress?.call(address);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? updateProfilePatientRequest,
    TResult Function()? getProfileUserByIdRequest,
    TResult Function(String fullName)? getFullName,
    TResult Function(String address)? getAddress,
    TResult Function()? updateProfilePatientCheckRequested,
    TResult Function()? setStateFlase,
    required TResult orElse(),
  }) {
    if (getAddress != null) {
      return getAddress(address);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateProfilePatientRequest value)
        updateProfilePatientRequest,
    required TResult Function(_GetProfileUserByIdRequest value)
        getProfileUserByIdRequest,
    required TResult Function(_GetFullName value) getFullName,
    required TResult Function(_GetAddress value) getAddress,
    required TResult Function(_UpdateProfilePatientCheckRequested value)
        updateProfilePatientCheckRequested,
    required TResult Function(_SetStateFlase value) setStateFlase,
  }) {
    return getAddress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_UpdateProfilePatientRequest value)?
        updateProfilePatientRequest,
    TResult Function(_GetProfileUserByIdRequest value)?
        getProfileUserByIdRequest,
    TResult Function(_GetFullName value)? getFullName,
    TResult Function(_GetAddress value)? getAddress,
    TResult Function(_UpdateProfilePatientCheckRequested value)?
        updateProfilePatientCheckRequested,
    TResult Function(_SetStateFlase value)? setStateFlase,
  }) {
    return getAddress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateProfilePatientRequest value)?
        updateProfilePatientRequest,
    TResult Function(_GetProfileUserByIdRequest value)?
        getProfileUserByIdRequest,
    TResult Function(_GetFullName value)? getFullName,
    TResult Function(_GetAddress value)? getAddress,
    TResult Function(_UpdateProfilePatientCheckRequested value)?
        updateProfilePatientCheckRequested,
    TResult Function(_SetStateFlase value)? setStateFlase,
    required TResult orElse(),
  }) {
    if (getAddress != null) {
      return getAddress(this);
    }
    return orElse();
  }
}

abstract class _GetAddress implements UserEvent {
  const factory _GetAddress(final String address) = _$_GetAddress;

  String get address;
  @JsonKey(ignore: true)
  _$$_GetAddressCopyWith<_$_GetAddress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UpdateProfilePatientCheckRequestedCopyWith<$Res> {
  factory _$$_UpdateProfilePatientCheckRequestedCopyWith(
          _$_UpdateProfilePatientCheckRequested value,
          $Res Function(_$_UpdateProfilePatientCheckRequested) then) =
      __$$_UpdateProfilePatientCheckRequestedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_UpdateProfilePatientCheckRequestedCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res>
    implements _$$_UpdateProfilePatientCheckRequestedCopyWith<$Res> {
  __$$_UpdateProfilePatientCheckRequestedCopyWithImpl(
      _$_UpdateProfilePatientCheckRequested _value,
      $Res Function(_$_UpdateProfilePatientCheckRequested) _then)
      : super(_value, (v) => _then(v as _$_UpdateProfilePatientCheckRequested));

  @override
  _$_UpdateProfilePatientCheckRequested get _value =>
      super._value as _$_UpdateProfilePatientCheckRequested;
}

/// @nodoc

class _$_UpdateProfilePatientCheckRequested
    implements _UpdateProfilePatientCheckRequested {
  const _$_UpdateProfilePatientCheckRequested();

  @override
  String toString() {
    return 'UserEvent.updateProfilePatientCheckRequested()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateProfilePatientCheckRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) updateProfilePatientRequest,
    required TResult Function() getProfileUserByIdRequest,
    required TResult Function(String fullName) getFullName,
    required TResult Function(String address) getAddress,
    required TResult Function() updateProfilePatientCheckRequested,
    required TResult Function() setStateFlase,
  }) {
    return updateProfilePatientCheckRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String userId)? updateProfilePatientRequest,
    TResult Function()? getProfileUserByIdRequest,
    TResult Function(String fullName)? getFullName,
    TResult Function(String address)? getAddress,
    TResult Function()? updateProfilePatientCheckRequested,
    TResult Function()? setStateFlase,
  }) {
    return updateProfilePatientCheckRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? updateProfilePatientRequest,
    TResult Function()? getProfileUserByIdRequest,
    TResult Function(String fullName)? getFullName,
    TResult Function(String address)? getAddress,
    TResult Function()? updateProfilePatientCheckRequested,
    TResult Function()? setStateFlase,
    required TResult orElse(),
  }) {
    if (updateProfilePatientCheckRequested != null) {
      return updateProfilePatientCheckRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateProfilePatientRequest value)
        updateProfilePatientRequest,
    required TResult Function(_GetProfileUserByIdRequest value)
        getProfileUserByIdRequest,
    required TResult Function(_GetFullName value) getFullName,
    required TResult Function(_GetAddress value) getAddress,
    required TResult Function(_UpdateProfilePatientCheckRequested value)
        updateProfilePatientCheckRequested,
    required TResult Function(_SetStateFlase value) setStateFlase,
  }) {
    return updateProfilePatientCheckRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_UpdateProfilePatientRequest value)?
        updateProfilePatientRequest,
    TResult Function(_GetProfileUserByIdRequest value)?
        getProfileUserByIdRequest,
    TResult Function(_GetFullName value)? getFullName,
    TResult Function(_GetAddress value)? getAddress,
    TResult Function(_UpdateProfilePatientCheckRequested value)?
        updateProfilePatientCheckRequested,
    TResult Function(_SetStateFlase value)? setStateFlase,
  }) {
    return updateProfilePatientCheckRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateProfilePatientRequest value)?
        updateProfilePatientRequest,
    TResult Function(_GetProfileUserByIdRequest value)?
        getProfileUserByIdRequest,
    TResult Function(_GetFullName value)? getFullName,
    TResult Function(_GetAddress value)? getAddress,
    TResult Function(_UpdateProfilePatientCheckRequested value)?
        updateProfilePatientCheckRequested,
    TResult Function(_SetStateFlase value)? setStateFlase,
    required TResult orElse(),
  }) {
    if (updateProfilePatientCheckRequested != null) {
      return updateProfilePatientCheckRequested(this);
    }
    return orElse();
  }
}

abstract class _UpdateProfilePatientCheckRequested implements UserEvent {
  const factory _UpdateProfilePatientCheckRequested() =
      _$_UpdateProfilePatientCheckRequested;
}

/// @nodoc
abstract class _$$_SetStateFlaseCopyWith<$Res> {
  factory _$$_SetStateFlaseCopyWith(
          _$_SetStateFlase value, $Res Function(_$_SetStateFlase) then) =
      __$$_SetStateFlaseCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SetStateFlaseCopyWithImpl<$Res> extends _$UserEventCopyWithImpl<$Res>
    implements _$$_SetStateFlaseCopyWith<$Res> {
  __$$_SetStateFlaseCopyWithImpl(
      _$_SetStateFlase _value, $Res Function(_$_SetStateFlase) _then)
      : super(_value, (v) => _then(v as _$_SetStateFlase));

  @override
  _$_SetStateFlase get _value => super._value as _$_SetStateFlase;
}

/// @nodoc

class _$_SetStateFlase implements _SetStateFlase {
  const _$_SetStateFlase();

  @override
  String toString() {
    return 'UserEvent.setStateFlase()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_SetStateFlase);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) updateProfilePatientRequest,
    required TResult Function() getProfileUserByIdRequest,
    required TResult Function(String fullName) getFullName,
    required TResult Function(String address) getAddress,
    required TResult Function() updateProfilePatientCheckRequested,
    required TResult Function() setStateFlase,
  }) {
    return setStateFlase();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String userId)? updateProfilePatientRequest,
    TResult Function()? getProfileUserByIdRequest,
    TResult Function(String fullName)? getFullName,
    TResult Function(String address)? getAddress,
    TResult Function()? updateProfilePatientCheckRequested,
    TResult Function()? setStateFlase,
  }) {
    return setStateFlase?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? updateProfilePatientRequest,
    TResult Function()? getProfileUserByIdRequest,
    TResult Function(String fullName)? getFullName,
    TResult Function(String address)? getAddress,
    TResult Function()? updateProfilePatientCheckRequested,
    TResult Function()? setStateFlase,
    required TResult orElse(),
  }) {
    if (setStateFlase != null) {
      return setStateFlase();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateProfilePatientRequest value)
        updateProfilePatientRequest,
    required TResult Function(_GetProfileUserByIdRequest value)
        getProfileUserByIdRequest,
    required TResult Function(_GetFullName value) getFullName,
    required TResult Function(_GetAddress value) getAddress,
    required TResult Function(_UpdateProfilePatientCheckRequested value)
        updateProfilePatientCheckRequested,
    required TResult Function(_SetStateFlase value) setStateFlase,
  }) {
    return setStateFlase(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_UpdateProfilePatientRequest value)?
        updateProfilePatientRequest,
    TResult Function(_GetProfileUserByIdRequest value)?
        getProfileUserByIdRequest,
    TResult Function(_GetFullName value)? getFullName,
    TResult Function(_GetAddress value)? getAddress,
    TResult Function(_UpdateProfilePatientCheckRequested value)?
        updateProfilePatientCheckRequested,
    TResult Function(_SetStateFlase value)? setStateFlase,
  }) {
    return setStateFlase?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateProfilePatientRequest value)?
        updateProfilePatientRequest,
    TResult Function(_GetProfileUserByIdRequest value)?
        getProfileUserByIdRequest,
    TResult Function(_GetFullName value)? getFullName,
    TResult Function(_GetAddress value)? getAddress,
    TResult Function(_UpdateProfilePatientCheckRequested value)?
        updateProfilePatientCheckRequested,
    TResult Function(_SetStateFlase value)? setStateFlase,
    required TResult orElse(),
  }) {
    if (setStateFlase != null) {
      return setStateFlase(this);
    }
    return orElse();
  }
}

abstract class _SetStateFlase implements UserEvent {
  const factory _SetStateFlase() = _$_SetStateFlase;
}

/// @nodoc
mixin _$UserState {
  String get userId => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  bool get isUpdatedProfilePatient => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  bool? get success => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserStateCopyWith<UserState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStateCopyWith<$Res> {
  factory $UserStateCopyWith(UserState value, $Res Function(UserState) then) =
      _$UserStateCopyWithImpl<$Res>;
  $Res call(
      {String userId,
      String fullName,
      String address,
      bool isUpdatedProfilePatient,
      String? errorMessage,
      bool? success,
      String? message});
}

/// @nodoc
class _$UserStateCopyWithImpl<$Res> implements $UserStateCopyWith<$Res> {
  _$UserStateCopyWithImpl(this._value, this._then);

  final UserState _value;
  // ignore: unused_field
  final $Res Function(UserState) _then;

  @override
  $Res call({
    Object? userId = freezed,
    Object? fullName = freezed,
    Object? address = freezed,
    Object? isUpdatedProfilePatient = freezed,
    Object? errorMessage = freezed,
    Object? success = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: fullName == freezed
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      isUpdatedProfilePatient: isUpdatedProfilePatient == freezed
          ? _value.isUpdatedProfilePatient
          : isUpdatedProfilePatient // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      success: success == freezed
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_UserStateCopyWith<$Res> implements $UserStateCopyWith<$Res> {
  factory _$$_UserStateCopyWith(
          _$_UserState value, $Res Function(_$_UserState) then) =
      __$$_UserStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String userId,
      String fullName,
      String address,
      bool isUpdatedProfilePatient,
      String? errorMessage,
      bool? success,
      String? message});
}

/// @nodoc
class __$$_UserStateCopyWithImpl<$Res> extends _$UserStateCopyWithImpl<$Res>
    implements _$$_UserStateCopyWith<$Res> {
  __$$_UserStateCopyWithImpl(
      _$_UserState _value, $Res Function(_$_UserState) _then)
      : super(_value, (v) => _then(v as _$_UserState));

  @override
  _$_UserState get _value => super._value as _$_UserState;

  @override
  $Res call({
    Object? userId = freezed,
    Object? fullName = freezed,
    Object? address = freezed,
    Object? isUpdatedProfilePatient = freezed,
    Object? errorMessage = freezed,
    Object? success = freezed,
    Object? message = freezed,
  }) {
    return _then(_$_UserState(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: fullName == freezed
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      isUpdatedProfilePatient: isUpdatedProfilePatient == freezed
          ? _value.isUpdatedProfilePatient
          : isUpdatedProfilePatient // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      success: success == freezed
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_UserState implements _UserState {
  const _$_UserState(
      {required this.userId,
      required this.fullName,
      required this.address,
      required this.isUpdatedProfilePatient,
      this.errorMessage,
      this.success,
      this.message});

  @override
  final String userId;
  @override
  final String fullName;
  @override
  final String address;
  @override
  final bool isUpdatedProfilePatient;
  @override
  final String? errorMessage;
  @override
  final bool? success;
  @override
  final String? message;

  @override
  String toString() {
    return 'UserState(userId: $userId, fullName: $fullName, address: $address, isUpdatedProfilePatient: $isUpdatedProfilePatient, errorMessage: $errorMessage, success: $success, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserState &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.fullName, fullName) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality().equals(
                other.isUpdatedProfilePatient, isUpdatedProfilePatient) &&
            const DeepCollectionEquality()
                .equals(other.errorMessage, errorMessage) &&
            const DeepCollectionEquality().equals(other.success, success) &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(fullName),
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(isUpdatedProfilePatient),
      const DeepCollectionEquality().hash(errorMessage),
      const DeepCollectionEquality().hash(success),
      const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$_UserStateCopyWith<_$_UserState> get copyWith =>
      __$$_UserStateCopyWithImpl<_$_UserState>(this, _$identity);
}

abstract class _UserState implements UserState {
  const factory _UserState(
      {required final String userId,
      required final String fullName,
      required final String address,
      required final bool isUpdatedProfilePatient,
      final String? errorMessage,
      final bool? success,
      final String? message}) = _$_UserState;

  @override
  String get userId;
  @override
  String get fullName;
  @override
  String get address;
  @override
  bool get isUpdatedProfilePatient;
  @override
  String? get errorMessage;
  @override
  bool? get success;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$_UserStateCopyWith<_$_UserState> get copyWith =>
      throw _privateConstructorUsedError;
}
