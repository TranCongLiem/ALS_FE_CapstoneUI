// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'react_post_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReactPostEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) createReactPostRequest,
    required TResult Function(String userId, bool status)
        updateReactPostRequest,
    required TResult Function() checkExistReact,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String userId)? createReactPostRequest,
    TResult Function(String userId, bool status)? updateReactPostRequest,
    TResult Function()? checkExistReact,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? createReactPostRequest,
    TResult Function(String userId, bool status)? updateReactPostRequest,
    TResult Function()? checkExistReact,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateReactPostRequest value)
        createReactPostRequest,
    required TResult Function(_UpdateReactPostRequest value)
        updateReactPostRequest,
    required TResult Function(_CheckExistReact value) checkExistReact,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_CreateReactPostRequest value)? createReactPostRequest,
    TResult Function(_UpdateReactPostRequest value)? updateReactPostRequest,
    TResult Function(_CheckExistReact value)? checkExistReact,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateReactPostRequest value)? createReactPostRequest,
    TResult Function(_UpdateReactPostRequest value)? updateReactPostRequest,
    TResult Function(_CheckExistReact value)? checkExistReact,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReactPostEventCopyWith<$Res> {
  factory $ReactPostEventCopyWith(
          ReactPostEvent value, $Res Function(ReactPostEvent) then) =
      _$ReactPostEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$ReactPostEventCopyWithImpl<$Res>
    implements $ReactPostEventCopyWith<$Res> {
  _$ReactPostEventCopyWithImpl(this._value, this._then);

  final ReactPostEvent _value;
  // ignore: unused_field
  final $Res Function(ReactPostEvent) _then;
}

/// @nodoc
abstract class _$$_CreateReactPostRequestCopyWith<$Res> {
  factory _$$_CreateReactPostRequestCopyWith(_$_CreateReactPostRequest value,
          $Res Function(_$_CreateReactPostRequest) then) =
      __$$_CreateReactPostRequestCopyWithImpl<$Res>;
  $Res call({String userId});
}

/// @nodoc
class __$$_CreateReactPostRequestCopyWithImpl<$Res>
    extends _$ReactPostEventCopyWithImpl<$Res>
    implements _$$_CreateReactPostRequestCopyWith<$Res> {
  __$$_CreateReactPostRequestCopyWithImpl(_$_CreateReactPostRequest _value,
      $Res Function(_$_CreateReactPostRequest) _then)
      : super(_value, (v) => _then(v as _$_CreateReactPostRequest));

  @override
  _$_CreateReactPostRequest get _value =>
      super._value as _$_CreateReactPostRequest;

  @override
  $Res call({
    Object? userId = freezed,
  }) {
    return _then(_$_CreateReactPostRequest(
      userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_CreateReactPostRequest implements _CreateReactPostRequest {
  const _$_CreateReactPostRequest(this.userId);

  @override
  final String userId;

  @override
  String toString() {
    return 'ReactPostEvent.createReactPostRequest(userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateReactPostRequest &&
            const DeepCollectionEquality().equals(other.userId, userId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(userId));

  @JsonKey(ignore: true)
  @override
  _$$_CreateReactPostRequestCopyWith<_$_CreateReactPostRequest> get copyWith =>
      __$$_CreateReactPostRequestCopyWithImpl<_$_CreateReactPostRequest>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) createReactPostRequest,
    required TResult Function(String userId, bool status)
        updateReactPostRequest,
    required TResult Function() checkExistReact,
  }) {
    return createReactPostRequest(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String userId)? createReactPostRequest,
    TResult Function(String userId, bool status)? updateReactPostRequest,
    TResult Function()? checkExistReact,
  }) {
    return createReactPostRequest?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? createReactPostRequest,
    TResult Function(String userId, bool status)? updateReactPostRequest,
    TResult Function()? checkExistReact,
    required TResult orElse(),
  }) {
    if (createReactPostRequest != null) {
      return createReactPostRequest(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateReactPostRequest value)
        createReactPostRequest,
    required TResult Function(_UpdateReactPostRequest value)
        updateReactPostRequest,
    required TResult Function(_CheckExistReact value) checkExistReact,
  }) {
    return createReactPostRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_CreateReactPostRequest value)? createReactPostRequest,
    TResult Function(_UpdateReactPostRequest value)? updateReactPostRequest,
    TResult Function(_CheckExistReact value)? checkExistReact,
  }) {
    return createReactPostRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateReactPostRequest value)? createReactPostRequest,
    TResult Function(_UpdateReactPostRequest value)? updateReactPostRequest,
    TResult Function(_CheckExistReact value)? checkExistReact,
    required TResult orElse(),
  }) {
    if (createReactPostRequest != null) {
      return createReactPostRequest(this);
    }
    return orElse();
  }
}

abstract class _CreateReactPostRequest implements ReactPostEvent {
  const factory _CreateReactPostRequest(final String userId) =
      _$_CreateReactPostRequest;

  String get userId;
  @JsonKey(ignore: true)
  _$$_CreateReactPostRequestCopyWith<_$_CreateReactPostRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UpdateReactPostRequestCopyWith<$Res> {
  factory _$$_UpdateReactPostRequestCopyWith(_$_UpdateReactPostRequest value,
          $Res Function(_$_UpdateReactPostRequest) then) =
      __$$_UpdateReactPostRequestCopyWithImpl<$Res>;
  $Res call({String userId, bool status});
}

/// @nodoc
class __$$_UpdateReactPostRequestCopyWithImpl<$Res>
    extends _$ReactPostEventCopyWithImpl<$Res>
    implements _$$_UpdateReactPostRequestCopyWith<$Res> {
  __$$_UpdateReactPostRequestCopyWithImpl(_$_UpdateReactPostRequest _value,
      $Res Function(_$_UpdateReactPostRequest) _then)
      : super(_value, (v) => _then(v as _$_UpdateReactPostRequest));

  @override
  _$_UpdateReactPostRequest get _value =>
      super._value as _$_UpdateReactPostRequest;

  @override
  $Res call({
    Object? userId = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_UpdateReactPostRequest(
      userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_UpdateReactPostRequest implements _UpdateReactPostRequest {
  const _$_UpdateReactPostRequest(this.userId, this.status);

  @override
  final String userId;
  @override
  final bool status;

  @override
  String toString() {
    return 'ReactPostEvent.updateReactPostRequest(userId: $userId, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateReactPostRequest &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$$_UpdateReactPostRequestCopyWith<_$_UpdateReactPostRequest> get copyWith =>
      __$$_UpdateReactPostRequestCopyWithImpl<_$_UpdateReactPostRequest>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) createReactPostRequest,
    required TResult Function(String userId, bool status)
        updateReactPostRequest,
    required TResult Function() checkExistReact,
  }) {
    return updateReactPostRequest(userId, status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String userId)? createReactPostRequest,
    TResult Function(String userId, bool status)? updateReactPostRequest,
    TResult Function()? checkExistReact,
  }) {
    return updateReactPostRequest?.call(userId, status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? createReactPostRequest,
    TResult Function(String userId, bool status)? updateReactPostRequest,
    TResult Function()? checkExistReact,
    required TResult orElse(),
  }) {
    if (updateReactPostRequest != null) {
      return updateReactPostRequest(userId, status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateReactPostRequest value)
        createReactPostRequest,
    required TResult Function(_UpdateReactPostRequest value)
        updateReactPostRequest,
    required TResult Function(_CheckExistReact value) checkExistReact,
  }) {
    return updateReactPostRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_CreateReactPostRequest value)? createReactPostRequest,
    TResult Function(_UpdateReactPostRequest value)? updateReactPostRequest,
    TResult Function(_CheckExistReact value)? checkExistReact,
  }) {
    return updateReactPostRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateReactPostRequest value)? createReactPostRequest,
    TResult Function(_UpdateReactPostRequest value)? updateReactPostRequest,
    TResult Function(_CheckExistReact value)? checkExistReact,
    required TResult orElse(),
  }) {
    if (updateReactPostRequest != null) {
      return updateReactPostRequest(this);
    }
    return orElse();
  }
}

abstract class _UpdateReactPostRequest implements ReactPostEvent {
  const factory _UpdateReactPostRequest(
      final String userId, final bool status) = _$_UpdateReactPostRequest;

  String get userId;
  bool get status;
  @JsonKey(ignore: true)
  _$$_UpdateReactPostRequestCopyWith<_$_UpdateReactPostRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_CheckExistReactCopyWith<$Res> {
  factory _$$_CheckExistReactCopyWith(
          _$_CheckExistReact value, $Res Function(_$_CheckExistReact) then) =
      __$$_CheckExistReactCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_CheckExistReactCopyWithImpl<$Res>
    extends _$ReactPostEventCopyWithImpl<$Res>
    implements _$$_CheckExistReactCopyWith<$Res> {
  __$$_CheckExistReactCopyWithImpl(
      _$_CheckExistReact _value, $Res Function(_$_CheckExistReact) _then)
      : super(_value, (v) => _then(v as _$_CheckExistReact));

  @override
  _$_CheckExistReact get _value => super._value as _$_CheckExistReact;
}

/// @nodoc

class _$_CheckExistReact implements _CheckExistReact {
  const _$_CheckExistReact();

  @override
  String toString() {
    return 'ReactPostEvent.checkExistReact()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_CheckExistReact);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) createReactPostRequest,
    required TResult Function(String userId, bool status)
        updateReactPostRequest,
    required TResult Function() checkExistReact,
  }) {
    return checkExistReact();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String userId)? createReactPostRequest,
    TResult Function(String userId, bool status)? updateReactPostRequest,
    TResult Function()? checkExistReact,
  }) {
    return checkExistReact?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? createReactPostRequest,
    TResult Function(String userId, bool status)? updateReactPostRequest,
    TResult Function()? checkExistReact,
    required TResult orElse(),
  }) {
    if (checkExistReact != null) {
      return checkExistReact();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateReactPostRequest value)
        createReactPostRequest,
    required TResult Function(_UpdateReactPostRequest value)
        updateReactPostRequest,
    required TResult Function(_CheckExistReact value) checkExistReact,
  }) {
    return checkExistReact(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_CreateReactPostRequest value)? createReactPostRequest,
    TResult Function(_UpdateReactPostRequest value)? updateReactPostRequest,
    TResult Function(_CheckExistReact value)? checkExistReact,
  }) {
    return checkExistReact?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateReactPostRequest value)? createReactPostRequest,
    TResult Function(_UpdateReactPostRequest value)? updateReactPostRequest,
    TResult Function(_CheckExistReact value)? checkExistReact,
    required TResult orElse(),
  }) {
    if (checkExistReact != null) {
      return checkExistReact(this);
    }
    return orElse();
  }
}

abstract class _CheckExistReact implements ReactPostEvent {
  const factory _CheckExistReact() = _$_CheckExistReact;
}

/// @nodoc
mixin _$ReactPostState {
  String get userId => throw _privateConstructorUsedError;
  String get postId => throw _privateConstructorUsedError;
  bool get status => throw _privateConstructorUsedError;
  bool? get success => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  bool? get check => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReactPostStateCopyWith<ReactPostState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReactPostStateCopyWith<$Res> {
  factory $ReactPostStateCopyWith(
          ReactPostState value, $Res Function(ReactPostState) then) =
      _$ReactPostStateCopyWithImpl<$Res>;
  $Res call(
      {String userId,
      String postId,
      bool status,
      bool? success,
      String? message,
      String? errorMessage,
      bool? check});
}

/// @nodoc
class _$ReactPostStateCopyWithImpl<$Res>
    implements $ReactPostStateCopyWith<$Res> {
  _$ReactPostStateCopyWithImpl(this._value, this._then);

  final ReactPostState _value;
  // ignore: unused_field
  final $Res Function(ReactPostState) _then;

  @override
  $Res call({
    Object? userId = freezed,
    Object? postId = freezed,
    Object? status = freezed,
    Object? success = freezed,
    Object? message = freezed,
    Object? errorMessage = freezed,
    Object? check = freezed,
  }) {
    return _then(_value.copyWith(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      postId: postId == freezed
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
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
      check: check == freezed
          ? _value.check
          : check // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$$_ReactPostStateCopyWith<$Res>
    implements $ReactPostStateCopyWith<$Res> {
  factory _$$_ReactPostStateCopyWith(
          _$_ReactPostState value, $Res Function(_$_ReactPostState) then) =
      __$$_ReactPostStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String userId,
      String postId,
      bool status,
      bool? success,
      String? message,
      String? errorMessage,
      bool? check});
}

/// @nodoc
class __$$_ReactPostStateCopyWithImpl<$Res>
    extends _$ReactPostStateCopyWithImpl<$Res>
    implements _$$_ReactPostStateCopyWith<$Res> {
  __$$_ReactPostStateCopyWithImpl(
      _$_ReactPostState _value, $Res Function(_$_ReactPostState) _then)
      : super(_value, (v) => _then(v as _$_ReactPostState));

  @override
  _$_ReactPostState get _value => super._value as _$_ReactPostState;

  @override
  $Res call({
    Object? userId = freezed,
    Object? postId = freezed,
    Object? status = freezed,
    Object? success = freezed,
    Object? message = freezed,
    Object? errorMessage = freezed,
    Object? check = freezed,
  }) {
    return _then(_$_ReactPostState(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      postId: postId == freezed
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
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
      check: check == freezed
          ? _value.check
          : check // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$_ReactPostState implements _ReactPostState {
  const _$_ReactPostState(
      {required this.userId,
      required this.postId,
      required this.status,
      this.success,
      this.message,
      this.errorMessage,
      this.check});

  @override
  final String userId;
  @override
  final String postId;
  @override
  final bool status;
  @override
  final bool? success;
  @override
  final String? message;
  @override
  final String? errorMessage;
  @override
  final bool? check;

  @override
  String toString() {
    return 'ReactPostState(userId: $userId, postId: $postId, status: $status, success: $success, message: $message, errorMessage: $errorMessage, check: $check)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReactPostState &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.postId, postId) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.success, success) &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality()
                .equals(other.errorMessage, errorMessage) &&
            const DeepCollectionEquality().equals(other.check, check));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(postId),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(success),
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(errorMessage),
      const DeepCollectionEquality().hash(check));

  @JsonKey(ignore: true)
  @override
  _$$_ReactPostStateCopyWith<_$_ReactPostState> get copyWith =>
      __$$_ReactPostStateCopyWithImpl<_$_ReactPostState>(this, _$identity);
}

abstract class _ReactPostState implements ReactPostState {
  const factory _ReactPostState(
      {required final String userId,
      required final String postId,
      required final bool status,
      final bool? success,
      final String? message,
      final String? errorMessage,
      final bool? check}) = _$_ReactPostState;

  @override
  String get userId;
  @override
  String get postId;
  @override
  bool get status;
  @override
  bool? get success;
  @override
  String? get message;
  @override
  String? get errorMessage;
  @override
  bool? get check;
  @override
  @JsonKey(ignore: true)
  _$$_ReactPostStateCopyWith<_$_ReactPostState> get copyWith =>
      throw _privateConstructorUsedError;
}
