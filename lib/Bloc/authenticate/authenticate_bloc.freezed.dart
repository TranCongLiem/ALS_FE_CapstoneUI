// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'authenticate_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthenticateEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber) phoneNumberChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function() loginRequested,
    required TResult Function(String phoneNumber, String password)
        registrationPatientRequested,
    required TResult Function(String phoneNumber, String password)
        registrationSupporterRequested,
    required TResult Function() authCheckRequested,

    required TResult Function() Logout,

    required TResult Function() checkRegisterPatientRequested,
    required TResult Function() checkRegisterSupporterRequested,
    required TResult Function(String phoneNumber) phoneNumberChangedPatient,
    required TResult Function(String password) passwordChangedPatient,
    required TResult Function(String phoneNumber) phoneNumberChangedSupporter,
    required TResult Function(String password) passwordChangedSupporter,

  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String phoneNumber)? phoneNumberChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? loginRequested,
    TResult Function(String phoneNumber, String password)?
        registrationPatientRequested,
    TResult Function(String phoneNumber, String password)?
        registrationSupporterRequested,
    TResult Function()? authCheckRequested,

    TResult Function()? Logout,

    TResult Function()? checkRegisterPatientRequested,
    TResult Function()? checkRegisterSupporterRequested,
    TResult Function(String phoneNumber)? phoneNumberChangedPatient,
    TResult Function(String password)? passwordChangedPatient,
    TResult Function(String phoneNumber)? phoneNumberChangedSupporter,
    TResult Function(String password)? passwordChangedSupporter,

  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber)? phoneNumberChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? loginRequested,
    TResult Function(String phoneNumber, String password)?
        registrationPatientRequested,
    TResult Function(String phoneNumber, String password)?
        registrationSupporterRequested,
    TResult Function()? authCheckRequested,

    TResult Function()? Logout,

    TResult Function()? checkRegisterPatientRequested,
    TResult Function()? checkRegisterSupporterRequested,
    TResult Function(String phoneNumber)? phoneNumberChangedPatient,
    TResult Function(String password)? passwordChangedPatient,
    TResult Function(String phoneNumber)? phoneNumberChangedSupporter,
    TResult Function(String password)? passwordChangedSupporter,

    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PhoneNumberChanged value) phoneNumberChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_LoginRequested value) loginRequested,
    required TResult Function(_RegistrationPatientRequested value)
        registrationPatientRequested,
    required TResult Function(_RegistrationSupporterRequested value)
        registrationSupporterRequested,
    required TResult Function(_AuthCheckRequested value) authCheckRequested,

    required TResult Function(_LogoutRequested value) Logout,

    required TResult Function(_checkRegisterPatientRequested value)
        checkRegisterPatientRequested,
    required TResult Function(_checkRegisterSupporterRequested value)
        checkRegisterSupporterRequested,
    required TResult Function(_PhoneNumberChangedPatient value)
        phoneNumberChangedPatient,
    required TResult Function(_PasswordChangedPatient value)
        passwordChangedPatient,
    required TResult Function(_PhoneNumberChangedSupporter value)
        phoneNumberChangedSupporter,
    required TResult Function(_PasswordChangedSupporter value)
        passwordChangedSupporter,

  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PhoneNumberChanged value)? phoneNumberChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_LoginRequested value)? loginRequested,
    TResult Function(_RegistrationPatientRequested value)?
        registrationPatientRequested,
    TResult Function(_RegistrationSupporterRequested value)?
        registrationSupporterRequested,
    TResult Function(_AuthCheckRequested value)? authCheckRequested,

    TResult Function(_LogoutRequested value)? Logout,

    TResult Function(_checkRegisterPatientRequested value)?
        checkRegisterPatientRequested,
    TResult Function(_checkRegisterSupporterRequested value)?
        checkRegisterSupporterRequested,
    TResult Function(_PhoneNumberChangedPatient value)?
        phoneNumberChangedPatient,
    TResult Function(_PasswordChangedPatient value)? passwordChangedPatient,
    TResult Function(_PhoneNumberChangedSupporter value)?
        phoneNumberChangedSupporter,
    TResult Function(_PasswordChangedSupporter value)? passwordChangedSupporter,

  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PhoneNumberChanged value)? phoneNumberChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_LoginRequested value)? loginRequested,
    TResult Function(_RegistrationPatientRequested value)?
        registrationPatientRequested,
    TResult Function(_RegistrationSupporterRequested value)?
        registrationSupporterRequested,
    TResult Function(_AuthCheckRequested value)? authCheckRequested,

    TResult Function(_LogoutRequested value)? Logout,

    TResult Function(_checkRegisterPatientRequested value)?
        checkRegisterPatientRequested,
    TResult Function(_checkRegisterSupporterRequested value)?
        checkRegisterSupporterRequested,
    TResult Function(_PhoneNumberChangedPatient value)?
        phoneNumberChangedPatient,
    TResult Function(_PasswordChangedPatient value)? passwordChangedPatient,
    TResult Function(_PhoneNumberChangedSupporter value)?
        phoneNumberChangedSupporter,
    TResult Function(_PasswordChangedSupporter value)? passwordChangedSupporter,

    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticateEventCopyWith<$Res> {
  factory $AuthenticateEventCopyWith(
          AuthenticateEvent value, $Res Function(AuthenticateEvent) then) =
      _$AuthenticateEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthenticateEventCopyWithImpl<$Res>
    implements $AuthenticateEventCopyWith<$Res> {
  _$AuthenticateEventCopyWithImpl(this._value, this._then);

  final AuthenticateEvent _value;
  // ignore: unused_field
  final $Res Function(AuthenticateEvent) _then;
}

/// @nodoc
abstract class _$$_PhoneNumberChangedCopyWith<$Res> {
  factory _$$_PhoneNumberChangedCopyWith(_$_PhoneNumberChanged value,
          $Res Function(_$_PhoneNumberChanged) then) =
      __$$_PhoneNumberChangedCopyWithImpl<$Res>;
  $Res call({String phoneNumber});
}

/// @nodoc
class __$$_PhoneNumberChangedCopyWithImpl<$Res>
    extends _$AuthenticateEventCopyWithImpl<$Res>
    implements _$$_PhoneNumberChangedCopyWith<$Res> {
  __$$_PhoneNumberChangedCopyWithImpl(
      _$_PhoneNumberChanged _value, $Res Function(_$_PhoneNumberChanged) _then)
      : super(_value, (v) => _then(v as _$_PhoneNumberChanged));

  @override
  _$_PhoneNumberChanged get _value => super._value as _$_PhoneNumberChanged;

  @override
  $Res call({
    Object? phoneNumber = freezed,
  }) {
    return _then(_$_PhoneNumberChanged(
      phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_PhoneNumberChanged implements _PhoneNumberChanged {
  const _$_PhoneNumberChanged(this.phoneNumber);

  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'AuthenticateEvent.phoneNumberChanged(phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PhoneNumberChanged &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(phoneNumber));

  @JsonKey(ignore: true)
  @override
  _$$_PhoneNumberChangedCopyWith<_$_PhoneNumberChanged> get copyWith =>
      __$$_PhoneNumberChangedCopyWithImpl<_$_PhoneNumberChanged>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber) phoneNumberChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function() loginRequested,
    required TResult Function(String phoneNumber, String password)
        registrationPatientRequested,
    required TResult Function(String phoneNumber, String password)
        registrationSupporterRequested,
    required TResult Function() authCheckRequested,

    required TResult Function() Logout,

    required TResult Function() checkRegisterPatientRequested,
    required TResult Function() checkRegisterSupporterRequested,
    required TResult Function(String phoneNumber) phoneNumberChangedPatient,
    required TResult Function(String password) passwordChangedPatient,
    required TResult Function(String phoneNumber) phoneNumberChangedSupporter,
    required TResult Function(String password) passwordChangedSupporter,

  }) {
    return phoneNumberChanged(phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String phoneNumber)? phoneNumberChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? loginRequested,
    TResult Function(String phoneNumber, String password)?
        registrationPatientRequested,
    TResult Function(String phoneNumber, String password)?
        registrationSupporterRequested,
    TResult Function()? authCheckRequested,

    TResult Function()? Logout,

    TResult Function()? checkRegisterPatientRequested,
    TResult Function()? checkRegisterSupporterRequested,
    TResult Function(String phoneNumber)? phoneNumberChangedPatient,
    TResult Function(String password)? passwordChangedPatient,
    TResult Function(String phoneNumber)? phoneNumberChangedSupporter,
    TResult Function(String password)? passwordChangedSupporter,

  }) {
    return phoneNumberChanged?.call(phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber)? phoneNumberChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? loginRequested,
    TResult Function(String phoneNumber, String password)?
        registrationPatientRequested,
    TResult Function(String phoneNumber, String password)?
        registrationSupporterRequested,
    TResult Function()? authCheckRequested,

    TResult Function()? Logout,

    TResult Function()? checkRegisterPatientRequested,
    TResult Function()? checkRegisterSupporterRequested,
    TResult Function(String phoneNumber)? phoneNumberChangedPatient,
    TResult Function(String password)? passwordChangedPatient,
    TResult Function(String phoneNumber)? phoneNumberChangedSupporter,
    TResult Function(String password)? passwordChangedSupporter,

    required TResult orElse(),
  }) {
    if (phoneNumberChanged != null) {
      return phoneNumberChanged(phoneNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PhoneNumberChanged value) phoneNumberChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_LoginRequested value) loginRequested,
    required TResult Function(_RegistrationPatientRequested value)
        registrationPatientRequested,
    required TResult Function(_RegistrationSupporterRequested value)
        registrationSupporterRequested,
    required TResult Function(_AuthCheckRequested value) authCheckRequested,

    required TResult Function(_LogoutRequested value) Logout,

    required TResult Function(_checkRegisterPatientRequested value)
        checkRegisterPatientRequested,
    required TResult Function(_checkRegisterSupporterRequested value)
        checkRegisterSupporterRequested,
    required TResult Function(_PhoneNumberChangedPatient value)
        phoneNumberChangedPatient,
    required TResult Function(_PasswordChangedPatient value)
        passwordChangedPatient,
    required TResult Function(_PhoneNumberChangedSupporter value)
        phoneNumberChangedSupporter,
    required TResult Function(_PasswordChangedSupporter value)
        passwordChangedSupporter,

  }) {
    return phoneNumberChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PhoneNumberChanged value)? phoneNumberChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_LoginRequested value)? loginRequested,
    TResult Function(_RegistrationPatientRequested value)?
        registrationPatientRequested,
    TResult Function(_RegistrationSupporterRequested value)?
        registrationSupporterRequested,
    TResult Function(_AuthCheckRequested value)? authCheckRequested,

    TResult Function(_LogoutRequested value)? Logout,

    TResult Function(_checkRegisterPatientRequested value)?
        checkRegisterPatientRequested,
    TResult Function(_checkRegisterSupporterRequested value)?
        checkRegisterSupporterRequested,
    TResult Function(_PhoneNumberChangedPatient value)?
        phoneNumberChangedPatient,
    TResult Function(_PasswordChangedPatient value)? passwordChangedPatient,
    TResult Function(_PhoneNumberChangedSupporter value)?
        phoneNumberChangedSupporter,
    TResult Function(_PasswordChangedSupporter value)? passwordChangedSupporter,

  }) {
    return phoneNumberChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PhoneNumberChanged value)? phoneNumberChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_LoginRequested value)? loginRequested,
    TResult Function(_RegistrationPatientRequested value)?
        registrationPatientRequested,
    TResult Function(_RegistrationSupporterRequested value)?
        registrationSupporterRequested,
    TResult Function(_AuthCheckRequested value)? authCheckRequested,

    TResult Function(_LogoutRequested value)? Logout,

    TResult Function(_checkRegisterPatientRequested value)?
        checkRegisterPatientRequested,
    TResult Function(_checkRegisterSupporterRequested value)?
        checkRegisterSupporterRequested,
    TResult Function(_PhoneNumberChangedPatient value)?
        phoneNumberChangedPatient,
    TResult Function(_PasswordChangedPatient value)? passwordChangedPatient,
    TResult Function(_PhoneNumberChangedSupporter value)?
        phoneNumberChangedSupporter,
    TResult Function(_PasswordChangedSupporter value)? passwordChangedSupporter,

    required TResult orElse(),
  }) {
    if (phoneNumberChanged != null) {
      return phoneNumberChanged(this);
    }
    return orElse();
  }
}

abstract class _PhoneNumberChanged implements AuthenticateEvent {
  const factory _PhoneNumberChanged(final String phoneNumber) =
      _$_PhoneNumberChanged;

  String get phoneNumber;
  @JsonKey(ignore: true)
  _$$_PhoneNumberChangedCopyWith<_$_PhoneNumberChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_PasswordChangedCopyWith<$Res> {
  factory _$$_PasswordChangedCopyWith(
          _$_PasswordChanged value, $Res Function(_$_PasswordChanged) then) =
      __$$_PasswordChangedCopyWithImpl<$Res>;
  $Res call({String password});
}

/// @nodoc
class __$$_PasswordChangedCopyWithImpl<$Res>
    extends _$AuthenticateEventCopyWithImpl<$Res>
    implements _$$_PasswordChangedCopyWith<$Res> {
  __$$_PasswordChangedCopyWithImpl(
      _$_PasswordChanged _value, $Res Function(_$_PasswordChanged) _then)
      : super(_value, (v) => _then(v as _$_PasswordChanged));

  @override
  _$_PasswordChanged get _value => super._value as _$_PasswordChanged;

  @override
  $Res call({
    Object? password = freezed,
  }) {
    return _then(_$_PasswordChanged(
      password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_PasswordChanged implements _PasswordChanged {
  const _$_PasswordChanged(this.password);

  @override
  final String password;

  @override
  String toString() {
    return 'AuthenticateEvent.passwordChanged(password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PasswordChanged &&
            const DeepCollectionEquality().equals(other.password, password));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(password));

  @JsonKey(ignore: true)
  @override
  _$$_PasswordChangedCopyWith<_$_PasswordChanged> get copyWith =>
      __$$_PasswordChangedCopyWithImpl<_$_PasswordChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber) phoneNumberChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function() loginRequested,
    required TResult Function(String phoneNumber, String password)
        registrationPatientRequested,
    required TResult Function(String phoneNumber, String password)
        registrationSupporterRequested,
    required TResult Function() authCheckRequested,

    required TResult Function() Logout,

    required TResult Function() checkRegisterPatientRequested,
    required TResult Function() checkRegisterSupporterRequested,
    required TResult Function(String phoneNumber) phoneNumberChangedPatient,
    required TResult Function(String password) passwordChangedPatient,
    required TResult Function(String phoneNumber) phoneNumberChangedSupporter,
    required TResult Function(String password) passwordChangedSupporter,

  }) {
    return passwordChanged(password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String phoneNumber)? phoneNumberChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? loginRequested,
    TResult Function(String phoneNumber, String password)?
        registrationPatientRequested,
    TResult Function(String phoneNumber, String password)?
        registrationSupporterRequested,
    TResult Function()? authCheckRequested,

    TResult Function()? Logout,

    TResult Function()? checkRegisterPatientRequested,
    TResult Function()? checkRegisterSupporterRequested,
    TResult Function(String phoneNumber)? phoneNumberChangedPatient,
    TResult Function(String password)? passwordChangedPatient,
    TResult Function(String phoneNumber)? phoneNumberChangedSupporter,
    TResult Function(String password)? passwordChangedSupporter,

  }) {
    return passwordChanged?.call(password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber)? phoneNumberChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? loginRequested,
    TResult Function(String phoneNumber, String password)?
        registrationPatientRequested,
    TResult Function(String phoneNumber, String password)?
        registrationSupporterRequested,
    TResult Function()? authCheckRequested,

    TResult Function()? Logout,

    TResult Function()? checkRegisterPatientRequested,
    TResult Function()? checkRegisterSupporterRequested,
    TResult Function(String phoneNumber)? phoneNumberChangedPatient,
    TResult Function(String password)? passwordChangedPatient,
    TResult Function(String phoneNumber)? phoneNumberChangedSupporter,
    TResult Function(String password)? passwordChangedSupporter,

    required TResult orElse(),
  }) {
    if (passwordChanged != null) {
      return passwordChanged(password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PhoneNumberChanged value) phoneNumberChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_LoginRequested value) loginRequested,
    required TResult Function(_RegistrationPatientRequested value)
        registrationPatientRequested,
    required TResult Function(_RegistrationSupporterRequested value)
        registrationSupporterRequested,
    required TResult Function(_AuthCheckRequested value) authCheckRequested,

    required TResult Function(_LogoutRequested value) Logout,

    required TResult Function(_checkRegisterPatientRequested value)
        checkRegisterPatientRequested,
    required TResult Function(_checkRegisterSupporterRequested value)
        checkRegisterSupporterRequested,
    required TResult Function(_PhoneNumberChangedPatient value)
        phoneNumberChangedPatient,
    required TResult Function(_PasswordChangedPatient value)
        passwordChangedPatient,
    required TResult Function(_PhoneNumberChangedSupporter value)
        phoneNumberChangedSupporter,
    required TResult Function(_PasswordChangedSupporter value)
        passwordChangedSupporter,

  }) {
    return passwordChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PhoneNumberChanged value)? phoneNumberChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_LoginRequested value)? loginRequested,
    TResult Function(_RegistrationPatientRequested value)?
        registrationPatientRequested,
    TResult Function(_RegistrationSupporterRequested value)?
        registrationSupporterRequested,
    TResult Function(_AuthCheckRequested value)? authCheckRequested,

    TResult Function(_LogoutRequested value)? Logout,

    TResult Function(_checkRegisterPatientRequested value)?
        checkRegisterPatientRequested,
    TResult Function(_checkRegisterSupporterRequested value)?
        checkRegisterSupporterRequested,
    TResult Function(_PhoneNumberChangedPatient value)?
        phoneNumberChangedPatient,
    TResult Function(_PasswordChangedPatient value)? passwordChangedPatient,
    TResult Function(_PhoneNumberChangedSupporter value)?
        phoneNumberChangedSupporter,
    TResult Function(_PasswordChangedSupporter value)? passwordChangedSupporter,

  }) {
    return passwordChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PhoneNumberChanged value)? phoneNumberChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_LoginRequested value)? loginRequested,
    TResult Function(_RegistrationPatientRequested value)?
        registrationPatientRequested,
    TResult Function(_RegistrationSupporterRequested value)?
        registrationSupporterRequested,
    TResult Function(_AuthCheckRequested value)? authCheckRequested,

    TResult Function(_LogoutRequested value)? Logout,

    TResult Function(_checkRegisterPatientRequested value)?
        checkRegisterPatientRequested,
    TResult Function(_checkRegisterSupporterRequested value)?
        checkRegisterSupporterRequested,
    TResult Function(_PhoneNumberChangedPatient value)?
        phoneNumberChangedPatient,
    TResult Function(_PasswordChangedPatient value)? passwordChangedPatient,
    TResult Function(_PhoneNumberChangedSupporter value)?
        phoneNumberChangedSupporter,
    TResult Function(_PasswordChangedSupporter value)? passwordChangedSupporter,

    required TResult orElse(),
  }) {
    if (passwordChanged != null) {
      return passwordChanged(this);
    }
    return orElse();
  }
}

abstract class _PasswordChanged implements AuthenticateEvent {
  const factory _PasswordChanged(final String password) = _$_PasswordChanged;

  String get password;
  @JsonKey(ignore: true)
  _$$_PasswordChangedCopyWith<_$_PasswordChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoginRequestedCopyWith<$Res> {
  factory _$$_LoginRequestedCopyWith(
          _$_LoginRequested value, $Res Function(_$_LoginRequested) then) =
      __$$_LoginRequestedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoginRequestedCopyWithImpl<$Res>
    extends _$AuthenticateEventCopyWithImpl<$Res>
    implements _$$_LoginRequestedCopyWith<$Res> {
  __$$_LoginRequestedCopyWithImpl(
      _$_LoginRequested _value, $Res Function(_$_LoginRequested) _then)
      : super(_value, (v) => _then(v as _$_LoginRequested));

  @override
  _$_LoginRequested get _value => super._value as _$_LoginRequested;
}

/// @nodoc

class _$_LoginRequested implements _LoginRequested {
  const _$_LoginRequested();

  @override
  String toString() {
    return 'AuthenticateEvent.loginRequested()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_LoginRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber) phoneNumberChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function() loginRequested,
    required TResult Function(String phoneNumber, String password)
        registrationPatientRequested,
    required TResult Function(String phoneNumber, String password)
        registrationSupporterRequested,
    required TResult Function() authCheckRequested,

    required TResult Function() Logout,

    required TResult Function() checkRegisterPatientRequested,
    required TResult Function() checkRegisterSupporterRequested,
    required TResult Function(String phoneNumber) phoneNumberChangedPatient,
    required TResult Function(String password) passwordChangedPatient,
    required TResult Function(String phoneNumber) phoneNumberChangedSupporter,
    required TResult Function(String password) passwordChangedSupporter,

  }) {
    return loginRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String phoneNumber)? phoneNumberChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? loginRequested,
    TResult Function(String phoneNumber, String password)?
        registrationPatientRequested,
    TResult Function(String phoneNumber, String password)?
        registrationSupporterRequested,
    TResult Function()? authCheckRequested,

    TResult Function()? Logout,

    TResult Function()? checkRegisterPatientRequested,
    TResult Function()? checkRegisterSupporterRequested,
    TResult Function(String phoneNumber)? phoneNumberChangedPatient,
    TResult Function(String password)? passwordChangedPatient,
    TResult Function(String phoneNumber)? phoneNumberChangedSupporter,
    TResult Function(String password)? passwordChangedSupporter,

  }) {
    return loginRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber)? phoneNumberChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? loginRequested,
    TResult Function(String phoneNumber, String password)?
        registrationPatientRequested,
    TResult Function(String phoneNumber, String password)?
        registrationSupporterRequested,
    TResult Function()? authCheckRequested,

    TResult Function()? Logout,

    TResult Function()? checkRegisterPatientRequested,
    TResult Function()? checkRegisterSupporterRequested,
    TResult Function(String phoneNumber)? phoneNumberChangedPatient,
    TResult Function(String password)? passwordChangedPatient,
    TResult Function(String phoneNumber)? phoneNumberChangedSupporter,
    TResult Function(String password)? passwordChangedSupporter,

    required TResult orElse(),
  }) {
    if (loginRequested != null) {
      return loginRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PhoneNumberChanged value) phoneNumberChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_LoginRequested value) loginRequested,
    required TResult Function(_RegistrationPatientRequested value)
        registrationPatientRequested,
    required TResult Function(_RegistrationSupporterRequested value)
        registrationSupporterRequested,
    required TResult Function(_AuthCheckRequested value) authCheckRequested,

    required TResult Function(_LogoutRequested value) Logout,

    required TResult Function(_checkRegisterPatientRequested value)
        checkRegisterPatientRequested,
    required TResult Function(_checkRegisterSupporterRequested value)
        checkRegisterSupporterRequested,
    required TResult Function(_PhoneNumberChangedPatient value)
        phoneNumberChangedPatient,
    required TResult Function(_PasswordChangedPatient value)
        passwordChangedPatient,
    required TResult Function(_PhoneNumberChangedSupporter value)
        phoneNumberChangedSupporter,
    required TResult Function(_PasswordChangedSupporter value)
        passwordChangedSupporter,

  }) {
    return loginRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PhoneNumberChanged value)? phoneNumberChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_LoginRequested value)? loginRequested,
    TResult Function(_RegistrationPatientRequested value)?
        registrationPatientRequested,
    TResult Function(_RegistrationSupporterRequested value)?
        registrationSupporterRequested,
    TResult Function(_AuthCheckRequested value)? authCheckRequested,

    TResult Function(_LogoutRequested value)? Logout,

    TResult Function(_checkRegisterPatientRequested value)?
        checkRegisterPatientRequested,
    TResult Function(_checkRegisterSupporterRequested value)?
        checkRegisterSupporterRequested,
    TResult Function(_PhoneNumberChangedPatient value)?
        phoneNumberChangedPatient,
    TResult Function(_PasswordChangedPatient value)? passwordChangedPatient,
    TResult Function(_PhoneNumberChangedSupporter value)?
        phoneNumberChangedSupporter,
    TResult Function(_PasswordChangedSupporter value)? passwordChangedSupporter,

  }) {
    return loginRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PhoneNumberChanged value)? phoneNumberChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_LoginRequested value)? loginRequested,
    TResult Function(_RegistrationPatientRequested value)?
        registrationPatientRequested,
    TResult Function(_RegistrationSupporterRequested value)?
        registrationSupporterRequested,
    TResult Function(_AuthCheckRequested value)? authCheckRequested,

    TResult Function(_LogoutRequested value)? Logout,

    TResult Function(_checkRegisterPatientRequested value)?
        checkRegisterPatientRequested,
    TResult Function(_checkRegisterSupporterRequested value)?
        checkRegisterSupporterRequested,
    TResult Function(_PhoneNumberChangedPatient value)?
        phoneNumberChangedPatient,
    TResult Function(_PasswordChangedPatient value)? passwordChangedPatient,
    TResult Function(_PhoneNumberChangedSupporter value)?
        phoneNumberChangedSupporter,
    TResult Function(_PasswordChangedSupporter value)? passwordChangedSupporter,

    required TResult orElse(),
  }) {
    if (loginRequested != null) {
      return loginRequested(this);
    }
    return orElse();
  }
}

abstract class _LoginRequested implements AuthenticateEvent {
  const factory _LoginRequested() = _$_LoginRequested;
}

/// @nodoc
abstract class _$$_RegistrationPatientRequestedCopyWith<$Res> {
  factory _$$_RegistrationPatientRequestedCopyWith(
          _$_RegistrationPatientRequested value,
          $Res Function(_$_RegistrationPatientRequested) then) =
      __$$_RegistrationPatientRequestedCopyWithImpl<$Res>;
  $Res call({String phoneNumber, String password});
}

/// @nodoc
class __$$_RegistrationPatientRequestedCopyWithImpl<$Res>
    extends _$AuthenticateEventCopyWithImpl<$Res>
    implements _$$_RegistrationPatientRequestedCopyWith<$Res> {
  __$$_RegistrationPatientRequestedCopyWithImpl(
      _$_RegistrationPatientRequested _value,
      $Res Function(_$_RegistrationPatientRequested) _then)
      : super(_value, (v) => _then(v as _$_RegistrationPatientRequested));

  @override
  _$_RegistrationPatientRequested get _value =>
      super._value as _$_RegistrationPatientRequested;

  @override
  $Res call({
    Object? phoneNumber = freezed,
    Object? password = freezed,
  }) {
    return _then(_$_RegistrationPatientRequested(
      phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_RegistrationPatientRequested implements _RegistrationPatientRequested {
  const _$_RegistrationPatientRequested(this.phoneNumber, this.password);

  @override
  final String phoneNumber;
  @override
  final String password;

  @override
  String toString() {
    return 'AuthenticateEvent.registrationPatientRequested(phoneNumber: $phoneNumber, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RegistrationPatientRequested &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
            const DeepCollectionEquality().equals(other.password, password));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(phoneNumber),
      const DeepCollectionEquality().hash(password));

  @JsonKey(ignore: true)
  @override
  _$$_RegistrationPatientRequestedCopyWith<_$_RegistrationPatientRequested>
      get copyWith => __$$_RegistrationPatientRequestedCopyWithImpl<
          _$_RegistrationPatientRequested>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber) phoneNumberChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function() loginRequested,
    required TResult Function(String phoneNumber, String password)
        registrationPatientRequested,
    required TResult Function(String phoneNumber, String password)
        registrationSupporterRequested,
    required TResult Function() authCheckRequested,
    required TResult Function() checkRegisterPatientRequested,
    required TResult Function() checkRegisterSupporterRequested,
    required TResult Function(String phoneNumber) phoneNumberChangedPatient,
    required TResult Function(String password) passwordChangedPatient,
    required TResult Function(String phoneNumber) phoneNumberChangedSupporter,
    required TResult Function(String password) passwordChangedSupporter,
  }) {
    return registrationPatientRequested(phoneNumber, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String phoneNumber)? phoneNumberChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? loginRequested,
    TResult Function(String phoneNumber, String password)?
        registrationPatientRequested,
    TResult Function(String phoneNumber, String password)?
        registrationSupporterRequested,
    TResult Function()? authCheckRequested,
    TResult Function()? checkRegisterPatientRequested,
    TResult Function()? checkRegisterSupporterRequested,
    TResult Function(String phoneNumber)? phoneNumberChangedPatient,
    TResult Function(String password)? passwordChangedPatient,
    TResult Function(String phoneNumber)? phoneNumberChangedSupporter,
    TResult Function(String password)? passwordChangedSupporter,
  }) {
    return registrationPatientRequested?.call(phoneNumber, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber)? phoneNumberChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? loginRequested,
    TResult Function(String phoneNumber, String password)?
        registrationPatientRequested,
    TResult Function(String phoneNumber, String password)?
        registrationSupporterRequested,
    TResult Function()? authCheckRequested,
    TResult Function()? checkRegisterPatientRequested,
    TResult Function()? checkRegisterSupporterRequested,
    TResult Function(String phoneNumber)? phoneNumberChangedPatient,
    TResult Function(String password)? passwordChangedPatient,
    TResult Function(String phoneNumber)? phoneNumberChangedSupporter,
    TResult Function(String password)? passwordChangedSupporter,
    required TResult orElse(),
  }) {
    if (registrationPatientRequested != null) {
      return registrationPatientRequested(phoneNumber, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PhoneNumberChanged value) phoneNumberChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_LoginRequested value) loginRequested,
    required TResult Function(_RegistrationPatientRequested value)
        registrationPatientRequested,
    required TResult Function(_RegistrationSupporterRequested value)
        registrationSupporterRequested,
    required TResult Function(_AuthCheckRequested value) authCheckRequested,
    required TResult Function(_checkRegisterPatientRequested value)
        checkRegisterPatientRequested,
    required TResult Function(_checkRegisterSupporterRequested value)
        checkRegisterSupporterRequested,
    required TResult Function(_PhoneNumberChangedPatient value)
        phoneNumberChangedPatient,
    required TResult Function(_PasswordChangedPatient value)
        passwordChangedPatient,
    required TResult Function(_PhoneNumberChangedSupporter value)
        phoneNumberChangedSupporter,
    required TResult Function(_PasswordChangedSupporter value)
        passwordChangedSupporter,
  }) {
    return registrationPatientRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PhoneNumberChanged value)? phoneNumberChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_LoginRequested value)? loginRequested,
    TResult Function(_RegistrationPatientRequested value)?
        registrationPatientRequested,
    TResult Function(_RegistrationSupporterRequested value)?
        registrationSupporterRequested,
    TResult Function(_AuthCheckRequested value)? authCheckRequested,
    TResult Function(_checkRegisterPatientRequested value)?
        checkRegisterPatientRequested,
    TResult Function(_checkRegisterSupporterRequested value)?
        checkRegisterSupporterRequested,
    TResult Function(_PhoneNumberChangedPatient value)?
        phoneNumberChangedPatient,
    TResult Function(_PasswordChangedPatient value)? passwordChangedPatient,
    TResult Function(_PhoneNumberChangedSupporter value)?
        phoneNumberChangedSupporter,
    TResult Function(_PasswordChangedSupporter value)? passwordChangedSupporter,
  }) {
    return registrationPatientRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PhoneNumberChanged value)? phoneNumberChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_LoginRequested value)? loginRequested,
    TResult Function(_RegistrationPatientRequested value)?
        registrationPatientRequested,
    TResult Function(_RegistrationSupporterRequested value)?
        registrationSupporterRequested,
    TResult Function(_AuthCheckRequested value)? authCheckRequested,
    TResult Function(_checkRegisterPatientRequested value)?
        checkRegisterPatientRequested,
    TResult Function(_checkRegisterSupporterRequested value)?
        checkRegisterSupporterRequested,
    TResult Function(_PhoneNumberChangedPatient value)?
        phoneNumberChangedPatient,
    TResult Function(_PasswordChangedPatient value)? passwordChangedPatient,
    TResult Function(_PhoneNumberChangedSupporter value)?
        phoneNumberChangedSupporter,
    TResult Function(_PasswordChangedSupporter value)? passwordChangedSupporter,
    required TResult orElse(),
  }) {
    if (registrationPatientRequested != null) {
      return registrationPatientRequested(this);
    }
    return orElse();
  }
}

abstract class _RegistrationPatientRequested implements AuthenticateEvent {
  const factory _RegistrationPatientRequested(
          final String phoneNumber, final String password) =
      _$_RegistrationPatientRequested;

  String get phoneNumber;
  String get password;
  @JsonKey(ignore: true)
  _$$_RegistrationPatientRequestedCopyWith<_$_RegistrationPatientRequested>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_RegistrationSupporterRequestedCopyWith<$Res> {
  factory _$$_RegistrationSupporterRequestedCopyWith(
          _$_RegistrationSupporterRequested value,
          $Res Function(_$_RegistrationSupporterRequested) then) =
      __$$_RegistrationSupporterRequestedCopyWithImpl<$Res>;
  $Res call({String phoneNumber, String password});
}

/// @nodoc
class __$$_RegistrationSupporterRequestedCopyWithImpl<$Res>
    extends _$AuthenticateEventCopyWithImpl<$Res>
    implements _$$_RegistrationSupporterRequestedCopyWith<$Res> {
  __$$_RegistrationSupporterRequestedCopyWithImpl(
      _$_RegistrationSupporterRequested _value,
      $Res Function(_$_RegistrationSupporterRequested) _then)
      : super(_value, (v) => _then(v as _$_RegistrationSupporterRequested));

  @override
  _$_RegistrationSupporterRequested get _value =>
      super._value as _$_RegistrationSupporterRequested;

  @override
  $Res call({
    Object? phoneNumber = freezed,
    Object? password = freezed,
  }) {
    return _then(_$_RegistrationSupporterRequested(
      phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_RegistrationSupporterRequested
    implements _RegistrationSupporterRequested {
  const _$_RegistrationSupporterRequested(this.phoneNumber, this.password);

  @override
  final String phoneNumber;
  @override
  final String password;

  @override
  String toString() {
    return 'AuthenticateEvent.registrationSupporterRequested(phoneNumber: $phoneNumber, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RegistrationSupporterRequested &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
            const DeepCollectionEquality().equals(other.password, password));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(phoneNumber),
      const DeepCollectionEquality().hash(password));

  @JsonKey(ignore: true)
  @override
  _$$_RegistrationSupporterRequestedCopyWith<_$_RegistrationSupporterRequested>
      get copyWith => __$$_RegistrationSupporterRequestedCopyWithImpl<
          _$_RegistrationSupporterRequested>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber) phoneNumberChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function() loginRequested,
    required TResult Function(String phoneNumber, String password)
        registrationPatientRequested,
    required TResult Function(String phoneNumber, String password)
        registrationSupporterRequested,
    required TResult Function() authCheckRequested,
    required TResult Function() checkRegisterPatientRequested,
    required TResult Function() checkRegisterSupporterRequested,
    required TResult Function(String phoneNumber) phoneNumberChangedPatient,
    required TResult Function(String password) passwordChangedPatient,
    required TResult Function(String phoneNumber) phoneNumberChangedSupporter,
    required TResult Function(String password) passwordChangedSupporter,
  }) {
    return registrationSupporterRequested(phoneNumber, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String phoneNumber)? phoneNumberChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? loginRequested,
    TResult Function(String phoneNumber, String password)?
        registrationPatientRequested,
    TResult Function(String phoneNumber, String password)?
        registrationSupporterRequested,
    TResult Function()? authCheckRequested,
    TResult Function()? checkRegisterPatientRequested,
    TResult Function()? checkRegisterSupporterRequested,
    TResult Function(String phoneNumber)? phoneNumberChangedPatient,
    TResult Function(String password)? passwordChangedPatient,
    TResult Function(String phoneNumber)? phoneNumberChangedSupporter,
    TResult Function(String password)? passwordChangedSupporter,
  }) {
    return registrationSupporterRequested?.call(phoneNumber, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber)? phoneNumberChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? loginRequested,
    TResult Function(String phoneNumber, String password)?
        registrationPatientRequested,
    TResult Function(String phoneNumber, String password)?
        registrationSupporterRequested,
    TResult Function()? authCheckRequested,
    TResult Function()? checkRegisterPatientRequested,
    TResult Function()? checkRegisterSupporterRequested,
    TResult Function(String phoneNumber)? phoneNumberChangedPatient,
    TResult Function(String password)? passwordChangedPatient,
    TResult Function(String phoneNumber)? phoneNumberChangedSupporter,
    TResult Function(String password)? passwordChangedSupporter,
    required TResult orElse(),
  }) {
    if (registrationSupporterRequested != null) {
      return registrationSupporterRequested(phoneNumber, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PhoneNumberChanged value) phoneNumberChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_LoginRequested value) loginRequested,
    required TResult Function(_RegistrationPatientRequested value)
        registrationPatientRequested,
    required TResult Function(_RegistrationSupporterRequested value)
        registrationSupporterRequested,
    required TResult Function(_AuthCheckRequested value) authCheckRequested,
    required TResult Function(_checkRegisterPatientRequested value)
        checkRegisterPatientRequested,
    required TResult Function(_checkRegisterSupporterRequested value)
        checkRegisterSupporterRequested,
    required TResult Function(_PhoneNumberChangedPatient value)
        phoneNumberChangedPatient,
    required TResult Function(_PasswordChangedPatient value)
        passwordChangedPatient,
    required TResult Function(_PhoneNumberChangedSupporter value)
        phoneNumberChangedSupporter,
    required TResult Function(_PasswordChangedSupporter value)
        passwordChangedSupporter,
  }) {
    return registrationSupporterRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PhoneNumberChanged value)? phoneNumberChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_LoginRequested value)? loginRequested,
    TResult Function(_RegistrationPatientRequested value)?
        registrationPatientRequested,
    TResult Function(_RegistrationSupporterRequested value)?
        registrationSupporterRequested,
    TResult Function(_AuthCheckRequested value)? authCheckRequested,
    TResult Function(_checkRegisterPatientRequested value)?
        checkRegisterPatientRequested,
    TResult Function(_checkRegisterSupporterRequested value)?
        checkRegisterSupporterRequested,
    TResult Function(_PhoneNumberChangedPatient value)?
        phoneNumberChangedPatient,
    TResult Function(_PasswordChangedPatient value)? passwordChangedPatient,
    TResult Function(_PhoneNumberChangedSupporter value)?
        phoneNumberChangedSupporter,
    TResult Function(_PasswordChangedSupporter value)? passwordChangedSupporter,
  }) {
    return registrationSupporterRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PhoneNumberChanged value)? phoneNumberChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_LoginRequested value)? loginRequested,
    TResult Function(_RegistrationPatientRequested value)?
        registrationPatientRequested,
    TResult Function(_RegistrationSupporterRequested value)?
        registrationSupporterRequested,
    TResult Function(_AuthCheckRequested value)? authCheckRequested,
    TResult Function(_checkRegisterPatientRequested value)?
        checkRegisterPatientRequested,
    TResult Function(_checkRegisterSupporterRequested value)?
        checkRegisterSupporterRequested,
    TResult Function(_PhoneNumberChangedPatient value)?
        phoneNumberChangedPatient,
    TResult Function(_PasswordChangedPatient value)? passwordChangedPatient,
    TResult Function(_PhoneNumberChangedSupporter value)?
        phoneNumberChangedSupporter,
    TResult Function(_PasswordChangedSupporter value)? passwordChangedSupporter,
    required TResult orElse(),
  }) {
    if (registrationSupporterRequested != null) {
      return registrationSupporterRequested(this);
    }
    return orElse();
  }
}

abstract class _RegistrationSupporterRequested implements AuthenticateEvent {
  const factory _RegistrationSupporterRequested(
          final String phoneNumber, final String password) =
      _$_RegistrationSupporterRequested;

  String get phoneNumber;
  String get password;
  @JsonKey(ignore: true)
  _$$_RegistrationSupporterRequestedCopyWith<_$_RegistrationSupporterRequested>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AuthCheckRequestedCopyWith<$Res> {
  factory _$$_AuthCheckRequestedCopyWith(_$_AuthCheckRequested value,
          $Res Function(_$_AuthCheckRequested) then) =
      __$$_AuthCheckRequestedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AuthCheckRequestedCopyWithImpl<$Res>
    extends _$AuthenticateEventCopyWithImpl<$Res>
    implements _$$_AuthCheckRequestedCopyWith<$Res> {
  __$$_AuthCheckRequestedCopyWithImpl(
      _$_AuthCheckRequested _value, $Res Function(_$_AuthCheckRequested) _then)
      : super(_value, (v) => _then(v as _$_AuthCheckRequested));

  @override
  _$_AuthCheckRequested get _value => super._value as _$_AuthCheckRequested;
}

/// @nodoc

class _$_AuthCheckRequested implements _AuthCheckRequested {
  const _$_AuthCheckRequested();

  @override
  String toString() {
    return 'AuthenticateEvent.authCheckRequested()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_AuthCheckRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber) phoneNumberChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function() loginRequested,
    required TResult Function(String phoneNumber, String password)
        registrationPatientRequested,
    required TResult Function(String phoneNumber, String password)
        registrationSupporterRequested,
    required TResult Function() authCheckRequested,
    required TResult Function() checkRegisterPatientRequested,
    required TResult Function() checkRegisterSupporterRequested,
    required TResult Function(String phoneNumber) phoneNumberChangedPatient,
    required TResult Function(String password) passwordChangedPatient,
    required TResult Function(String phoneNumber) phoneNumberChangedSupporter,
    required TResult Function(String password) passwordChangedSupporter,
  }) {
    return authCheckRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String phoneNumber)? phoneNumberChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? loginRequested,
    TResult Function(String phoneNumber, String password)?
        registrationPatientRequested,
    TResult Function(String phoneNumber, String password)?
        registrationSupporterRequested,
    TResult Function()? authCheckRequested,
    TResult Function()? checkRegisterPatientRequested,
    TResult Function()? checkRegisterSupporterRequested,
    TResult Function(String phoneNumber)? phoneNumberChangedPatient,
    TResult Function(String password)? passwordChangedPatient,
    TResult Function(String phoneNumber)? phoneNumberChangedSupporter,
    TResult Function(String password)? passwordChangedSupporter,
  }) {
    return authCheckRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber)? phoneNumberChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? loginRequested,
    TResult Function(String phoneNumber, String password)?
        registrationPatientRequested,
    TResult Function(String phoneNumber, String password)?
        registrationSupporterRequested,
    TResult Function()? authCheckRequested,
    TResult Function()? checkRegisterPatientRequested,
    TResult Function()? checkRegisterSupporterRequested,
    TResult Function(String phoneNumber)? phoneNumberChangedPatient,
    TResult Function(String password)? passwordChangedPatient,
    TResult Function(String phoneNumber)? phoneNumberChangedSupporter,
    TResult Function(String password)? passwordChangedSupporter,
    required TResult orElse(),
  }) {
    if (authCheckRequested != null) {
      return authCheckRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PhoneNumberChanged value) phoneNumberChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_LoginRequested value) loginRequested,
    required TResult Function(_RegistrationPatientRequested value)
        registrationPatientRequested,
    required TResult Function(_RegistrationSupporterRequested value)
        registrationSupporterRequested,
    required TResult Function(_AuthCheckRequested value) authCheckRequested,
    required TResult Function(_checkRegisterPatientRequested value)
        checkRegisterPatientRequested,
    required TResult Function(_checkRegisterSupporterRequested value)
        checkRegisterSupporterRequested,
    required TResult Function(_PhoneNumberChangedPatient value)
        phoneNumberChangedPatient,
    required TResult Function(_PasswordChangedPatient value)
        passwordChangedPatient,
    required TResult Function(_PhoneNumberChangedSupporter value)
        phoneNumberChangedSupporter,
    required TResult Function(_PasswordChangedSupporter value)
        passwordChangedSupporter,
  }) {
    return authCheckRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PhoneNumberChanged value)? phoneNumberChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_LoginRequested value)? loginRequested,
    TResult Function(_RegistrationPatientRequested value)?
        registrationPatientRequested,
    TResult Function(_RegistrationSupporterRequested value)?
        registrationSupporterRequested,
    TResult Function(_AuthCheckRequested value)? authCheckRequested,
    TResult Function(_checkRegisterPatientRequested value)?
        checkRegisterPatientRequested,
    TResult Function(_checkRegisterSupporterRequested value)?
        checkRegisterSupporterRequested,
    TResult Function(_PhoneNumberChangedPatient value)?
        phoneNumberChangedPatient,
    TResult Function(_PasswordChangedPatient value)? passwordChangedPatient,
    TResult Function(_PhoneNumberChangedSupporter value)?
        phoneNumberChangedSupporter,
    TResult Function(_PasswordChangedSupporter value)? passwordChangedSupporter,
  }) {
    return authCheckRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PhoneNumberChanged value)? phoneNumberChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_LoginRequested value)? loginRequested,
    TResult Function(_RegistrationPatientRequested value)?
        registrationPatientRequested,
    TResult Function(_RegistrationSupporterRequested value)?
        registrationSupporterRequested,
    TResult Function(_AuthCheckRequested value)? authCheckRequested,
    TResult Function(_checkRegisterPatientRequested value)?
        checkRegisterPatientRequested,
    TResult Function(_checkRegisterSupporterRequested value)?
        checkRegisterSupporterRequested,
    TResult Function(_PhoneNumberChangedPatient value)?
        phoneNumberChangedPatient,
    TResult Function(_PasswordChangedPatient value)? passwordChangedPatient,
    TResult Function(_PhoneNumberChangedSupporter value)?
        phoneNumberChangedSupporter,
    TResult Function(_PasswordChangedSupporter value)? passwordChangedSupporter,
    required TResult orElse(),
  }) {
    if (authCheckRequested != null) {
      return authCheckRequested(this);
    }
    return orElse();
  }
}

abstract class _AuthCheckRequested implements AuthenticateEvent {
  const factory _AuthCheckRequested() = _$_AuthCheckRequested;
}

/// @nodoc
abstract class _$$_checkRegisterPatientRequestedCopyWith<$Res> {
  factory _$$_checkRegisterPatientRequestedCopyWith(
          _$_checkRegisterPatientRequested value,
          $Res Function(_$_checkRegisterPatientRequested) then) =
      __$$_checkRegisterPatientRequestedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_checkRegisterPatientRequestedCopyWithImpl<$Res>
    extends _$AuthenticateEventCopyWithImpl<$Res>
    implements _$$_checkRegisterPatientRequestedCopyWith<$Res> {
  __$$_checkRegisterPatientRequestedCopyWithImpl(
      _$_checkRegisterPatientRequested _value,
      $Res Function(_$_checkRegisterPatientRequested) _then)
      : super(_value, (v) => _then(v as _$_checkRegisterPatientRequested));

  @override
  _$_checkRegisterPatientRequested get _value =>
      super._value as _$_checkRegisterPatientRequested;
}

/// @nodoc

class _$_checkRegisterPatientRequested
    implements _checkRegisterPatientRequested {
  const _$_checkRegisterPatientRequested();

  @override
  String toString() {
    return 'AuthenticateEvent.checkRegisterPatientRequested()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_checkRegisterPatientRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber) phoneNumberChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function() loginRequested,
    required TResult Function(String phoneNumber, String password)
        registrationPatientRequested,
    required TResult Function(String phoneNumber, String password)
        registrationSupporterRequested,
    required TResult Function() authCheckRequested,
    required TResult Function() checkRegisterPatientRequested,
    required TResult Function() checkRegisterSupporterRequested,
    required TResult Function(String phoneNumber) phoneNumberChangedPatient,
    required TResult Function(String password) passwordChangedPatient,
    required TResult Function(String phoneNumber) phoneNumberChangedSupporter,
    required TResult Function(String password) passwordChangedSupporter,
  }) {
    return checkRegisterPatientRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String phoneNumber)? phoneNumberChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? loginRequested,
    TResult Function(String phoneNumber, String password)?
        registrationPatientRequested,
    TResult Function(String phoneNumber, String password)?
        registrationSupporterRequested,
    TResult Function()? authCheckRequested,
    TResult Function()? checkRegisterPatientRequested,
    TResult Function()? checkRegisterSupporterRequested,
    TResult Function(String phoneNumber)? phoneNumberChangedPatient,
    TResult Function(String password)? passwordChangedPatient,
    TResult Function(String phoneNumber)? phoneNumberChangedSupporter,
    TResult Function(String password)? passwordChangedSupporter,
  }) {
    return checkRegisterPatientRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber)? phoneNumberChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? loginRequested,
    TResult Function(String phoneNumber, String password)?
        registrationPatientRequested,
    TResult Function(String phoneNumber, String password)?
        registrationSupporterRequested,
    TResult Function()? authCheckRequested,
    TResult Function()? checkRegisterPatientRequested,
    TResult Function()? checkRegisterSupporterRequested,
    TResult Function(String phoneNumber)? phoneNumberChangedPatient,
    TResult Function(String password)? passwordChangedPatient,
    TResult Function(String phoneNumber)? phoneNumberChangedSupporter,
    TResult Function(String password)? passwordChangedSupporter,
    required TResult orElse(),
  }) {
    if (checkRegisterPatientRequested != null) {
      return checkRegisterPatientRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PhoneNumberChanged value) phoneNumberChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_LoginRequested value) loginRequested,
    required TResult Function(_RegistrationPatientRequested value)
        registrationPatientRequested,
    required TResult Function(_RegistrationSupporterRequested value)
        registrationSupporterRequested,
    required TResult Function(_AuthCheckRequested value) authCheckRequested,
    required TResult Function(_checkRegisterPatientRequested value)
        checkRegisterPatientRequested,
    required TResult Function(_checkRegisterSupporterRequested value)
        checkRegisterSupporterRequested,
    required TResult Function(_PhoneNumberChangedPatient value)
        phoneNumberChangedPatient,
    required TResult Function(_PasswordChangedPatient value)
        passwordChangedPatient,
    required TResult Function(_PhoneNumberChangedSupporter value)
        phoneNumberChangedSupporter,
    required TResult Function(_PasswordChangedSupporter value)
        passwordChangedSupporter,
  }) {
    return checkRegisterPatientRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PhoneNumberChanged value)? phoneNumberChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_LoginRequested value)? loginRequested,
    TResult Function(_RegistrationPatientRequested value)?
        registrationPatientRequested,
    TResult Function(_RegistrationSupporterRequested value)?
        registrationSupporterRequested,
    TResult Function(_AuthCheckRequested value)? authCheckRequested,
    TResult Function(_checkRegisterPatientRequested value)?
        checkRegisterPatientRequested,
    TResult Function(_checkRegisterSupporterRequested value)?
        checkRegisterSupporterRequested,
    TResult Function(_PhoneNumberChangedPatient value)?
        phoneNumberChangedPatient,
    TResult Function(_PasswordChangedPatient value)? passwordChangedPatient,
    TResult Function(_PhoneNumberChangedSupporter value)?
        phoneNumberChangedSupporter,
    TResult Function(_PasswordChangedSupporter value)? passwordChangedSupporter,
  }) {
    return checkRegisterPatientRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PhoneNumberChanged value)? phoneNumberChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_LoginRequested value)? loginRequested,
    TResult Function(_RegistrationPatientRequested value)?
        registrationPatientRequested,
    TResult Function(_RegistrationSupporterRequested value)?
        registrationSupporterRequested,
    TResult Function(_AuthCheckRequested value)? authCheckRequested,
    TResult Function(_checkRegisterPatientRequested value)?
        checkRegisterPatientRequested,
    TResult Function(_checkRegisterSupporterRequested value)?
        checkRegisterSupporterRequested,
    TResult Function(_PhoneNumberChangedPatient value)?
        phoneNumberChangedPatient,
    TResult Function(_PasswordChangedPatient value)? passwordChangedPatient,
    TResult Function(_PhoneNumberChangedSupporter value)?
        phoneNumberChangedSupporter,
    TResult Function(_PasswordChangedSupporter value)? passwordChangedSupporter,
    required TResult orElse(),
  }) {
    if (checkRegisterPatientRequested != null) {
      return checkRegisterPatientRequested(this);
    }
    return orElse();
  }
}

abstract class _checkRegisterPatientRequested implements AuthenticateEvent {
  const factory _checkRegisterPatientRequested() =
      _$_checkRegisterPatientRequested;
}

/// @nodoc
abstract class _$$_checkRegisterSupporterRequestedCopyWith<$Res> {
  factory _$$_checkRegisterSupporterRequestedCopyWith(
          _$_checkRegisterSupporterRequested value,
          $Res Function(_$_checkRegisterSupporterRequested) then) =
      __$$_checkRegisterSupporterRequestedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_checkRegisterSupporterRequestedCopyWithImpl<$Res>
    extends _$AuthenticateEventCopyWithImpl<$Res>
    implements _$$_checkRegisterSupporterRequestedCopyWith<$Res> {
  __$$_checkRegisterSupporterRequestedCopyWithImpl(
      _$_checkRegisterSupporterRequested _value,
      $Res Function(_$_checkRegisterSupporterRequested) _then)
      : super(_value, (v) => _then(v as _$_checkRegisterSupporterRequested));

  @override
  _$_checkRegisterSupporterRequested get _value =>
      super._value as _$_checkRegisterSupporterRequested;
}

/// @nodoc

class _$_checkRegisterSupporterRequested
    implements _checkRegisterSupporterRequested {
  const _$_checkRegisterSupporterRequested();

  @override
  String toString() {
    return 'AuthenticateEvent.checkRegisterSupporterRequested()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_checkRegisterSupporterRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber) phoneNumberChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function() loginRequested,
    required TResult Function(String phoneNumber, String password)
        registrationPatientRequested,
    required TResult Function(String phoneNumber, String password)
        registrationSupporterRequested,
    required TResult Function() authCheckRequested,
    required TResult Function() checkRegisterPatientRequested,
    required TResult Function() checkRegisterSupporterRequested,
    required TResult Function(String phoneNumber) phoneNumberChangedPatient,
    required TResult Function(String password) passwordChangedPatient,
    required TResult Function(String phoneNumber) phoneNumberChangedSupporter,
    required TResult Function(String password) passwordChangedSupporter,
  }) {
    return checkRegisterSupporterRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String phoneNumber)? phoneNumberChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? loginRequested,
    TResult Function(String phoneNumber, String password)?
        registrationPatientRequested,
    TResult Function(String phoneNumber, String password)?
        registrationSupporterRequested,
    TResult Function()? authCheckRequested,
    TResult Function()? checkRegisterPatientRequested,
    TResult Function()? checkRegisterSupporterRequested,
    TResult Function(String phoneNumber)? phoneNumberChangedPatient,
    TResult Function(String password)? passwordChangedPatient,
    TResult Function(String phoneNumber)? phoneNumberChangedSupporter,
    TResult Function(String password)? passwordChangedSupporter,
  }) {
    return checkRegisterSupporterRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber)? phoneNumberChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? loginRequested,
    TResult Function(String phoneNumber, String password)?
        registrationPatientRequested,
    TResult Function(String phoneNumber, String password)?
        registrationSupporterRequested,
    TResult Function()? authCheckRequested,
    TResult Function()? checkRegisterPatientRequested,
    TResult Function()? checkRegisterSupporterRequested,
    TResult Function(String phoneNumber)? phoneNumberChangedPatient,
    TResult Function(String password)? passwordChangedPatient,
    TResult Function(String phoneNumber)? phoneNumberChangedSupporter,
    TResult Function(String password)? passwordChangedSupporter,
    required TResult orElse(),
  }) {
    if (checkRegisterSupporterRequested != null) {
      return checkRegisterSupporterRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PhoneNumberChanged value) phoneNumberChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_LoginRequested value) loginRequested,
    required TResult Function(_RegistrationPatientRequested value)
        registrationPatientRequested,
    required TResult Function(_RegistrationSupporterRequested value)
        registrationSupporterRequested,
    required TResult Function(_AuthCheckRequested value) authCheckRequested,
    required TResult Function(_checkRegisterPatientRequested value)
        checkRegisterPatientRequested,
    required TResult Function(_checkRegisterSupporterRequested value)
        checkRegisterSupporterRequested,
    required TResult Function(_PhoneNumberChangedPatient value)
        phoneNumberChangedPatient,
    required TResult Function(_PasswordChangedPatient value)
        passwordChangedPatient,
    required TResult Function(_PhoneNumberChangedSupporter value)
        phoneNumberChangedSupporter,
    required TResult Function(_PasswordChangedSupporter value)
        passwordChangedSupporter,
  }) {
    return checkRegisterSupporterRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PhoneNumberChanged value)? phoneNumberChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_LoginRequested value)? loginRequested,
    TResult Function(_RegistrationPatientRequested value)?
        registrationPatientRequested,
    TResult Function(_RegistrationSupporterRequested value)?
        registrationSupporterRequested,
    TResult Function(_AuthCheckRequested value)? authCheckRequested,
    TResult Function(_checkRegisterPatientRequested value)?
        checkRegisterPatientRequested,
    TResult Function(_checkRegisterSupporterRequested value)?
        checkRegisterSupporterRequested,
    TResult Function(_PhoneNumberChangedPatient value)?
        phoneNumberChangedPatient,
    TResult Function(_PasswordChangedPatient value)? passwordChangedPatient,
    TResult Function(_PhoneNumberChangedSupporter value)?
        phoneNumberChangedSupporter,
    TResult Function(_PasswordChangedSupporter value)? passwordChangedSupporter,
  }) {
    return checkRegisterSupporterRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PhoneNumberChanged value)? phoneNumberChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_LoginRequested value)? loginRequested,
    TResult Function(_RegistrationPatientRequested value)?
        registrationPatientRequested,
    TResult Function(_RegistrationSupporterRequested value)?
        registrationSupporterRequested,
    TResult Function(_AuthCheckRequested value)? authCheckRequested,
    TResult Function(_checkRegisterPatientRequested value)?
        checkRegisterPatientRequested,
    TResult Function(_checkRegisterSupporterRequested value)?
        checkRegisterSupporterRequested,
    TResult Function(_PhoneNumberChangedPatient value)?
        phoneNumberChangedPatient,
    TResult Function(_PasswordChangedPatient value)? passwordChangedPatient,
    TResult Function(_PhoneNumberChangedSupporter value)?
        phoneNumberChangedSupporter,
    TResult Function(_PasswordChangedSupporter value)? passwordChangedSupporter,
    required TResult orElse(),
  }) {
    if (checkRegisterSupporterRequested != null) {
      return checkRegisterSupporterRequested(this);
    }
    return orElse();
  }
}

abstract class _checkRegisterSupporterRequested implements AuthenticateEvent {
  const factory _checkRegisterSupporterRequested() =
      _$_checkRegisterSupporterRequested;
}

/// @nodoc
abstract class _$$_PhoneNumberChangedPatientCopyWith<$Res> {
  factory _$$_PhoneNumberChangedPatientCopyWith(
          _$_PhoneNumberChangedPatient value,
          $Res Function(_$_PhoneNumberChangedPatient) then) =
      __$$_PhoneNumberChangedPatientCopyWithImpl<$Res>;
  $Res call({String phoneNumber});
}

/// @nodoc
class __$$_PhoneNumberChangedPatientCopyWithImpl<$Res>
    extends _$AuthenticateEventCopyWithImpl<$Res>
    implements _$$_PhoneNumberChangedPatientCopyWith<$Res> {
  __$$_PhoneNumberChangedPatientCopyWithImpl(
      _$_PhoneNumberChangedPatient _value,
      $Res Function(_$_PhoneNumberChangedPatient) _then)
      : super(_value, (v) => _then(v as _$_PhoneNumberChangedPatient));

  @override
  _$_PhoneNumberChangedPatient get _value =>
      super._value as _$_PhoneNumberChangedPatient;

  @override
  $Res call({
    Object? phoneNumber = freezed,
  }) {
    return _then(_$_PhoneNumberChangedPatient(
      phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_PhoneNumberChangedPatient implements _PhoneNumberChangedPatient {
  const _$_PhoneNumberChangedPatient(this.phoneNumber);

  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'AuthenticateEvent.phoneNumberChangedPatient(phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PhoneNumberChangedPatient &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(phoneNumber));

  @JsonKey(ignore: true)
  @override
  _$$_PhoneNumberChangedPatientCopyWith<_$_PhoneNumberChangedPatient>
      get copyWith => __$$_PhoneNumberChangedPatientCopyWithImpl<
          _$_PhoneNumberChangedPatient>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber) phoneNumberChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function() loginRequested,
    required TResult Function(String phoneNumber, String password)
        registrationPatientRequested,
    required TResult Function(String phoneNumber, String password)
        registrationSupporterRequested,
    required TResult Function() authCheckRequested,
    required TResult Function() checkRegisterPatientRequested,
    required TResult Function() checkRegisterSupporterRequested,
    required TResult Function(String phoneNumber) phoneNumberChangedPatient,
    required TResult Function(String password) passwordChangedPatient,
    required TResult Function(String phoneNumber) phoneNumberChangedSupporter,
    required TResult Function(String password) passwordChangedSupporter,
  }) {
    return phoneNumberChangedPatient(phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String phoneNumber)? phoneNumberChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? loginRequested,
    TResult Function(String phoneNumber, String password)?
        registrationPatientRequested,
    TResult Function(String phoneNumber, String password)?
        registrationSupporterRequested,
    TResult Function()? authCheckRequested,
    TResult Function()? checkRegisterPatientRequested,
    TResult Function()? checkRegisterSupporterRequested,
    TResult Function(String phoneNumber)? phoneNumberChangedPatient,
    TResult Function(String password)? passwordChangedPatient,
    TResult Function(String phoneNumber)? phoneNumberChangedSupporter,
    TResult Function(String password)? passwordChangedSupporter,
  }) {
    return phoneNumberChangedPatient?.call(phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber)? phoneNumberChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? loginRequested,
    TResult Function(String phoneNumber, String password)?
        registrationPatientRequested,
    TResult Function(String phoneNumber, String password)?
        registrationSupporterRequested,
    TResult Function()? authCheckRequested,
    TResult Function()? checkRegisterPatientRequested,
    TResult Function()? checkRegisterSupporterRequested,
    TResult Function(String phoneNumber)? phoneNumberChangedPatient,
    TResult Function(String password)? passwordChangedPatient,
    TResult Function(String phoneNumber)? phoneNumberChangedSupporter,
    TResult Function(String password)? passwordChangedSupporter,
    required TResult orElse(),
  }) {
    if (phoneNumberChangedPatient != null) {
      return phoneNumberChangedPatient(phoneNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PhoneNumberChanged value) phoneNumberChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_LoginRequested value) loginRequested,
    required TResult Function(_RegistrationPatientRequested value)
        registrationPatientRequested,
    required TResult Function(_RegistrationSupporterRequested value)
        registrationSupporterRequested,
    required TResult Function(_AuthCheckRequested value) authCheckRequested,
    required TResult Function(_checkRegisterPatientRequested value)
        checkRegisterPatientRequested,
    required TResult Function(_checkRegisterSupporterRequested value)
        checkRegisterSupporterRequested,
    required TResult Function(_PhoneNumberChangedPatient value)
        phoneNumberChangedPatient,
    required TResult Function(_PasswordChangedPatient value)
        passwordChangedPatient,
    required TResult Function(_PhoneNumberChangedSupporter value)
        phoneNumberChangedSupporter,
    required TResult Function(_PasswordChangedSupporter value)
        passwordChangedSupporter,
  }) {
    return phoneNumberChangedPatient(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PhoneNumberChanged value)? phoneNumberChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_LoginRequested value)? loginRequested,
    TResult Function(_RegistrationPatientRequested value)?
        registrationPatientRequested,
    TResult Function(_RegistrationSupporterRequested value)?
        registrationSupporterRequested,
    TResult Function(_AuthCheckRequested value)? authCheckRequested,
    TResult Function(_checkRegisterPatientRequested value)?
        checkRegisterPatientRequested,
    TResult Function(_checkRegisterSupporterRequested value)?
        checkRegisterSupporterRequested,
    TResult Function(_PhoneNumberChangedPatient value)?
        phoneNumberChangedPatient,
    TResult Function(_PasswordChangedPatient value)? passwordChangedPatient,
    TResult Function(_PhoneNumberChangedSupporter value)?
        phoneNumberChangedSupporter,
    TResult Function(_PasswordChangedSupporter value)? passwordChangedSupporter,
  }) {
    return phoneNumberChangedPatient?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PhoneNumberChanged value)? phoneNumberChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_LoginRequested value)? loginRequested,
    TResult Function(_RegistrationPatientRequested value)?
        registrationPatientRequested,
    TResult Function(_RegistrationSupporterRequested value)?
        registrationSupporterRequested,
    TResult Function(_AuthCheckRequested value)? authCheckRequested,
    TResult Function(_checkRegisterPatientRequested value)?
        checkRegisterPatientRequested,
    TResult Function(_checkRegisterSupporterRequested value)?
        checkRegisterSupporterRequested,
    TResult Function(_PhoneNumberChangedPatient value)?
        phoneNumberChangedPatient,
    TResult Function(_PasswordChangedPatient value)? passwordChangedPatient,
    TResult Function(_PhoneNumberChangedSupporter value)?
        phoneNumberChangedSupporter,
    TResult Function(_PasswordChangedSupporter value)? passwordChangedSupporter,
    required TResult orElse(),
  }) {
    if (phoneNumberChangedPatient != null) {
      return phoneNumberChangedPatient(this);
    }
    return orElse();
  }
}

abstract class _PhoneNumberChangedPatient implements AuthenticateEvent {
  const factory _PhoneNumberChangedPatient(final String phoneNumber) =
      _$_PhoneNumberChangedPatient;

  String get phoneNumber;
  @JsonKey(ignore: true)
  _$$_PhoneNumberChangedPatientCopyWith<_$_PhoneNumberChangedPatient>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_PasswordChangedPatientCopyWith<$Res> {
  factory _$$_PasswordChangedPatientCopyWith(_$_PasswordChangedPatient value,
          $Res Function(_$_PasswordChangedPatient) then) =
      __$$_PasswordChangedPatientCopyWithImpl<$Res>;
  $Res call({String password});
}

/// @nodoc
class __$$_PasswordChangedPatientCopyWithImpl<$Res>
    extends _$AuthenticateEventCopyWithImpl<$Res>
    implements _$$_PasswordChangedPatientCopyWith<$Res> {
  __$$_PasswordChangedPatientCopyWithImpl(_$_PasswordChangedPatient _value,
      $Res Function(_$_PasswordChangedPatient) _then)
      : super(_value, (v) => _then(v as _$_PasswordChangedPatient));

  @override
  _$_PasswordChangedPatient get _value =>
      super._value as _$_PasswordChangedPatient;

  @override
  $Res call({
    Object? password = freezed,
  }) {
    return _then(_$_PasswordChangedPatient(
      password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_PasswordChangedPatient implements _PasswordChangedPatient {
  const _$_PasswordChangedPatient(this.password);

  @override
  final String password;

  @override
  String toString() {
    return 'AuthenticateEvent.passwordChangedPatient(password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PasswordChangedPatient &&
            const DeepCollectionEquality().equals(other.password, password));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(password));

  @JsonKey(ignore: true)
  @override
  _$$_PasswordChangedPatientCopyWith<_$_PasswordChangedPatient> get copyWith =>
      __$$_PasswordChangedPatientCopyWithImpl<_$_PasswordChangedPatient>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber) phoneNumberChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function() loginRequested,
    required TResult Function(String phoneNumber, String password)
        registrationPatientRequested,
    required TResult Function(String phoneNumber, String password)
        registrationSupporterRequested,
    required TResult Function() authCheckRequested,

    required TResult Function() Logout,

    required TResult Function() checkRegisterPatientRequested,
    required TResult Function() checkRegisterSupporterRequested,
    required TResult Function(String phoneNumber) phoneNumberChangedPatient,
    required TResult Function(String password) passwordChangedPatient,
    required TResult Function(String phoneNumber) phoneNumberChangedSupporter,
    required TResult Function(String password) passwordChangedSupporter,

  }) {
    return passwordChangedPatient(password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String phoneNumber)? phoneNumberChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? loginRequested,
    TResult Function(String phoneNumber, String password)?
        registrationPatientRequested,
    TResult Function(String phoneNumber, String password)?
        registrationSupporterRequested,
    TResult Function()? authCheckRequested,

    TResult Function()? Logout,

    TResult Function()? checkRegisterPatientRequested,
    TResult Function()? checkRegisterSupporterRequested,
    TResult Function(String phoneNumber)? phoneNumberChangedPatient,
    TResult Function(String password)? passwordChangedPatient,
    TResult Function(String phoneNumber)? phoneNumberChangedSupporter,
    TResult Function(String password)? passwordChangedSupporter,

  }) {
    return passwordChangedPatient?.call(password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber)? phoneNumberChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? loginRequested,
    TResult Function(String phoneNumber, String password)?
        registrationPatientRequested,
    TResult Function(String phoneNumber, String password)?
        registrationSupporterRequested,
    TResult Function()? authCheckRequested,

    TResult Function()? Logout,

    TResult Function()? checkRegisterPatientRequested,
    TResult Function()? checkRegisterSupporterRequested,
    TResult Function(String phoneNumber)? phoneNumberChangedPatient,
    TResult Function(String password)? passwordChangedPatient,
    TResult Function(String phoneNumber)? phoneNumberChangedSupporter,
    TResult Function(String password)? passwordChangedSupporter,

    required TResult orElse(),
  }) {
    if (passwordChangedPatient != null) {
      return passwordChangedPatient(password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PhoneNumberChanged value) phoneNumberChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_LoginRequested value) loginRequested,
    required TResult Function(_RegistrationPatientRequested value)
        registrationPatientRequested,
    required TResult Function(_RegistrationSupporterRequested value)
        registrationSupporterRequested,
    required TResult Function(_AuthCheckRequested value) authCheckRequested,

    required TResult Function(_LogoutRequested value) Logout,

    required TResult Function(_checkRegisterPatientRequested value)
        checkRegisterPatientRequested,
    required TResult Function(_checkRegisterSupporterRequested value)
        checkRegisterSupporterRequested,
    required TResult Function(_PhoneNumberChangedPatient value)
        phoneNumberChangedPatient,
    required TResult Function(_PasswordChangedPatient value)
        passwordChangedPatient,
    required TResult Function(_PhoneNumberChangedSupporter value)
        phoneNumberChangedSupporter,
    required TResult Function(_PasswordChangedSupporter value)
        passwordChangedSupporter,

  }) {
    return passwordChangedPatient(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PhoneNumberChanged value)? phoneNumberChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_LoginRequested value)? loginRequested,
    TResult Function(_RegistrationPatientRequested value)?
        registrationPatientRequested,
    TResult Function(_RegistrationSupporterRequested value)?
        registrationSupporterRequested,
    TResult Function(_AuthCheckRequested value)? authCheckRequested,

    TResult Function(_LogoutRequested value)? Logout,

    TResult Function(_checkRegisterPatientRequested value)?
        checkRegisterPatientRequested,
    TResult Function(_checkRegisterSupporterRequested value)?
        checkRegisterSupporterRequested,
    TResult Function(_PhoneNumberChangedPatient value)?
        phoneNumberChangedPatient,
    TResult Function(_PasswordChangedPatient value)? passwordChangedPatient,
    TResult Function(_PhoneNumberChangedSupporter value)?
        phoneNumberChangedSupporter,
    TResult Function(_PasswordChangedSupporter value)? passwordChangedSupporter,

  }) {
    return passwordChangedPatient?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PhoneNumberChanged value)? phoneNumberChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_LoginRequested value)? loginRequested,
    TResult Function(_RegistrationPatientRequested value)?
        registrationPatientRequested,
    TResult Function(_RegistrationSupporterRequested value)?
        registrationSupporterRequested,
    TResult Function(_AuthCheckRequested value)? authCheckRequested,

    TResult Function(_LogoutRequested value)? Logout,

    TResult Function(_checkRegisterPatientRequested value)?
        checkRegisterPatientRequested,
    TResult Function(_checkRegisterSupporterRequested value)?
        checkRegisterSupporterRequested,
    TResult Function(_PhoneNumberChangedPatient value)?
        phoneNumberChangedPatient,
    TResult Function(_PasswordChangedPatient value)? passwordChangedPatient,
    TResult Function(_PhoneNumberChangedSupporter value)?
        phoneNumberChangedSupporter,
    TResult Function(_PasswordChangedSupporter value)? passwordChangedSupporter,

    required TResult orElse(),
  }) {
    if (passwordChangedPatient != null) {
      return passwordChangedPatient(this);
    }
    return orElse();
  }
}

abstract class _PasswordChangedPatient implements AuthenticateEvent {
  const factory _PasswordChangedPatient(final String password) =
      _$_PasswordChangedPatient;

  String get password;
  @JsonKey(ignore: true)
  _$$_PasswordChangedPatientCopyWith<_$_PasswordChangedPatient> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_PhoneNumberChangedSupporterCopyWith<$Res> {
  factory _$$_PhoneNumberChangedSupporterCopyWith(
          _$_PhoneNumberChangedSupporter value,
          $Res Function(_$_PhoneNumberChangedSupporter) then) =
      __$$_PhoneNumberChangedSupporterCopyWithImpl<$Res>;
  $Res call({String phoneNumber});
}

/// @nodoc
class __$$_PhoneNumberChangedSupporterCopyWithImpl<$Res>
    extends _$AuthenticateEventCopyWithImpl<$Res>
    implements _$$_PhoneNumberChangedSupporterCopyWith<$Res> {
  __$$_PhoneNumberChangedSupporterCopyWithImpl(
      _$_PhoneNumberChangedSupporter _value,
      $Res Function(_$_PhoneNumberChangedSupporter) _then)
      : super(_value, (v) => _then(v as _$_PhoneNumberChangedSupporter));

  @override
  _$_PhoneNumberChangedSupporter get _value =>
      super._value as _$_PhoneNumberChangedSupporter;

  @override
  $Res call({
    Object? phoneNumber = freezed,
  }) {
    return _then(_$_PhoneNumberChangedSupporter(
      phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_PhoneNumberChangedSupporter implements _PhoneNumberChangedSupporter {
  const _$_PhoneNumberChangedSupporter(this.phoneNumber);

  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'AuthenticateEvent.phoneNumberChangedSupporter(phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PhoneNumberChangedSupporter &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(phoneNumber));

  @JsonKey(ignore: true)
  @override
  _$$_PhoneNumberChangedSupporterCopyWith<_$_PhoneNumberChangedSupporter>
      get copyWith => __$$_PhoneNumberChangedSupporterCopyWithImpl<
          _$_PhoneNumberChangedSupporter>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber) phoneNumberChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function() loginRequested,
    required TResult Function(String phoneNumber, String password)
        registrationPatientRequested,
    required TResult Function(String phoneNumber, String password)
        registrationSupporterRequested,
    required TResult Function() authCheckRequested,

    required TResult Function() Logout,

    required TResult Function() checkRegisterPatientRequested,
    required TResult Function() checkRegisterSupporterRequested,
    required TResult Function(String phoneNumber) phoneNumberChangedPatient,
    required TResult Function(String password) passwordChangedPatient,
    required TResult Function(String phoneNumber) phoneNumberChangedSupporter,
    required TResult Function(String password) passwordChangedSupporter,

  }) {
    return phoneNumberChangedSupporter(phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String phoneNumber)? phoneNumberChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? loginRequested,
    TResult Function(String phoneNumber, String password)?
        registrationPatientRequested,
    TResult Function(String phoneNumber, String password)?
        registrationSupporterRequested,
    TResult Function()? authCheckRequested,

    TResult Function()? Logout,

    TResult Function()? checkRegisterPatientRequested,
    TResult Function()? checkRegisterSupporterRequested,
    TResult Function(String phoneNumber)? phoneNumberChangedPatient,
    TResult Function(String password)? passwordChangedPatient,
    TResult Function(String phoneNumber)? phoneNumberChangedSupporter,
    TResult Function(String password)? passwordChangedSupporter,

  }) {
    return phoneNumberChangedSupporter?.call(phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber)? phoneNumberChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? loginRequested,
    TResult Function(String phoneNumber, String password)?
        registrationPatientRequested,
    TResult Function(String phoneNumber, String password)?
        registrationSupporterRequested,
    TResult Function()? authCheckRequested,

    TResult Function()? Logout,

    TResult Function()? checkRegisterPatientRequested,
    TResult Function()? checkRegisterSupporterRequested,
    TResult Function(String phoneNumber)? phoneNumberChangedPatient,
    TResult Function(String password)? passwordChangedPatient,
    TResult Function(String phoneNumber)? phoneNumberChangedSupporter,
    TResult Function(String password)? passwordChangedSupporter,

    required TResult orElse(),
  }) {
    if (phoneNumberChangedSupporter != null) {
      return phoneNumberChangedSupporter(phoneNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PhoneNumberChanged value) phoneNumberChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_LoginRequested value) loginRequested,
    required TResult Function(_RegistrationPatientRequested value)
        registrationPatientRequested,
    required TResult Function(_RegistrationSupporterRequested value)
        registrationSupporterRequested,
    required TResult Function(_AuthCheckRequested value) authCheckRequested,

    required TResult Function(_LogoutRequested value) Logout,

    required TResult Function(_checkRegisterPatientRequested value)
        checkRegisterPatientRequested,
    required TResult Function(_checkRegisterSupporterRequested value)
        checkRegisterSupporterRequested,
    required TResult Function(_PhoneNumberChangedPatient value)
        phoneNumberChangedPatient,
    required TResult Function(_PasswordChangedPatient value)
        passwordChangedPatient,
    required TResult Function(_PhoneNumberChangedSupporter value)
        phoneNumberChangedSupporter,
    required TResult Function(_PasswordChangedSupporter value)
        passwordChangedSupporter,

  }) {
    return phoneNumberChangedSupporter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PhoneNumberChanged value)? phoneNumberChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_LoginRequested value)? loginRequested,
    TResult Function(_RegistrationPatientRequested value)?
        registrationPatientRequested,
    TResult Function(_RegistrationSupporterRequested value)?
        registrationSupporterRequested,
    TResult Function(_AuthCheckRequested value)? authCheckRequested,

    TResult Function(_LogoutRequested value)? Logout,

    TResult Function(_checkRegisterPatientRequested value)?
        checkRegisterPatientRequested,
    TResult Function(_checkRegisterSupporterRequested value)?
        checkRegisterSupporterRequested,
    TResult Function(_PhoneNumberChangedPatient value)?
        phoneNumberChangedPatient,
    TResult Function(_PasswordChangedPatient value)? passwordChangedPatient,
    TResult Function(_PhoneNumberChangedSupporter value)?
        phoneNumberChangedSupporter,
    TResult Function(_PasswordChangedSupporter value)? passwordChangedSupporter,

  }) {
    return phoneNumberChangedSupporter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PhoneNumberChanged value)? phoneNumberChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_LoginRequested value)? loginRequested,
    TResult Function(_RegistrationPatientRequested value)?
        registrationPatientRequested,
    TResult Function(_RegistrationSupporterRequested value)?
        registrationSupporterRequested,
    TResult Function(_AuthCheckRequested value)? authCheckRequested,

    TResult Function(_LogoutRequested value)? Logout,

    TResult Function(_checkRegisterPatientRequested value)?
        checkRegisterPatientRequested,
    TResult Function(_checkRegisterSupporterRequested value)?
        checkRegisterSupporterRequested,
    TResult Function(_PhoneNumberChangedPatient value)?
        phoneNumberChangedPatient,
    TResult Function(_PasswordChangedPatient value)? passwordChangedPatient,
    TResult Function(_PhoneNumberChangedSupporter value)?
        phoneNumberChangedSupporter,
    TResult Function(_PasswordChangedSupporter value)? passwordChangedSupporter,

    required TResult orElse(),
  }) {
    if (phoneNumberChangedSupporter != null) {
      return phoneNumberChangedSupporter(this);
    }
    return orElse();
  }
}

abstract class _PhoneNumberChangedSupporter implements AuthenticateEvent {
  const factory _PhoneNumberChangedSupporter(final String phoneNumber) =
      _$_PhoneNumberChangedSupporter;

  String get phoneNumber;
  @JsonKey(ignore: true)
  _$$_PhoneNumberChangedSupporterCopyWith<_$_PhoneNumberChangedSupporter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_PasswordChangedSupporterCopyWith<$Res> {
  factory _$$_PasswordChangedSupporterCopyWith(
          _$_PasswordChangedSupporter value,
          $Res Function(_$_PasswordChangedSupporter) then) =
      __$$_PasswordChangedSupporterCopyWithImpl<$Res>;
  $Res call({String password});
}

/// @nodoc
class __$$_PasswordChangedSupporterCopyWithImpl<$Res>
    extends _$AuthenticateEventCopyWithImpl<$Res>
    implements _$$_PasswordChangedSupporterCopyWith<$Res> {
  __$$_PasswordChangedSupporterCopyWithImpl(_$_PasswordChangedSupporter _value,
      $Res Function(_$_PasswordChangedSupporter) _then)
      : super(_value, (v) => _then(v as _$_PasswordChangedSupporter));

  @override
  _$_PasswordChangedSupporter get _value =>
      super._value as _$_PasswordChangedSupporter;

  @override
  $Res call({
    Object? password = freezed,
  }) {
    return _then(_$_PasswordChangedSupporter(
      password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_PasswordChangedSupporter implements _PasswordChangedSupporter {
  const _$_PasswordChangedSupporter(this.password);

  @override
  final String password;

  @override
  String toString() {
    return 'AuthenticateEvent.passwordChangedSupporter(password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PasswordChangedSupporter &&
            const DeepCollectionEquality().equals(other.password, password));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(password));

  @JsonKey(ignore: true)
  @override
  _$$_PasswordChangedSupporterCopyWith<_$_PasswordChangedSupporter>
      get copyWith => __$$_PasswordChangedSupporterCopyWithImpl<
          _$_PasswordChangedSupporter>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber) phoneNumberChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function() loginRequested,
    required TResult Function(String phoneNumber, String password)
        registrationPatientRequested,
    required TResult Function(String phoneNumber, String password)
        registrationSupporterRequested,
    required TResult Function() authCheckRequested,
    required TResult Function() checkRegisterPatientRequested,
    required TResult Function() checkRegisterSupporterRequested,
    required TResult Function(String phoneNumber) phoneNumberChangedPatient,
    required TResult Function(String password) passwordChangedPatient,
    required TResult Function(String phoneNumber) phoneNumberChangedSupporter,
    required TResult Function(String password) passwordChangedSupporter,
  }) {
    return passwordChangedSupporter(password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String phoneNumber)? phoneNumberChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? loginRequested,
    TResult Function(String phoneNumber, String password)?
        registrationPatientRequested,
    TResult Function(String phoneNumber, String password)?
        registrationSupporterRequested,
    TResult Function()? authCheckRequested,
    TResult Function()? checkRegisterPatientRequested,
    TResult Function()? checkRegisterSupporterRequested,
    TResult Function(String phoneNumber)? phoneNumberChangedPatient,
    TResult Function(String password)? passwordChangedPatient,
    TResult Function(String phoneNumber)? phoneNumberChangedSupporter,
    TResult Function(String password)? passwordChangedSupporter,
  }) {
    return passwordChangedSupporter?.call(password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber)? phoneNumberChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? loginRequested,
    TResult Function(String phoneNumber, String password)?
        registrationPatientRequested,
    TResult Function(String phoneNumber, String password)?
        registrationSupporterRequested,
    TResult Function()? authCheckRequested,
    TResult Function()? checkRegisterPatientRequested,
    TResult Function()? checkRegisterSupporterRequested,
    TResult Function(String phoneNumber)? phoneNumberChangedPatient,
    TResult Function(String password)? passwordChangedPatient,
    TResult Function(String phoneNumber)? phoneNumberChangedSupporter,
    TResult Function(String password)? passwordChangedSupporter,
    required TResult orElse(),
  }) {
    if (passwordChangedSupporter != null) {
      return passwordChangedSupporter(password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PhoneNumberChanged value) phoneNumberChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_LoginRequested value) loginRequested,
    required TResult Function(_RegistrationPatientRequested value)
        registrationPatientRequested,
    required TResult Function(_RegistrationSupporterRequested value)
        registrationSupporterRequested,
    required TResult Function(_AuthCheckRequested value) authCheckRequested,
    required TResult Function(_checkRegisterPatientRequested value)
        checkRegisterPatientRequested,
    required TResult Function(_checkRegisterSupporterRequested value)
        checkRegisterSupporterRequested,
    required TResult Function(_PhoneNumberChangedPatient value)
        phoneNumberChangedPatient,
    required TResult Function(_PasswordChangedPatient value)
        passwordChangedPatient,
    required TResult Function(_PhoneNumberChangedSupporter value)
        phoneNumberChangedSupporter,
    required TResult Function(_PasswordChangedSupporter value)
        passwordChangedSupporter,
  }) {
    return passwordChangedSupporter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PhoneNumberChanged value)? phoneNumberChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_LoginRequested value)? loginRequested,
    TResult Function(_RegistrationPatientRequested value)?
        registrationPatientRequested,
    TResult Function(_RegistrationSupporterRequested value)?
        registrationSupporterRequested,
    TResult Function(_AuthCheckRequested value)? authCheckRequested,
    TResult Function(_checkRegisterPatientRequested value)?
        checkRegisterPatientRequested,
    TResult Function(_checkRegisterSupporterRequested value)?
        checkRegisterSupporterRequested,
    TResult Function(_PhoneNumberChangedPatient value)?
        phoneNumberChangedPatient,
    TResult Function(_PasswordChangedPatient value)? passwordChangedPatient,
    TResult Function(_PhoneNumberChangedSupporter value)?
        phoneNumberChangedSupporter,
    TResult Function(_PasswordChangedSupporter value)? passwordChangedSupporter,
  }) {
    return passwordChangedSupporter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PhoneNumberChanged value)? phoneNumberChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_LoginRequested value)? loginRequested,
    TResult Function(_RegistrationPatientRequested value)?
        registrationPatientRequested,
    TResult Function(_RegistrationSupporterRequested value)?
        registrationSupporterRequested,
    TResult Function(_AuthCheckRequested value)? authCheckRequested,
    TResult Function(_checkRegisterPatientRequested value)?
        checkRegisterPatientRequested,
    TResult Function(_checkRegisterSupporterRequested value)?
        checkRegisterSupporterRequested,
    TResult Function(_PhoneNumberChangedPatient value)?
        phoneNumberChangedPatient,
    TResult Function(_PasswordChangedPatient value)? passwordChangedPatient,
    TResult Function(_PhoneNumberChangedSupporter value)?
        phoneNumberChangedSupporter,
    TResult Function(_PasswordChangedSupporter value)? passwordChangedSupporter,
    required TResult orElse(),
  }) {
    if (passwordChangedSupporter != null) {
      return passwordChangedSupporter(this);
    }
    return orElse();
  }
}

abstract class _PasswordChangedSupporter implements AuthenticateEvent {
  const factory _PasswordChangedSupporter(final String password) =
      _$_PasswordChangedSupporter;

  String get password;
  @JsonKey(ignore: true)
  _$$_PasswordChangedSupporterCopyWith<_$_PasswordChangedSupporter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LogoutRequestedCopyWith<$Res> {
  factory _$$_LogoutRequestedCopyWith(
          _$_LogoutRequested value, $Res Function(_$_LogoutRequested) then) =
      __$$_LogoutRequestedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LogoutRequestedCopyWithImpl<$Res>
    extends _$AuthenticateEventCopyWithImpl<$Res>
    implements _$$_LogoutRequestedCopyWith<$Res> {
  __$$_LogoutRequestedCopyWithImpl(
      _$_LogoutRequested _value, $Res Function(_$_LogoutRequested) _then)
      : super(_value, (v) => _then(v as _$_LogoutRequested));

  @override
  _$_LogoutRequested get _value => super._value as _$_LogoutRequested;
}

/// @nodoc

class _$_LogoutRequested implements _LogoutRequested {
  const _$_LogoutRequested();

  @override
  String toString() {
    return 'AuthenticateEvent.Logout()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_LogoutRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber) phoneNumberChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function() loginRequested,
    required TResult Function() registrationRequested,
    required TResult Function() authCheckRequested,
    required TResult Function() Logout,
  }) {
    return Logout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String phoneNumber)? phoneNumberChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? loginRequested,
    TResult Function()? registrationRequested,
    TResult Function()? authCheckRequested,
    TResult Function()? Logout,
  }) {
    return Logout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber)? phoneNumberChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? loginRequested,
    TResult Function()? registrationRequested,
    TResult Function()? authCheckRequested,
    TResult Function()? Logout,
    required TResult orElse(),
  }) {
    if (Logout != null) {
      return Logout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PhoneNumberChanged value) phoneNumberChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_LoginRequested value) loginRequested,
    required TResult Function(_RegistrationRequested value)
        registrationRequested,
    required TResult Function(_AuthCheckRequested value) authCheckRequested,
    required TResult Function(_LogoutRequested value) Logout,
  }) {
    return Logout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PhoneNumberChanged value)? phoneNumberChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_LoginRequested value)? loginRequested,
    TResult Function(_RegistrationRequested value)? registrationRequested,
    TResult Function(_AuthCheckRequested value)? authCheckRequested,
    TResult Function(_LogoutRequested value)? Logout,
  }) {
    return Logout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PhoneNumberChanged value)? phoneNumberChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_LoginRequested value)? loginRequested,
    TResult Function(_RegistrationRequested value)? registrationRequested,
    TResult Function(_AuthCheckRequested value)? authCheckRequested,
    TResult Function(_LogoutRequested value)? Logout,
    required TResult orElse(),
  }) {
    if (Logout != null) {
      return Logout(this);
    }
    return orElse();
  }
}

abstract class _LogoutRequested implements AuthenticateEvent {
  const factory _LogoutRequested() = _$_LogoutRequested;
}

/// @nodoc
mixin _$AuthenticateState {
  String get userId => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get phoneNumberPatient => throw _privateConstructorUsedError;
  String get passwordPatient => throw _privateConstructorUsedError;
  String get phoneNumberSupporter => throw _privateConstructorUsedError;
  String get passwordSupporter => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  bool get isAuthenticated => throw _privateConstructorUsedError;

  String get relationshipWith => throw _privateConstructorUsedError;

  bool get isRegisterPatient => throw _privateConstructorUsedError;
  bool get isRegisterSupporter => throw _privateConstructorUsedError;

  String? get role => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthenticateStateCopyWith<AuthenticateState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticateStateCopyWith<$Res> {
  factory $AuthenticateStateCopyWith(
          AuthenticateState value, $Res Function(AuthenticateState) then) =
      _$AuthenticateStateCopyWithImpl<$Res>;
  $Res call(
      {String userId,
      String phoneNumber,
      String password,
      String phoneNumberPatient,
      String passwordPatient,
      String phoneNumberSupporter,
      String passwordSupporter,
      String fullName,
      bool isAuthenticated,

      String relationshipWith,

      bool isRegisterPatient,
      bool isRegisterSupporter,

      String? role,
      String? errorMessage});
}

/// @nodoc
class _$AuthenticateStateCopyWithImpl<$Res>
    implements $AuthenticateStateCopyWith<$Res> {
  _$AuthenticateStateCopyWithImpl(this._value, this._then);

  final AuthenticateState _value;
  // ignore: unused_field
  final $Res Function(AuthenticateState) _then;

  @override
  $Res call({
    Object? userId = freezed,
    Object? phoneNumber = freezed,
    Object? password = freezed,
    Object? phoneNumberPatient = freezed,
    Object? passwordPatient = freezed,
    Object? phoneNumberSupporter = freezed,
    Object? passwordSupporter = freezed,
    Object? fullName = freezed,
    Object? isAuthenticated = freezed,

    Object? relationshipWith = freezed,

    Object? isRegisterPatient = freezed,
    Object? isRegisterSupporter = freezed,

    Object? role = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumberPatient: phoneNumberPatient == freezed
          ? _value.phoneNumberPatient
          : phoneNumberPatient // ignore: cast_nullable_to_non_nullable
              as String,
      passwordPatient: passwordPatient == freezed
          ? _value.passwordPatient
          : passwordPatient // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumberSupporter: phoneNumberSupporter == freezed
          ? _value.phoneNumberSupporter
          : phoneNumberSupporter // ignore: cast_nullable_to_non_nullable
              as String,
      passwordSupporter: passwordSupporter == freezed
          ? _value.passwordSupporter
          : passwordSupporter // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: fullName == freezed
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      isAuthenticated: isAuthenticated == freezed
          ? _value.isAuthenticated
          : isAuthenticated // ignore: cast_nullable_to_non_nullable
              as bool,

      relationshipWith: relationshipWith == freezed
          ? _value.relationshipWith
          : relationshipWith // ignore: cast_nullable_to_non_nullable
              as String,

      isRegisterPatient: isRegisterPatient == freezed
          ? _value.isRegisterPatient
          : isRegisterPatient // ignore: cast_nullable_to_non_nullable
              as bool,
      isRegisterSupporter: isRegisterSupporter == freezed
          ? _value.isRegisterSupporter
          : isRegisterSupporter // ignore: cast_nullable_to_non_nullable
              as bool,

      role: role == freezed
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_AuthenticateStateCopyWith<$Res>
    implements $AuthenticateStateCopyWith<$Res> {
  factory _$$_AuthenticateStateCopyWith(_$_AuthenticateState value,
          $Res Function(_$_AuthenticateState) then) =
      __$$_AuthenticateStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String userId,
      String phoneNumber,
      String password,
      String phoneNumberPatient,
      String passwordPatient,
      String phoneNumberSupporter,
      String passwordSupporter,
      String fullName,
      bool isAuthenticated,

      String relationshipWith,

      bool isRegisterPatient,
      bool isRegisterSupporter,

      String? role,
      String? errorMessage});
}

/// @nodoc
class __$$_AuthenticateStateCopyWithImpl<$Res>
    extends _$AuthenticateStateCopyWithImpl<$Res>
    implements _$$_AuthenticateStateCopyWith<$Res> {
  __$$_AuthenticateStateCopyWithImpl(
      _$_AuthenticateState _value, $Res Function(_$_AuthenticateState) _then)
      : super(_value, (v) => _then(v as _$_AuthenticateState));

  @override
  _$_AuthenticateState get _value => super._value as _$_AuthenticateState;

  @override
  $Res call({
    Object? userId = freezed,
    Object? phoneNumber = freezed,
    Object? password = freezed,
    Object? phoneNumberPatient = freezed,
    Object? passwordPatient = freezed,
    Object? phoneNumberSupporter = freezed,
    Object? passwordSupporter = freezed,
    Object? fullName = freezed,
    Object? isAuthenticated = freezed,

    Object? relationshipWith = freezed,

    Object? isRegisterPatient = freezed,
    Object? isRegisterSupporter = freezed,

    Object? role = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_AuthenticateState(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumberPatient: phoneNumberPatient == freezed
          ? _value.phoneNumberPatient
          : phoneNumberPatient // ignore: cast_nullable_to_non_nullable
              as String,
      passwordPatient: passwordPatient == freezed
          ? _value.passwordPatient
          : passwordPatient // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumberSupporter: phoneNumberSupporter == freezed
          ? _value.phoneNumberSupporter
          : phoneNumberSupporter // ignore: cast_nullable_to_non_nullable
              as String,
      passwordSupporter: passwordSupporter == freezed
          ? _value.passwordSupporter
          : passwordSupporter // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: fullName == freezed
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      isAuthenticated: isAuthenticated == freezed
          ? _value.isAuthenticated
          : isAuthenticated // ignore: cast_nullable_to_non_nullable
              as bool,

      relationshipWith: relationshipWith == freezed
          ? _value.relationshipWith
          : relationshipWith // ignore: cast_nullable_to_non_nullable
              as String,

      isRegisterPatient: isRegisterPatient == freezed
          ? _value.isRegisterPatient
          : isRegisterPatient // ignore: cast_nullable_to_non_nullable
              as bool,
      isRegisterSupporter: isRegisterSupporter == freezed
          ? _value.isRegisterSupporter
          : isRegisterSupporter // ignore: cast_nullable_to_non_nullable
              as bool,

      role: role == freezed
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_AuthenticateState implements _AuthenticateState {
  const _$_AuthenticateState(
      {required this.userId,
      required this.phoneNumber,
      required this.password,
      required this.phoneNumberPatient,
      required this.passwordPatient,
      required this.phoneNumberSupporter,
      required this.passwordSupporter,
      required this.fullName,
      required this.isAuthenticated,

      required this.relationshipWith,

      required this.isRegisterPatient,
      required this.isRegisterSupporter,

      this.role,
      this.errorMessage});

  @override
  final String userId;
  @override
  final String phoneNumber;
  @override
  final String password;
  @override
  final String phoneNumberPatient;
  @override
  final String passwordPatient;
  @override
  final String phoneNumberSupporter;
  @override
  final String passwordSupporter;
  @override
  final String fullName;
  @override
  final bool isAuthenticated;
  @override

  final String relationshipWith;

  final bool isRegisterPatient;
  @override
  final bool isRegisterSupporter;

  @override
  final String? role;
  @override
  final String? errorMessage;

  @override
  String toString() {

    return 'AuthenticateState(userId: $userId, phoneNumber: $phoneNumber, password: $password, fullName: $fullName, isAuthenticated: $isAuthenticated, relationshipWith: $relationshipWith, role: $role, errorMessage: $errorMessage)';

    return 'AuthenticateState(userId: $userId, phoneNumber: $phoneNumber, password: $password, phoneNumberPatient: $phoneNumberPatient, passwordPatient: $passwordPatient, phoneNumberSupporter: $phoneNumberSupporter, passwordSupporter: $passwordSupporter, fullName: $fullName, isAuthenticated: $isAuthenticated, isRegisterPatient: $isRegisterPatient, isRegisterSupporter: $isRegisterSupporter, role: $role, errorMessage: $errorMessage)';

  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthenticateState &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality()
                .equals(other.phoneNumberPatient, phoneNumberPatient) &&
            const DeepCollectionEquality()
                .equals(other.passwordPatient, passwordPatient) &&
            const DeepCollectionEquality()
                .equals(other.phoneNumberSupporter, phoneNumberSupporter) &&
            const DeepCollectionEquality()
                .equals(other.passwordSupporter, passwordSupporter) &&
            const DeepCollectionEquality().equals(other.fullName, fullName) &&
            const DeepCollectionEquality()
                .equals(other.isAuthenticated, isAuthenticated) &&
            const DeepCollectionEquality()

                .equals(other.relationshipWith, relationshipWith) &&

                .equals(other.isRegisterPatient, isRegisterPatient) &&
            const DeepCollectionEquality()
                .equals(other.isRegisterSupporter, isRegisterSupporter) &&

            const DeepCollectionEquality().equals(other.role, role) &&
            const DeepCollectionEquality()
                .equals(other.errorMessage, errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(phoneNumber),
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(phoneNumberPatient),
      const DeepCollectionEquality().hash(passwordPatient),
      const DeepCollectionEquality().hash(phoneNumberSupporter),
      const DeepCollectionEquality().hash(passwordSupporter),
      const DeepCollectionEquality().hash(fullName),
      const DeepCollectionEquality().hash(isAuthenticated),

      const DeepCollectionEquality().hash(relationshipWith),

      const DeepCollectionEquality().hash(isRegisterPatient),
      const DeepCollectionEquality().hash(isRegisterSupporter),

      const DeepCollectionEquality().hash(role),
      const DeepCollectionEquality().hash(errorMessage));

  @JsonKey(ignore: true)
  @override
  _$$_AuthenticateStateCopyWith<_$_AuthenticateState> get copyWith =>
      __$$_AuthenticateStateCopyWithImpl<_$_AuthenticateState>(
          this, _$identity);
}

abstract class _AuthenticateState implements AuthenticateState {
  const factory _AuthenticateState(
      {required final String userId,
      required final String phoneNumber,
      required final String password,
      required final String phoneNumberPatient,
      required final String passwordPatient,
      required final String phoneNumberSupporter,
      required final String passwordSupporter,
      required final String fullName,
      required final bool isAuthenticated,

      required final String relationshipWith,

      required final bool isRegisterPatient,
      required final bool isRegisterSupporter,

      final String? role,
      final String? errorMessage}) = _$_AuthenticateState;

  @override
  String get userId;
  @override
  String get phoneNumber;
  @override
  String get password;
  @override
  String get phoneNumberPatient;
  @override
  String get passwordPatient;
  @override
  String get phoneNumberSupporter;
  @override
  String get passwordSupporter;
  @override
  String get fullName;
  @override
  bool get isAuthenticated;
  @override

  String get relationshipWith;

  bool get isRegisterPatient;
  @override
  bool get isRegisterSupporter;

  @override
  String? get role;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_AuthenticateStateCopyWith<_$_AuthenticateState> get copyWith =>
      throw _privateConstructorUsedError;
}
