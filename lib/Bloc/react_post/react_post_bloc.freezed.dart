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
  String get userId => throw _privateConstructorUsedError;
  String get postId => throw _privateConstructorUsedError;
  bool get status => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId, String postId, bool status)
        reactPostRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String userId, String postId, bool status)?
        reactPostRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId, String postId, bool status)?
        reactPostRequest,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ReactPostRequest value) reactPostRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ReactPostRequest value)? reactPostRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ReactPostRequest value)? reactPostRequest,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReactPostEventCopyWith<ReactPostEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReactPostEventCopyWith<$Res> {
  factory $ReactPostEventCopyWith(
          ReactPostEvent value, $Res Function(ReactPostEvent) then) =
      _$ReactPostEventCopyWithImpl<$Res>;
  $Res call({String userId, String postId, bool status});
}

/// @nodoc
class _$ReactPostEventCopyWithImpl<$Res>
    implements $ReactPostEventCopyWith<$Res> {
  _$ReactPostEventCopyWithImpl(this._value, this._then);

  final ReactPostEvent _value;
  // ignore: unused_field
  final $Res Function(ReactPostEvent) _then;

  @override
  $Res call({
    Object? userId = freezed,
    Object? postId = freezed,
    Object? status = freezed,
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
    ));
  }
}

/// @nodoc
abstract class _$$_ReactPostRequestCopyWith<$Res>
    implements $ReactPostEventCopyWith<$Res> {
  factory _$$_ReactPostRequestCopyWith(
          _$_ReactPostRequest value, $Res Function(_$_ReactPostRequest) then) =
      __$$_ReactPostRequestCopyWithImpl<$Res>;
  @override
  $Res call({String userId, String postId, bool status});
}

/// @nodoc
class __$$_ReactPostRequestCopyWithImpl<$Res>
    extends _$ReactPostEventCopyWithImpl<$Res>
    implements _$$_ReactPostRequestCopyWith<$Res> {
  __$$_ReactPostRequestCopyWithImpl(
      _$_ReactPostRequest _value, $Res Function(_$_ReactPostRequest) _then)
      : super(_value, (v) => _then(v as _$_ReactPostRequest));

  @override
  _$_ReactPostRequest get _value => super._value as _$_ReactPostRequest;

  @override
  $Res call({
    Object? userId = freezed,
    Object? postId = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_ReactPostRequest(
      userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      postId == freezed
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ReactPostRequest implements _ReactPostRequest {
  const _$_ReactPostRequest(this.userId, this.postId, this.status);

  @override
  final String userId;
  @override
  final String postId;
  @override
  final bool status;

  @override
  String toString() {
    return 'ReactPostEvent.reactPostRequest(userId: $userId, postId: $postId, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReactPostRequest &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.postId, postId) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(postId),
      const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$$_ReactPostRequestCopyWith<_$_ReactPostRequest> get copyWith =>
      __$$_ReactPostRequestCopyWithImpl<_$_ReactPostRequest>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId, String postId, bool status)
        reactPostRequest,
  }) {
    return reactPostRequest(userId, postId, status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String userId, String postId, bool status)?
        reactPostRequest,
  }) {
    return reactPostRequest?.call(userId, postId, status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId, String postId, bool status)?
        reactPostRequest,
    required TResult orElse(),
  }) {
    if (reactPostRequest != null) {
      return reactPostRequest(userId, postId, status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ReactPostRequest value) reactPostRequest,
  }) {
    return reactPostRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ReactPostRequest value)? reactPostRequest,
  }) {
    return reactPostRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ReactPostRequest value)? reactPostRequest,
    required TResult orElse(),
  }) {
    if (reactPostRequest != null) {
      return reactPostRequest(this);
    }
    return orElse();
  }
}

abstract class _ReactPostRequest implements ReactPostEvent {
  const factory _ReactPostRequest(
          final String userId, final String postId, final bool status) =
      _$_ReactPostRequest;

  @override
  String get userId;
  @override
  String get postId;
  @override
  bool get status;
  @override
  @JsonKey(ignore: true)
  _$$_ReactPostRequestCopyWith<_$_ReactPostRequest> get copyWith =>
      throw _privateConstructorUsedError;
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
