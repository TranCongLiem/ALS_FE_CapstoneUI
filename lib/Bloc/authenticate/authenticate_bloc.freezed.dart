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
    required TResult Function() registrationRequested,
    required TResult Function() authCheckRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String phoneNumber)? phoneNumberChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? loginRequested,
    TResult Function()? registrationRequested,
    TResult Function()? authCheckRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber)? phoneNumberChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? loginRequested,
    TResult Function()? registrationRequested,
    TResult Function()? authCheckRequested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PhoneNumberChanged value) phoneNumberChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_LoginRequested value) loginRequested,
    required TResult Function(_RegistrationRequested value)
        registrationRequested,
    required TResult Function(_AuthCheckRequested value) authCheckRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PhoneNumberChanged value)? phoneNumberChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_LoginRequested value)? loginRequested,
    TResult Function(_RegistrationRequested value)? registrationRequested,
    TResult Function(_AuthCheckRequested value)? authCheckRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PhoneNumberChanged value)? phoneNumberChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_LoginRequested value)? loginRequested,
    TResult Function(_RegistrationRequested value)? registrationRequested,
    TResult Function(_AuthCheckRequested value)? authCheckRequested,
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
    required TResult Function() registrationRequested,
    required TResult Function() authCheckRequested,
  }) {
    return phoneNumberChanged(phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String phoneNumber)? phoneNumberChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? loginRequested,
    TResult Function()? registrationRequested,
    TResult Function()? authCheckRequested,
  }) {
    return phoneNumberChanged?.call(phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber)? phoneNumberChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? loginRequested,
    TResult Function()? registrationRequested,
    TResult Function()? authCheckRequested,
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
    required TResult Function(_RegistrationRequested value)
        registrationRequested,
    required TResult Function(_AuthCheckRequested value) authCheckRequested,
  }) {
    return phoneNumberChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PhoneNumberChanged value)? phoneNumberChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_LoginRequested value)? loginRequested,
    TResult Function(_RegistrationRequested value)? registrationRequested,
    TResult Function(_AuthCheckRequested value)? authCheckRequested,
  }) {
    return phoneNumberChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PhoneNumberChanged value)? phoneNumberChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_LoginRequested value)? loginRequested,
    TResult Function(_RegistrationRequested value)? registrationRequested,
    TResult Function(_AuthCheckRequested value)? authCheckRequested,
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
    required TResult Function() registrationRequested,
    required TResult Function() authCheckRequested,
  }) {
    return passwordChanged(password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String phoneNumber)? phoneNumberChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? loginRequested,
    TResult Function()? registrationRequested,
    TResult Function()? authCheckRequested,
  }) {
    return passwordChanged?.call(password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber)? phoneNumberChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? loginRequested,
    TResult Function()? registrationRequested,
    TResult Function()? authCheckRequested,
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
    required TResult Function(_RegistrationRequested value)
        registrationRequested,
    required TResult Function(_AuthCheckRequested value) authCheckRequested,
  }) {
    return passwordChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PhoneNumberChanged value)? phoneNumberChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_LoginRequested value)? loginRequested,
    TResult Function(_RegistrationRequested value)? registrationRequested,
    TResult Function(_AuthCheckRequested value)? authCheckRequested,
  }) {
    return passwordChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PhoneNumberChanged value)? phoneNumberChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_LoginRequested value)? loginRequested,
    TResult Function(_RegistrationRequested value)? registrationRequested,
    TResult Function(_AuthCheckRequested value)? authCheckRequested,
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
    required TResult Function() registrationRequested,
    required TResult Function() authCheckRequested,
  }) {
    return loginRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String phoneNumber)? phoneNumberChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? loginRequested,
    TResult Function()? registrationRequested,
    TResult Function()? authCheckRequested,
  }) {
    return loginRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber)? phoneNumberChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? loginRequested,
    TResult Function()? registrationRequested,
    TResult Function()? authCheckRequested,
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
    required TResult Function(_RegistrationRequested value)
        registrationRequested,
    required TResult Function(_AuthCheckRequested value) authCheckRequested,
  }) {
    return loginRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PhoneNumberChanged value)? phoneNumberChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_LoginRequested value)? loginRequested,
    TResult Function(_RegistrationRequested value)? registrationRequested,
    TResult Function(_AuthCheckRequested value)? authCheckRequested,
  }) {
    return loginRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PhoneNumberChanged value)? phoneNumberChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_LoginRequested value)? loginRequested,
    TResult Function(_RegistrationRequested value)? registrationRequested,
    TResult Function(_AuthCheckRequested value)? authCheckRequested,
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
abstract class _$$_RegistrationRequestedCopyWith<$Res> {
  factory _$$_RegistrationRequestedCopyWith(_$_RegistrationRequested value,
          $Res Function(_$_RegistrationRequested) then) =
      __$$_RegistrationRequestedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_RegistrationRequestedCopyWithImpl<$Res>
    extends _$AuthenticateEventCopyWithImpl<$Res>
    implements _$$_RegistrationRequestedCopyWith<$Res> {
  __$$_RegistrationRequestedCopyWithImpl(_$_RegistrationRequested _value,
      $Res Function(_$_RegistrationRequested) _then)
      : super(_value, (v) => _then(v as _$_RegistrationRequested));

  @override
  _$_RegistrationRequested get _value =>
      super._value as _$_RegistrationRequested;
}

/// @nodoc

class _$_RegistrationRequested implements _RegistrationRequested {
  const _$_RegistrationRequested();

  @override
  String toString() {
    return 'AuthenticateEvent.registrationRequested()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_RegistrationRequested);
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
  }) {
    return registrationRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String phoneNumber)? phoneNumberChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? loginRequested,
    TResult Function()? registrationRequested,
    TResult Function()? authCheckRequested,
  }) {
    return registrationRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber)? phoneNumberChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? loginRequested,
    TResult Function()? registrationRequested,
    TResult Function()? authCheckRequested,
    required TResult orElse(),
  }) {
    if (registrationRequested != null) {
      return registrationRequested();
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
  }) {
    return registrationRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PhoneNumberChanged value)? phoneNumberChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_LoginRequested value)? loginRequested,
    TResult Function(_RegistrationRequested value)? registrationRequested,
    TResult Function(_AuthCheckRequested value)? authCheckRequested,
  }) {
    return registrationRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PhoneNumberChanged value)? phoneNumberChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_LoginRequested value)? loginRequested,
    TResult Function(_RegistrationRequested value)? registrationRequested,
    TResult Function(_AuthCheckRequested value)? authCheckRequested,
    required TResult orElse(),
  }) {
    if (registrationRequested != null) {
      return registrationRequested(this);
    }
    return orElse();
  }
}

abstract class _RegistrationRequested implements AuthenticateEvent {
  const factory _RegistrationRequested() = _$_RegistrationRequested;
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
    required TResult Function() registrationRequested,
    required TResult Function() authCheckRequested,
  }) {
    return authCheckRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String phoneNumber)? phoneNumberChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? loginRequested,
    TResult Function()? registrationRequested,
    TResult Function()? authCheckRequested,
  }) {
    return authCheckRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber)? phoneNumberChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? loginRequested,
    TResult Function()? registrationRequested,
    TResult Function()? authCheckRequested,
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
    required TResult Function(_RegistrationRequested value)
        registrationRequested,
    required TResult Function(_AuthCheckRequested value) authCheckRequested,
  }) {
    return authCheckRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PhoneNumberChanged value)? phoneNumberChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_LoginRequested value)? loginRequested,
    TResult Function(_RegistrationRequested value)? registrationRequested,
    TResult Function(_AuthCheckRequested value)? authCheckRequested,
  }) {
    return authCheckRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PhoneNumberChanged value)? phoneNumberChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_LoginRequested value)? loginRequested,
    TResult Function(_RegistrationRequested value)? registrationRequested,
    TResult Function(_AuthCheckRequested value)? authCheckRequested,
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
mixin _$AuthenticateState {
  String get phoneNumber => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  bool get isAuthenticated => throw _privateConstructorUsedError;
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
      {String phoneNumber,
      String password,
      bool isAuthenticated,
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
    Object? phoneNumber = freezed,
    Object? password = freezed,
    Object? isAuthenticated = freezed,
    Object? role = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      isAuthenticated: isAuthenticated == freezed
          ? _value.isAuthenticated
          : isAuthenticated // ignore: cast_nullable_to_non_nullable
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
      {String phoneNumber,
      String password,
      bool isAuthenticated,
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
    Object? phoneNumber = freezed,
    Object? password = freezed,
    Object? isAuthenticated = freezed,
    Object? role = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_AuthenticateState(
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      isAuthenticated: isAuthenticated == freezed
          ? _value.isAuthenticated
          : isAuthenticated // ignore: cast_nullable_to_non_nullable
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
      {required this.phoneNumber,
      required this.password,
      required this.isAuthenticated,
      this.role,
      this.errorMessage});

  @override
  final String phoneNumber;
  @override
  final String password;
  @override
  final bool isAuthenticated;
  @override
  final String? role;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'AuthenticateState(phoneNumber: $phoneNumber, password: $password, isAuthenticated: $isAuthenticated, role: $role, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthenticateState &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality()
                .equals(other.isAuthenticated, isAuthenticated) &&
            const DeepCollectionEquality().equals(other.role, role) &&
            const DeepCollectionEquality()
                .equals(other.errorMessage, errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(phoneNumber),
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(isAuthenticated),
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
      {required final String phoneNumber,
      required final String password,
      required final bool isAuthenticated,
      final String? role,
      final String? errorMessage}) = _$_AuthenticateState;

  @override
  String get phoneNumber;
  @override
  String get password;
  @override
  bool get isAuthenticated;
  @override
  String? get role;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_AuthenticateStateCopyWith<_$_AuthenticateState> get copyWith =>
      throw _privateConstructorUsedError;
}
