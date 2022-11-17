// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'session_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SessionEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Exericse exericse) addToSession,
    required TResult Function(String? userId) createSessionRequested,
    required TResult Function() showCreatingSessionRequested,
    required TResult Function() showSessionDetailRequested,
    required TResult Function(String? sessionID) getSessionDetailRequested,
    required TResult Function(String? userId) getSessionsByUserId,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Exericse exericse)? addToSession,
    TResult Function(String? userId)? createSessionRequested,
    TResult Function()? showCreatingSessionRequested,
    TResult Function()? showSessionDetailRequested,
    TResult Function(String? sessionID)? getSessionDetailRequested,
    TResult Function(String? userId)? getSessionsByUserId,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Exericse exericse)? addToSession,
    TResult Function(String? userId)? createSessionRequested,
    TResult Function()? showCreatingSessionRequested,
    TResult Function()? showSessionDetailRequested,
    TResult Function(String? sessionID)? getSessionDetailRequested,
    TResult Function(String? userId)? getSessionsByUserId,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddToSession value) addToSession,
    required TResult Function(_CreateSessionRequested value)
        createSessionRequested,
    required TResult Function(_ShowCreatingSessionRequested value)
        showCreatingSessionRequested,
    required TResult Function(_ShowSessionDetailRequested value)
        showSessionDetailRequested,
    required TResult Function(_GetSessionDetailRequested value)
        getSessionDetailRequested,
    required TResult Function(_GetSessionsByUserId value) getSessionsByUserId,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AddToSession value)? addToSession,
    TResult Function(_CreateSessionRequested value)? createSessionRequested,
    TResult Function(_ShowCreatingSessionRequested value)?
        showCreatingSessionRequested,
    TResult Function(_ShowSessionDetailRequested value)?
        showSessionDetailRequested,
    TResult Function(_GetSessionDetailRequested value)?
        getSessionDetailRequested,
    TResult Function(_GetSessionsByUserId value)? getSessionsByUserId,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddToSession value)? addToSession,
    TResult Function(_CreateSessionRequested value)? createSessionRequested,
    TResult Function(_ShowCreatingSessionRequested value)?
        showCreatingSessionRequested,
    TResult Function(_ShowSessionDetailRequested value)?
        showSessionDetailRequested,
    TResult Function(_GetSessionDetailRequested value)?
        getSessionDetailRequested,
    TResult Function(_GetSessionsByUserId value)? getSessionsByUserId,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionEventCopyWith<$Res> {
  factory $SessionEventCopyWith(
          SessionEvent value, $Res Function(SessionEvent) then) =
      _$SessionEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$SessionEventCopyWithImpl<$Res> implements $SessionEventCopyWith<$Res> {
  _$SessionEventCopyWithImpl(this._value, this._then);

  final SessionEvent _value;
  // ignore: unused_field
  final $Res Function(SessionEvent) _then;
}

/// @nodoc
abstract class _$$_AddToSessionCopyWith<$Res> {
  factory _$$_AddToSessionCopyWith(
          _$_AddToSession value, $Res Function(_$_AddToSession) then) =
      __$$_AddToSessionCopyWithImpl<$Res>;
  $Res call({Exericse exericse});
}

/// @nodoc
class __$$_AddToSessionCopyWithImpl<$Res>
    extends _$SessionEventCopyWithImpl<$Res>
    implements _$$_AddToSessionCopyWith<$Res> {
  __$$_AddToSessionCopyWithImpl(
      _$_AddToSession _value, $Res Function(_$_AddToSession) _then)
      : super(_value, (v) => _then(v as _$_AddToSession));

  @override
  _$_AddToSession get _value => super._value as _$_AddToSession;

  @override
  $Res call({
    Object? exericse = freezed,
  }) {
    return _then(_$_AddToSession(
      exericse == freezed
          ? _value.exericse
          : exericse // ignore: cast_nullable_to_non_nullable
              as Exericse,
    ));
  }
}

/// @nodoc

class _$_AddToSession implements _AddToSession {
  const _$_AddToSession(this.exericse);

  @override
  final Exericse exericse;

  @override
  String toString() {
    return 'SessionEvent.addToSession(exericse: $exericse)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddToSession &&
            const DeepCollectionEquality().equals(other.exericse, exericse));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(exericse));

  @JsonKey(ignore: true)
  @override
  _$$_AddToSessionCopyWith<_$_AddToSession> get copyWith =>
      __$$_AddToSessionCopyWithImpl<_$_AddToSession>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Exericse exericse) addToSession,
    required TResult Function(String? userId) createSessionRequested,
    required TResult Function() showCreatingSessionRequested,
    required TResult Function() showSessionDetailRequested,
    required TResult Function(String? sessionID) getSessionDetailRequested,
    required TResult Function(String? userId) getSessionsByUserId,
  }) {
    return addToSession(exericse);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Exericse exericse)? addToSession,
    TResult Function(String? userId)? createSessionRequested,
    TResult Function()? showCreatingSessionRequested,
    TResult Function()? showSessionDetailRequested,
    TResult Function(String? sessionID)? getSessionDetailRequested,
    TResult Function(String? userId)? getSessionsByUserId,
  }) {
    return addToSession?.call(exericse);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Exericse exericse)? addToSession,
    TResult Function(String? userId)? createSessionRequested,
    TResult Function()? showCreatingSessionRequested,
    TResult Function()? showSessionDetailRequested,
    TResult Function(String? sessionID)? getSessionDetailRequested,
    TResult Function(String? userId)? getSessionsByUserId,
    required TResult orElse(),
  }) {
    if (addToSession != null) {
      return addToSession(exericse);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddToSession value) addToSession,
    required TResult Function(_CreateSessionRequested value)
        createSessionRequested,
    required TResult Function(_ShowCreatingSessionRequested value)
        showCreatingSessionRequested,
    required TResult Function(_ShowSessionDetailRequested value)
        showSessionDetailRequested,
    required TResult Function(_GetSessionDetailRequested value)
        getSessionDetailRequested,
    required TResult Function(_GetSessionsByUserId value) getSessionsByUserId,
  }) {
    return addToSession(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AddToSession value)? addToSession,
    TResult Function(_CreateSessionRequested value)? createSessionRequested,
    TResult Function(_ShowCreatingSessionRequested value)?
        showCreatingSessionRequested,
    TResult Function(_ShowSessionDetailRequested value)?
        showSessionDetailRequested,
    TResult Function(_GetSessionDetailRequested value)?
        getSessionDetailRequested,
    TResult Function(_GetSessionsByUserId value)? getSessionsByUserId,
  }) {
    return addToSession?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddToSession value)? addToSession,
    TResult Function(_CreateSessionRequested value)? createSessionRequested,
    TResult Function(_ShowCreatingSessionRequested value)?
        showCreatingSessionRequested,
    TResult Function(_ShowSessionDetailRequested value)?
        showSessionDetailRequested,
    TResult Function(_GetSessionDetailRequested value)?
        getSessionDetailRequested,
    TResult Function(_GetSessionsByUserId value)? getSessionsByUserId,
    required TResult orElse(),
  }) {
    if (addToSession != null) {
      return addToSession(this);
    }
    return orElse();
  }
}

abstract class _AddToSession implements SessionEvent {
  const factory _AddToSession(final Exericse exericse) = _$_AddToSession;

  Exericse get exericse;
  @JsonKey(ignore: true)
  _$$_AddToSessionCopyWith<_$_AddToSession> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_CreateSessionRequestedCopyWith<$Res> {
  factory _$$_CreateSessionRequestedCopyWith(_$_CreateSessionRequested value,
          $Res Function(_$_CreateSessionRequested) then) =
      __$$_CreateSessionRequestedCopyWithImpl<$Res>;
  $Res call({String? userId});
}

/// @nodoc
class __$$_CreateSessionRequestedCopyWithImpl<$Res>
    extends _$SessionEventCopyWithImpl<$Res>
    implements _$$_CreateSessionRequestedCopyWith<$Res> {
  __$$_CreateSessionRequestedCopyWithImpl(_$_CreateSessionRequested _value,
      $Res Function(_$_CreateSessionRequested) _then)
      : super(_value, (v) => _then(v as _$_CreateSessionRequested));

  @override
  _$_CreateSessionRequested get _value =>
      super._value as _$_CreateSessionRequested;

  @override
  $Res call({
    Object? userId = freezed,
  }) {
    return _then(_$_CreateSessionRequested(
      userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_CreateSessionRequested implements _CreateSessionRequested {
  const _$_CreateSessionRequested(this.userId);

  @override
  final String? userId;

  @override
  String toString() {
    return 'SessionEvent.createSessionRequested(userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateSessionRequested &&
            const DeepCollectionEquality().equals(other.userId, userId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(userId));

  @JsonKey(ignore: true)
  @override
  _$$_CreateSessionRequestedCopyWith<_$_CreateSessionRequested> get copyWith =>
      __$$_CreateSessionRequestedCopyWithImpl<_$_CreateSessionRequested>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Exericse exericse) addToSession,
    required TResult Function(String? userId) createSessionRequested,
    required TResult Function() showCreatingSessionRequested,
    required TResult Function() showSessionDetailRequested,
    required TResult Function(String? sessionID) getSessionDetailRequested,
    required TResult Function(String? userId) getSessionsByUserId,
  }) {
    return createSessionRequested(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Exericse exericse)? addToSession,
    TResult Function(String? userId)? createSessionRequested,
    TResult Function()? showCreatingSessionRequested,
    TResult Function()? showSessionDetailRequested,
    TResult Function(String? sessionID)? getSessionDetailRequested,
    TResult Function(String? userId)? getSessionsByUserId,
  }) {
    return createSessionRequested?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Exericse exericse)? addToSession,
    TResult Function(String? userId)? createSessionRequested,
    TResult Function()? showCreatingSessionRequested,
    TResult Function()? showSessionDetailRequested,
    TResult Function(String? sessionID)? getSessionDetailRequested,
    TResult Function(String? userId)? getSessionsByUserId,
    required TResult orElse(),
  }) {
    if (createSessionRequested != null) {
      return createSessionRequested(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddToSession value) addToSession,
    required TResult Function(_CreateSessionRequested value)
        createSessionRequested,
    required TResult Function(_ShowCreatingSessionRequested value)
        showCreatingSessionRequested,
    required TResult Function(_ShowSessionDetailRequested value)
        showSessionDetailRequested,
    required TResult Function(_GetSessionDetailRequested value)
        getSessionDetailRequested,
    required TResult Function(_GetSessionsByUserId value) getSessionsByUserId,
  }) {
    return createSessionRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AddToSession value)? addToSession,
    TResult Function(_CreateSessionRequested value)? createSessionRequested,
    TResult Function(_ShowCreatingSessionRequested value)?
        showCreatingSessionRequested,
    TResult Function(_ShowSessionDetailRequested value)?
        showSessionDetailRequested,
    TResult Function(_GetSessionDetailRequested value)?
        getSessionDetailRequested,
    TResult Function(_GetSessionsByUserId value)? getSessionsByUserId,
  }) {
    return createSessionRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddToSession value)? addToSession,
    TResult Function(_CreateSessionRequested value)? createSessionRequested,
    TResult Function(_ShowCreatingSessionRequested value)?
        showCreatingSessionRequested,
    TResult Function(_ShowSessionDetailRequested value)?
        showSessionDetailRequested,
    TResult Function(_GetSessionDetailRequested value)?
        getSessionDetailRequested,
    TResult Function(_GetSessionsByUserId value)? getSessionsByUserId,
    required TResult orElse(),
  }) {
    if (createSessionRequested != null) {
      return createSessionRequested(this);
    }
    return orElse();
  }
}

abstract class _CreateSessionRequested implements SessionEvent {
  const factory _CreateSessionRequested(final String? userId) =
      _$_CreateSessionRequested;

  String? get userId;
  @JsonKey(ignore: true)
  _$$_CreateSessionRequestedCopyWith<_$_CreateSessionRequested> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ShowCreatingSessionRequestedCopyWith<$Res> {
  factory _$$_ShowCreatingSessionRequestedCopyWith(
          _$_ShowCreatingSessionRequested value,
          $Res Function(_$_ShowCreatingSessionRequested) then) =
      __$$_ShowCreatingSessionRequestedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ShowCreatingSessionRequestedCopyWithImpl<$Res>
    extends _$SessionEventCopyWithImpl<$Res>
    implements _$$_ShowCreatingSessionRequestedCopyWith<$Res> {
  __$$_ShowCreatingSessionRequestedCopyWithImpl(
      _$_ShowCreatingSessionRequested _value,
      $Res Function(_$_ShowCreatingSessionRequested) _then)
      : super(_value, (v) => _then(v as _$_ShowCreatingSessionRequested));

  @override
  _$_ShowCreatingSessionRequested get _value =>
      super._value as _$_ShowCreatingSessionRequested;
}

/// @nodoc

class _$_ShowCreatingSessionRequested implements _ShowCreatingSessionRequested {
  const _$_ShowCreatingSessionRequested();

  @override
  String toString() {
    return 'SessionEvent.showCreatingSessionRequested()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ShowCreatingSessionRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Exericse exericse) addToSession,
    required TResult Function(String? userId) createSessionRequested,
    required TResult Function() showCreatingSessionRequested,
    required TResult Function() showSessionDetailRequested,
    required TResult Function(String? sessionID) getSessionDetailRequested,
    required TResult Function(String? userId) getSessionsByUserId,
  }) {
    return showCreatingSessionRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Exericse exericse)? addToSession,
    TResult Function(String? userId)? createSessionRequested,
    TResult Function()? showCreatingSessionRequested,
    TResult Function()? showSessionDetailRequested,
    TResult Function(String? sessionID)? getSessionDetailRequested,
    TResult Function(String? userId)? getSessionsByUserId,
  }) {
    return showCreatingSessionRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Exericse exericse)? addToSession,
    TResult Function(String? userId)? createSessionRequested,
    TResult Function()? showCreatingSessionRequested,
    TResult Function()? showSessionDetailRequested,
    TResult Function(String? sessionID)? getSessionDetailRequested,
    TResult Function(String? userId)? getSessionsByUserId,
    required TResult orElse(),
  }) {
    if (showCreatingSessionRequested != null) {
      return showCreatingSessionRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddToSession value) addToSession,
    required TResult Function(_CreateSessionRequested value)
        createSessionRequested,
    required TResult Function(_ShowCreatingSessionRequested value)
        showCreatingSessionRequested,
    required TResult Function(_ShowSessionDetailRequested value)
        showSessionDetailRequested,
    required TResult Function(_GetSessionDetailRequested value)
        getSessionDetailRequested,
    required TResult Function(_GetSessionsByUserId value) getSessionsByUserId,
  }) {
    return showCreatingSessionRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AddToSession value)? addToSession,
    TResult Function(_CreateSessionRequested value)? createSessionRequested,
    TResult Function(_ShowCreatingSessionRequested value)?
        showCreatingSessionRequested,
    TResult Function(_ShowSessionDetailRequested value)?
        showSessionDetailRequested,
    TResult Function(_GetSessionDetailRequested value)?
        getSessionDetailRequested,
    TResult Function(_GetSessionsByUserId value)? getSessionsByUserId,
  }) {
    return showCreatingSessionRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddToSession value)? addToSession,
    TResult Function(_CreateSessionRequested value)? createSessionRequested,
    TResult Function(_ShowCreatingSessionRequested value)?
        showCreatingSessionRequested,
    TResult Function(_ShowSessionDetailRequested value)?
        showSessionDetailRequested,
    TResult Function(_GetSessionDetailRequested value)?
        getSessionDetailRequested,
    TResult Function(_GetSessionsByUserId value)? getSessionsByUserId,
    required TResult orElse(),
  }) {
    if (showCreatingSessionRequested != null) {
      return showCreatingSessionRequested(this);
    }
    return orElse();
  }
}

abstract class _ShowCreatingSessionRequested implements SessionEvent {
  const factory _ShowCreatingSessionRequested() =
      _$_ShowCreatingSessionRequested;
}

/// @nodoc
abstract class _$$_ShowSessionDetailRequestedCopyWith<$Res> {
  factory _$$_ShowSessionDetailRequestedCopyWith(
          _$_ShowSessionDetailRequested value,
          $Res Function(_$_ShowSessionDetailRequested) then) =
      __$$_ShowSessionDetailRequestedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ShowSessionDetailRequestedCopyWithImpl<$Res>
    extends _$SessionEventCopyWithImpl<$Res>
    implements _$$_ShowSessionDetailRequestedCopyWith<$Res> {
  __$$_ShowSessionDetailRequestedCopyWithImpl(
      _$_ShowSessionDetailRequested _value,
      $Res Function(_$_ShowSessionDetailRequested) _then)
      : super(_value, (v) => _then(v as _$_ShowSessionDetailRequested));

  @override
  _$_ShowSessionDetailRequested get _value =>
      super._value as _$_ShowSessionDetailRequested;
}

/// @nodoc

class _$_ShowSessionDetailRequested implements _ShowSessionDetailRequested {
  const _$_ShowSessionDetailRequested();

  @override
  String toString() {
    return 'SessionEvent.showSessionDetailRequested()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ShowSessionDetailRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Exericse exericse) addToSession,
    required TResult Function(String? userId) createSessionRequested,
    required TResult Function() showCreatingSessionRequested,
    required TResult Function() showSessionDetailRequested,
    required TResult Function(String? sessionID) getSessionDetailRequested,
    required TResult Function(String? userId) getSessionsByUserId,
  }) {
    return showSessionDetailRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Exericse exericse)? addToSession,
    TResult Function(String? userId)? createSessionRequested,
    TResult Function()? showCreatingSessionRequested,
    TResult Function()? showSessionDetailRequested,
    TResult Function(String? sessionID)? getSessionDetailRequested,
    TResult Function(String? userId)? getSessionsByUserId,
  }) {
    return showSessionDetailRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Exericse exericse)? addToSession,
    TResult Function(String? userId)? createSessionRequested,
    TResult Function()? showCreatingSessionRequested,
    TResult Function()? showSessionDetailRequested,
    TResult Function(String? sessionID)? getSessionDetailRequested,
    TResult Function(String? userId)? getSessionsByUserId,
    required TResult orElse(),
  }) {
    if (showSessionDetailRequested != null) {
      return showSessionDetailRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddToSession value) addToSession,
    required TResult Function(_CreateSessionRequested value)
        createSessionRequested,
    required TResult Function(_ShowCreatingSessionRequested value)
        showCreatingSessionRequested,
    required TResult Function(_ShowSessionDetailRequested value)
        showSessionDetailRequested,
    required TResult Function(_GetSessionDetailRequested value)
        getSessionDetailRequested,
    required TResult Function(_GetSessionsByUserId value) getSessionsByUserId,
  }) {
    return showSessionDetailRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AddToSession value)? addToSession,
    TResult Function(_CreateSessionRequested value)? createSessionRequested,
    TResult Function(_ShowCreatingSessionRequested value)?
        showCreatingSessionRequested,
    TResult Function(_ShowSessionDetailRequested value)?
        showSessionDetailRequested,
    TResult Function(_GetSessionDetailRequested value)?
        getSessionDetailRequested,
    TResult Function(_GetSessionsByUserId value)? getSessionsByUserId,
  }) {
    return showSessionDetailRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddToSession value)? addToSession,
    TResult Function(_CreateSessionRequested value)? createSessionRequested,
    TResult Function(_ShowCreatingSessionRequested value)?
        showCreatingSessionRequested,
    TResult Function(_ShowSessionDetailRequested value)?
        showSessionDetailRequested,
    TResult Function(_GetSessionDetailRequested value)?
        getSessionDetailRequested,
    TResult Function(_GetSessionsByUserId value)? getSessionsByUserId,
    required TResult orElse(),
  }) {
    if (showSessionDetailRequested != null) {
      return showSessionDetailRequested(this);
    }
    return orElse();
  }
}

abstract class _ShowSessionDetailRequested implements SessionEvent {
  const factory _ShowSessionDetailRequested() = _$_ShowSessionDetailRequested;
}

/// @nodoc
abstract class _$$_GetSessionDetailRequestedCopyWith<$Res> {
  factory _$$_GetSessionDetailRequestedCopyWith(
          _$_GetSessionDetailRequested value,
          $Res Function(_$_GetSessionDetailRequested) then) =
      __$$_GetSessionDetailRequestedCopyWithImpl<$Res>;
  $Res call({String? sessionID});
}

/// @nodoc
class __$$_GetSessionDetailRequestedCopyWithImpl<$Res>
    extends _$SessionEventCopyWithImpl<$Res>
    implements _$$_GetSessionDetailRequestedCopyWith<$Res> {
  __$$_GetSessionDetailRequestedCopyWithImpl(
      _$_GetSessionDetailRequested _value,
      $Res Function(_$_GetSessionDetailRequested) _then)
      : super(_value, (v) => _then(v as _$_GetSessionDetailRequested));

  @override
  _$_GetSessionDetailRequested get _value =>
      super._value as _$_GetSessionDetailRequested;

  @override
  $Res call({
    Object? sessionID = freezed,
  }) {
    return _then(_$_GetSessionDetailRequested(
      sessionID == freezed
          ? _value.sessionID
          : sessionID // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_GetSessionDetailRequested implements _GetSessionDetailRequested {
  const _$_GetSessionDetailRequested(this.sessionID);

  @override
  final String? sessionID;

  @override
  String toString() {
    return 'SessionEvent.getSessionDetailRequested(sessionID: $sessionID)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetSessionDetailRequested &&
            const DeepCollectionEquality().equals(other.sessionID, sessionID));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(sessionID));

  @JsonKey(ignore: true)
  @override
  _$$_GetSessionDetailRequestedCopyWith<_$_GetSessionDetailRequested>
      get copyWith => __$$_GetSessionDetailRequestedCopyWithImpl<
          _$_GetSessionDetailRequested>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Exericse exericse) addToSession,
    required TResult Function(String? userId) createSessionRequested,
    required TResult Function() showCreatingSessionRequested,
    required TResult Function() showSessionDetailRequested,
    required TResult Function(String? sessionID) getSessionDetailRequested,
    required TResult Function(String? userId) getSessionsByUserId,
  }) {
    return getSessionDetailRequested(sessionID);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Exericse exericse)? addToSession,
    TResult Function(String? userId)? createSessionRequested,
    TResult Function()? showCreatingSessionRequested,
    TResult Function()? showSessionDetailRequested,
    TResult Function(String? sessionID)? getSessionDetailRequested,
    TResult Function(String? userId)? getSessionsByUserId,
  }) {
    return getSessionDetailRequested?.call(sessionID);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Exericse exericse)? addToSession,
    TResult Function(String? userId)? createSessionRequested,
    TResult Function()? showCreatingSessionRequested,
    TResult Function()? showSessionDetailRequested,
    TResult Function(String? sessionID)? getSessionDetailRequested,
    TResult Function(String? userId)? getSessionsByUserId,
    required TResult orElse(),
  }) {
    if (getSessionDetailRequested != null) {
      return getSessionDetailRequested(sessionID);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddToSession value) addToSession,
    required TResult Function(_CreateSessionRequested value)
        createSessionRequested,
    required TResult Function(_ShowCreatingSessionRequested value)
        showCreatingSessionRequested,
    required TResult Function(_ShowSessionDetailRequested value)
        showSessionDetailRequested,
    required TResult Function(_GetSessionDetailRequested value)
        getSessionDetailRequested,
    required TResult Function(_GetSessionsByUserId value) getSessionsByUserId,
  }) {
    return getSessionDetailRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AddToSession value)? addToSession,
    TResult Function(_CreateSessionRequested value)? createSessionRequested,
    TResult Function(_ShowCreatingSessionRequested value)?
        showCreatingSessionRequested,
    TResult Function(_ShowSessionDetailRequested value)?
        showSessionDetailRequested,
    TResult Function(_GetSessionDetailRequested value)?
        getSessionDetailRequested,
    TResult Function(_GetSessionsByUserId value)? getSessionsByUserId,
  }) {
    return getSessionDetailRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddToSession value)? addToSession,
    TResult Function(_CreateSessionRequested value)? createSessionRequested,
    TResult Function(_ShowCreatingSessionRequested value)?
        showCreatingSessionRequested,
    TResult Function(_ShowSessionDetailRequested value)?
        showSessionDetailRequested,
    TResult Function(_GetSessionDetailRequested value)?
        getSessionDetailRequested,
    TResult Function(_GetSessionsByUserId value)? getSessionsByUserId,
    required TResult orElse(),
  }) {
    if (getSessionDetailRequested != null) {
      return getSessionDetailRequested(this);
    }
    return orElse();
  }
}

abstract class _GetSessionDetailRequested implements SessionEvent {
  const factory _GetSessionDetailRequested(final String? sessionID) =
      _$_GetSessionDetailRequested;

  String? get sessionID;
  @JsonKey(ignore: true)
  _$$_GetSessionDetailRequestedCopyWith<_$_GetSessionDetailRequested>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GetSessionsByUserIdCopyWith<$Res> {
  factory _$$_GetSessionsByUserIdCopyWith(_$_GetSessionsByUserId value,
          $Res Function(_$_GetSessionsByUserId) then) =
      __$$_GetSessionsByUserIdCopyWithImpl<$Res>;
  $Res call({String? userId});
}

/// @nodoc
class __$$_GetSessionsByUserIdCopyWithImpl<$Res>
    extends _$SessionEventCopyWithImpl<$Res>
    implements _$$_GetSessionsByUserIdCopyWith<$Res> {
  __$$_GetSessionsByUserIdCopyWithImpl(_$_GetSessionsByUserId _value,
      $Res Function(_$_GetSessionsByUserId) _then)
      : super(_value, (v) => _then(v as _$_GetSessionsByUserId));

  @override
  _$_GetSessionsByUserId get _value => super._value as _$_GetSessionsByUserId;

  @override
  $Res call({
    Object? userId = freezed,
  }) {
    return _then(_$_GetSessionsByUserId(
      userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_GetSessionsByUserId implements _GetSessionsByUserId {
  const _$_GetSessionsByUserId(this.userId);

  @override
  final String? userId;

  @override
  String toString() {
    return 'SessionEvent.getSessionsByUserId(userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetSessionsByUserId &&
            const DeepCollectionEquality().equals(other.userId, userId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(userId));

  @JsonKey(ignore: true)
  @override
  _$$_GetSessionsByUserIdCopyWith<_$_GetSessionsByUserId> get copyWith =>
      __$$_GetSessionsByUserIdCopyWithImpl<_$_GetSessionsByUserId>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Exericse exericse) addToSession,
    required TResult Function(String? userId) createSessionRequested,
    required TResult Function() showCreatingSessionRequested,
    required TResult Function() showSessionDetailRequested,
    required TResult Function(String? sessionID) getSessionDetailRequested,
    required TResult Function(String? userId) getSessionsByUserId,
  }) {
    return getSessionsByUserId(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Exericse exericse)? addToSession,
    TResult Function(String? userId)? createSessionRequested,
    TResult Function()? showCreatingSessionRequested,
    TResult Function()? showSessionDetailRequested,
    TResult Function(String? sessionID)? getSessionDetailRequested,
    TResult Function(String? userId)? getSessionsByUserId,
  }) {
    return getSessionsByUserId?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Exericse exericse)? addToSession,
    TResult Function(String? userId)? createSessionRequested,
    TResult Function()? showCreatingSessionRequested,
    TResult Function()? showSessionDetailRequested,
    TResult Function(String? sessionID)? getSessionDetailRequested,
    TResult Function(String? userId)? getSessionsByUserId,
    required TResult orElse(),
  }) {
    if (getSessionsByUserId != null) {
      return getSessionsByUserId(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddToSession value) addToSession,
    required TResult Function(_CreateSessionRequested value)
        createSessionRequested,
    required TResult Function(_ShowCreatingSessionRequested value)
        showCreatingSessionRequested,
    required TResult Function(_ShowSessionDetailRequested value)
        showSessionDetailRequested,
    required TResult Function(_GetSessionDetailRequested value)
        getSessionDetailRequested,
    required TResult Function(_GetSessionsByUserId value) getSessionsByUserId,
  }) {
    return getSessionsByUserId(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AddToSession value)? addToSession,
    TResult Function(_CreateSessionRequested value)? createSessionRequested,
    TResult Function(_ShowCreatingSessionRequested value)?
        showCreatingSessionRequested,
    TResult Function(_ShowSessionDetailRequested value)?
        showSessionDetailRequested,
    TResult Function(_GetSessionDetailRequested value)?
        getSessionDetailRequested,
    TResult Function(_GetSessionsByUserId value)? getSessionsByUserId,
  }) {
    return getSessionsByUserId?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddToSession value)? addToSession,
    TResult Function(_CreateSessionRequested value)? createSessionRequested,
    TResult Function(_ShowCreatingSessionRequested value)?
        showCreatingSessionRequested,
    TResult Function(_ShowSessionDetailRequested value)?
        showSessionDetailRequested,
    TResult Function(_GetSessionDetailRequested value)?
        getSessionDetailRequested,
    TResult Function(_GetSessionsByUserId value)? getSessionsByUserId,
    required TResult orElse(),
  }) {
    if (getSessionsByUserId != null) {
      return getSessionsByUserId(this);
    }
    return orElse();
  }
}

abstract class _GetSessionsByUserId implements SessionEvent {
  const factory _GetSessionsByUserId(final String? userId) =
      _$_GetSessionsByUserId;

  String? get userId;
  @JsonKey(ignore: true)
  _$$_GetSessionsByUserIdCopyWith<_$_GetSessionsByUserId> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SessionState {
  List<GetSessionsResponseModel> get sessions =>
      throw _privateConstructorUsedError;
  List<Exericse>? get exercises => throw _privateConstructorUsedError;
  List<GetSessionDetailResponseModel>? get details =>
      throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  Map<String?, List<GetSessionDetailResponseModel>>? get detailsList =>
      throw _privateConstructorUsedError;
  Map<String?, int>? get exercisesCount => throw _privateConstructorUsedError;
  String? get sessionId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SessionStateCopyWith<SessionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionStateCopyWith<$Res> {
  factory $SessionStateCopyWith(
          SessionState value, $Res Function(SessionState) then) =
      _$SessionStateCopyWithImpl<$Res>;
  $Res call(
      {List<GetSessionsResponseModel> sessions,
      List<Exericse>? exercises,
      List<GetSessionDetailResponseModel>? details,
      String? message,
      Map<String?, List<GetSessionDetailResponseModel>>? detailsList,
      Map<String?, int>? exercisesCount,
      String? sessionId});
}

/// @nodoc
class _$SessionStateCopyWithImpl<$Res> implements $SessionStateCopyWith<$Res> {
  _$SessionStateCopyWithImpl(this._value, this._then);

  final SessionState _value;
  // ignore: unused_field
  final $Res Function(SessionState) _then;

  @override
  $Res call({
    Object? sessions = freezed,
    Object? exercises = freezed,
    Object? details = freezed,
    Object? message = freezed,
    Object? detailsList = freezed,
    Object? exercisesCount = freezed,
    Object? sessionId = freezed,
  }) {
    return _then(_value.copyWith(
      sessions: sessions == freezed
          ? _value.sessions
          : sessions // ignore: cast_nullable_to_non_nullable
              as List<GetSessionsResponseModel>,
      exercises: exercises == freezed
          ? _value.exercises
          : exercises // ignore: cast_nullable_to_non_nullable
              as List<Exericse>?,
      details: details == freezed
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as List<GetSessionDetailResponseModel>?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      detailsList: detailsList == freezed
          ? _value.detailsList
          : detailsList // ignore: cast_nullable_to_non_nullable
              as Map<String?, List<GetSessionDetailResponseModel>>?,
      exercisesCount: exercisesCount == freezed
          ? _value.exercisesCount
          : exercisesCount // ignore: cast_nullable_to_non_nullable
              as Map<String?, int>?,
      sessionId: sessionId == freezed
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_SessionStateCopyWith<$Res>
    implements $SessionStateCopyWith<$Res> {
  factory _$$_SessionStateCopyWith(
          _$_SessionState value, $Res Function(_$_SessionState) then) =
      __$$_SessionStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<GetSessionsResponseModel> sessions,
      List<Exericse>? exercises,
      List<GetSessionDetailResponseModel>? details,
      String? message,
      Map<String?, List<GetSessionDetailResponseModel>>? detailsList,
      Map<String?, int>? exercisesCount,
      String? sessionId});
}

/// @nodoc
class __$$_SessionStateCopyWithImpl<$Res>
    extends _$SessionStateCopyWithImpl<$Res>
    implements _$$_SessionStateCopyWith<$Res> {
  __$$_SessionStateCopyWithImpl(
      _$_SessionState _value, $Res Function(_$_SessionState) _then)
      : super(_value, (v) => _then(v as _$_SessionState));

  @override
  _$_SessionState get _value => super._value as _$_SessionState;

  @override
  $Res call({
    Object? sessions = freezed,
    Object? exercises = freezed,
    Object? details = freezed,
    Object? message = freezed,
    Object? detailsList = freezed,
    Object? exercisesCount = freezed,
    Object? sessionId = freezed,
  }) {
    return _then(_$_SessionState(
      sessions: sessions == freezed
          ? _value.sessions
          : sessions // ignore: cast_nullable_to_non_nullable
              as List<GetSessionsResponseModel>,
      exercises: exercises == freezed
          ? _value.exercises
          : exercises // ignore: cast_nullable_to_non_nullable
              as List<Exericse>?,
      details: details == freezed
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as List<GetSessionDetailResponseModel>?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      detailsList: detailsList == freezed
          ? _value.detailsList
          : detailsList // ignore: cast_nullable_to_non_nullable
              as Map<String?, List<GetSessionDetailResponseModel>>?,
      exercisesCount: exercisesCount == freezed
          ? _value.exercisesCount
          : exercisesCount // ignore: cast_nullable_to_non_nullable
              as Map<String?, int>?,
      sessionId: sessionId == freezed
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_SessionState implements _SessionState {
  const _$_SessionState(
      {required this.sessions,
      this.exercises,
      this.details,
      this.message,
      this.detailsList,
      this.exercisesCount,
      this.sessionId});

  @override
  final List<GetSessionsResponseModel> sessions;
  @override
  final List<Exericse>? exercises;
  @override
  final List<GetSessionDetailResponseModel>? details;
  @override
  final String? message;
  @override
  final Map<String?, List<GetSessionDetailResponseModel>>? detailsList;
  @override
  final Map<String?, int>? exercisesCount;
  @override
  final String? sessionId;

  @override
  String toString() {
    return 'SessionState(sessions: $sessions, exercises: $exercises, details: $details, message: $message, detailsList: $detailsList, exercisesCount: $exercisesCount, sessionId: $sessionId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SessionState &&
            const DeepCollectionEquality().equals(other.sessions, sessions) &&
            const DeepCollectionEquality().equals(other.exercises, exercises) &&
            const DeepCollectionEquality().equals(other.details, details) &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality()
                .equals(other.detailsList, detailsList) &&
            const DeepCollectionEquality()
                .equals(other.exercisesCount, exercisesCount) &&
            const DeepCollectionEquality().equals(other.sessionId, sessionId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(sessions),
      const DeepCollectionEquality().hash(exercises),
      const DeepCollectionEquality().hash(details),
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(detailsList),
      const DeepCollectionEquality().hash(exercisesCount),
      const DeepCollectionEquality().hash(sessionId));

  @JsonKey(ignore: true)
  @override
  _$$_SessionStateCopyWith<_$_SessionState> get copyWith =>
      __$$_SessionStateCopyWithImpl<_$_SessionState>(this, _$identity);
}

abstract class _SessionState implements SessionState {
  const factory _SessionState(
      {required final List<GetSessionsResponseModel> sessions,
      final List<Exericse>? exercises,
      final List<GetSessionDetailResponseModel>? details,
      final String? message,
      final Map<String?, List<GetSessionDetailResponseModel>>? detailsList,
      final Map<String?, int>? exercisesCount,
      final String? sessionId}) = _$_SessionState;

  @override
  List<GetSessionsResponseModel> get sessions;
  @override
  List<Exericse>? get exercises;
  @override
  List<GetSessionDetailResponseModel>? get details;
  @override
  String? get message;
  @override
  Map<String?, List<GetSessionDetailResponseModel>>? get detailsList;
  @override
  Map<String?, int>? get exercisesCount;
  @override
  String? get sessionId;
  @override
  @JsonKey(ignore: true)
  _$$_SessionStateCopyWith<_$_SessionState> get copyWith =>
      throw _privateConstructorUsedError;
}
