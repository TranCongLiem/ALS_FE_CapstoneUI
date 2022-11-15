// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_chat_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserChatEvent {
  String get userIdFrom => throw _privateConstructorUsedError;
  String get userIdTo => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userIdFrom, String userIdTo)
        UpdateHasSeenRequest,
    required TResult Function(
            String userIdFrom, String userIdTo, String lastMessage)
        UpdateUserChatRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String userIdFrom, String userIdTo)? UpdateHasSeenRequest,
    TResult Function(String userIdFrom, String userIdTo, String lastMessage)?
        UpdateUserChatRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userIdFrom, String userIdTo)? UpdateHasSeenRequest,
    TResult Function(String userIdFrom, String userIdTo, String lastMessage)?
        UpdateUserChatRequest,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateHasSeenRequest value) UpdateHasSeenRequest,
    required TResult Function(_UpdateUserChatRequest value)
        UpdateUserChatRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_UpdateHasSeenRequest value)? UpdateHasSeenRequest,
    TResult Function(_UpdateUserChatRequest value)? UpdateUserChatRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateHasSeenRequest value)? UpdateHasSeenRequest,
    TResult Function(_UpdateUserChatRequest value)? UpdateUserChatRequest,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserChatEventCopyWith<UserChatEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserChatEventCopyWith<$Res> {
  factory $UserChatEventCopyWith(
          UserChatEvent value, $Res Function(UserChatEvent) then) =
      _$UserChatEventCopyWithImpl<$Res>;
  $Res call({String userIdFrom, String userIdTo});
}

/// @nodoc
class _$UserChatEventCopyWithImpl<$Res>
    implements $UserChatEventCopyWith<$Res> {
  _$UserChatEventCopyWithImpl(this._value, this._then);

  final UserChatEvent _value;
  // ignore: unused_field
  final $Res Function(UserChatEvent) _then;

  @override
  $Res call({
    Object? userIdFrom = freezed,
    Object? userIdTo = freezed,
  }) {
    return _then(_value.copyWith(
      userIdFrom: userIdFrom == freezed
          ? _value.userIdFrom
          : userIdFrom // ignore: cast_nullable_to_non_nullable
              as String,
      userIdTo: userIdTo == freezed
          ? _value.userIdTo
          : userIdTo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_UpdateHasSeenRequestCopyWith<$Res>
    implements $UserChatEventCopyWith<$Res> {
  factory _$$_UpdateHasSeenRequestCopyWith(_$_UpdateHasSeenRequest value,
          $Res Function(_$_UpdateHasSeenRequest) then) =
      __$$_UpdateHasSeenRequestCopyWithImpl<$Res>;
  @override
  $Res call({String userIdFrom, String userIdTo});
}

/// @nodoc
class __$$_UpdateHasSeenRequestCopyWithImpl<$Res>
    extends _$UserChatEventCopyWithImpl<$Res>
    implements _$$_UpdateHasSeenRequestCopyWith<$Res> {
  __$$_UpdateHasSeenRequestCopyWithImpl(_$_UpdateHasSeenRequest _value,
      $Res Function(_$_UpdateHasSeenRequest) _then)
      : super(_value, (v) => _then(v as _$_UpdateHasSeenRequest));

  @override
  _$_UpdateHasSeenRequest get _value => super._value as _$_UpdateHasSeenRequest;

  @override
  $Res call({
    Object? userIdFrom = freezed,
    Object? userIdTo = freezed,
  }) {
    return _then(_$_UpdateHasSeenRequest(
      userIdFrom == freezed
          ? _value.userIdFrom
          : userIdFrom // ignore: cast_nullable_to_non_nullable
              as String,
      userIdTo == freezed
          ? _value.userIdTo
          : userIdTo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UpdateHasSeenRequest implements _UpdateHasSeenRequest {
  const _$_UpdateHasSeenRequest(this.userIdFrom, this.userIdTo);

  @override
  final String userIdFrom;
  @override
  final String userIdTo;

  @override
  String toString() {
    return 'UserChatEvent.UpdateHasSeenRequest(userIdFrom: $userIdFrom, userIdTo: $userIdTo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateHasSeenRequest &&
            const DeepCollectionEquality()
                .equals(other.userIdFrom, userIdFrom) &&
            const DeepCollectionEquality().equals(other.userIdTo, userIdTo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userIdFrom),
      const DeepCollectionEquality().hash(userIdTo));

  @JsonKey(ignore: true)
  @override
  _$$_UpdateHasSeenRequestCopyWith<_$_UpdateHasSeenRequest> get copyWith =>
      __$$_UpdateHasSeenRequestCopyWithImpl<_$_UpdateHasSeenRequest>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userIdFrom, String userIdTo)
        UpdateHasSeenRequest,
    required TResult Function(
            String userIdFrom, String userIdTo, String lastMessage)
        UpdateUserChatRequest,
  }) {
    return UpdateHasSeenRequest(userIdFrom, userIdTo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String userIdFrom, String userIdTo)? UpdateHasSeenRequest,
    TResult Function(String userIdFrom, String userIdTo, String lastMessage)?
        UpdateUserChatRequest,
  }) {
    return UpdateHasSeenRequest?.call(userIdFrom, userIdTo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userIdFrom, String userIdTo)? UpdateHasSeenRequest,
    TResult Function(String userIdFrom, String userIdTo, String lastMessage)?
        UpdateUserChatRequest,
    required TResult orElse(),
  }) {
    if (UpdateHasSeenRequest != null) {
      return UpdateHasSeenRequest(userIdFrom, userIdTo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateHasSeenRequest value) UpdateHasSeenRequest,
    required TResult Function(_UpdateUserChatRequest value)
        UpdateUserChatRequest,
  }) {
    return UpdateHasSeenRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_UpdateHasSeenRequest value)? UpdateHasSeenRequest,
    TResult Function(_UpdateUserChatRequest value)? UpdateUserChatRequest,
  }) {
    return UpdateHasSeenRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateHasSeenRequest value)? UpdateHasSeenRequest,
    TResult Function(_UpdateUserChatRequest value)? UpdateUserChatRequest,
    required TResult orElse(),
  }) {
    if (UpdateHasSeenRequest != null) {
      return UpdateHasSeenRequest(this);
    }
    return orElse();
  }
}

abstract class _UpdateHasSeenRequest implements UserChatEvent {
  const factory _UpdateHasSeenRequest(
      final String userIdFrom, final String userIdTo) = _$_UpdateHasSeenRequest;

  @override
  String get userIdFrom;
  @override
  String get userIdTo;
  @override
  @JsonKey(ignore: true)
  _$$_UpdateHasSeenRequestCopyWith<_$_UpdateHasSeenRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UpdateUserChatRequestCopyWith<$Res>
    implements $UserChatEventCopyWith<$Res> {
  factory _$$_UpdateUserChatRequestCopyWith(_$_UpdateUserChatRequest value,
          $Res Function(_$_UpdateUserChatRequest) then) =
      __$$_UpdateUserChatRequestCopyWithImpl<$Res>;
  @override
  $Res call({String userIdFrom, String userIdTo, String lastMessage});
}

/// @nodoc
class __$$_UpdateUserChatRequestCopyWithImpl<$Res>
    extends _$UserChatEventCopyWithImpl<$Res>
    implements _$$_UpdateUserChatRequestCopyWith<$Res> {
  __$$_UpdateUserChatRequestCopyWithImpl(_$_UpdateUserChatRequest _value,
      $Res Function(_$_UpdateUserChatRequest) _then)
      : super(_value, (v) => _then(v as _$_UpdateUserChatRequest));

  @override
  _$_UpdateUserChatRequest get _value =>
      super._value as _$_UpdateUserChatRequest;

  @override
  $Res call({
    Object? userIdFrom = freezed,
    Object? userIdTo = freezed,
    Object? lastMessage = freezed,
  }) {
    return _then(_$_UpdateUserChatRequest(
      userIdFrom == freezed
          ? _value.userIdFrom
          : userIdFrom // ignore: cast_nullable_to_non_nullable
              as String,
      userIdTo == freezed
          ? _value.userIdTo
          : userIdTo // ignore: cast_nullable_to_non_nullable
              as String,
      lastMessage == freezed
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UpdateUserChatRequest implements _UpdateUserChatRequest {
  const _$_UpdateUserChatRequest(
      this.userIdFrom, this.userIdTo, this.lastMessage);

  @override
  final String userIdFrom;
  @override
  final String userIdTo;
  @override
  final String lastMessage;

  @override
  String toString() {
    return 'UserChatEvent.UpdateUserChatRequest(userIdFrom: $userIdFrom, userIdTo: $userIdTo, lastMessage: $lastMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateUserChatRequest &&
            const DeepCollectionEquality()
                .equals(other.userIdFrom, userIdFrom) &&
            const DeepCollectionEquality().equals(other.userIdTo, userIdTo) &&
            const DeepCollectionEquality()
                .equals(other.lastMessage, lastMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userIdFrom),
      const DeepCollectionEquality().hash(userIdTo),
      const DeepCollectionEquality().hash(lastMessage));

  @JsonKey(ignore: true)
  @override
  _$$_UpdateUserChatRequestCopyWith<_$_UpdateUserChatRequest> get copyWith =>
      __$$_UpdateUserChatRequestCopyWithImpl<_$_UpdateUserChatRequest>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userIdFrom, String userIdTo)
        UpdateHasSeenRequest,
    required TResult Function(
            String userIdFrom, String userIdTo, String lastMessage)
        UpdateUserChatRequest,
  }) {
    return UpdateUserChatRequest(userIdFrom, userIdTo, lastMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String userIdFrom, String userIdTo)? UpdateHasSeenRequest,
    TResult Function(String userIdFrom, String userIdTo, String lastMessage)?
        UpdateUserChatRequest,
  }) {
    return UpdateUserChatRequest?.call(userIdFrom, userIdTo, lastMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userIdFrom, String userIdTo)? UpdateHasSeenRequest,
    TResult Function(String userIdFrom, String userIdTo, String lastMessage)?
        UpdateUserChatRequest,
    required TResult orElse(),
  }) {
    if (UpdateUserChatRequest != null) {
      return UpdateUserChatRequest(userIdFrom, userIdTo, lastMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateHasSeenRequest value) UpdateHasSeenRequest,
    required TResult Function(_UpdateUserChatRequest value)
        UpdateUserChatRequest,
  }) {
    return UpdateUserChatRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_UpdateHasSeenRequest value)? UpdateHasSeenRequest,
    TResult Function(_UpdateUserChatRequest value)? UpdateUserChatRequest,
  }) {
    return UpdateUserChatRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateHasSeenRequest value)? UpdateHasSeenRequest,
    TResult Function(_UpdateUserChatRequest value)? UpdateUserChatRequest,
    required TResult orElse(),
  }) {
    if (UpdateUserChatRequest != null) {
      return UpdateUserChatRequest(this);
    }
    return orElse();
  }
}

abstract class _UpdateUserChatRequest implements UserChatEvent {
  const factory _UpdateUserChatRequest(
      final String userIdFrom,
      final String userIdTo,
      final String lastMessage) = _$_UpdateUserChatRequest;

  @override
  String get userIdFrom;
  @override
  String get userIdTo;
  String get lastMessage;
  @override
  @JsonKey(ignore: true)
  _$$_UpdateUserChatRequestCopyWith<_$_UpdateUserChatRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UserChatState {
  String get userId => throw _privateConstructorUsedError;
  bool? get success => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserChatStateCopyWith<UserChatState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserChatStateCopyWith<$Res> {
  factory $UserChatStateCopyWith(
          UserChatState value, $Res Function(UserChatState) then) =
      _$UserChatStateCopyWithImpl<$Res>;
  $Res call(
      {String userId, bool? success, String? message, String? errorMessage});
}

/// @nodoc
class _$UserChatStateCopyWithImpl<$Res>
    implements $UserChatStateCopyWith<$Res> {
  _$UserChatStateCopyWithImpl(this._value, this._then);

  final UserChatState _value;
  // ignore: unused_field
  final $Res Function(UserChatState) _then;

  @override
  $Res call({
    Object? userId = freezed,
    Object? success = freezed,
    Object? message = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      success: success == freezed
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_UserChatStateCopyWith<$Res>
    implements $UserChatStateCopyWith<$Res> {
  factory _$$_UserChatStateCopyWith(
          _$_UserChatState value, $Res Function(_$_UserChatState) then) =
      __$$_UserChatStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String userId, bool? success, String? message, String? errorMessage});
}

/// @nodoc
class __$$_UserChatStateCopyWithImpl<$Res>
    extends _$UserChatStateCopyWithImpl<$Res>
    implements _$$_UserChatStateCopyWith<$Res> {
  __$$_UserChatStateCopyWithImpl(
      _$_UserChatState _value, $Res Function(_$_UserChatState) _then)
      : super(_value, (v) => _then(v as _$_UserChatState));

  @override
  _$_UserChatState get _value => super._value as _$_UserChatState;

  @override
  $Res call({
    Object? userId = freezed,
    Object? success = freezed,
    Object? message = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_UserChatState(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      success: success == freezed
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_UserChatState implements _UserChatState {
  const _$_UserChatState(
      {required this.userId, this.success, this.message, this.errorMessage});

  @override
  final String userId;
  @override
  final bool? success;
  @override
  final String? message;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'UserChatState(userId: $userId, success: $success, message: $message, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserChatState &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.success, success) &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality()
                .equals(other.errorMessage, errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(success),
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(errorMessage));

  @JsonKey(ignore: true)
  @override
  _$$_UserChatStateCopyWith<_$_UserChatState> get copyWith =>
      __$$_UserChatStateCopyWithImpl<_$_UserChatState>(this, _$identity);
}

abstract class _UserChatState implements UserChatState {
  const factory _UserChatState(
      {required final String userId,
      final bool? success,
      final String? message,
      final String? errorMessage}) = _$_UserChatState;

  @override
  String get userId;
  @override
  bool? get success;
  @override
  String? get message;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_UserChatStateCopyWith<_$_UserChatState> get copyWith =>
      throw _privateConstructorUsedError;
}
