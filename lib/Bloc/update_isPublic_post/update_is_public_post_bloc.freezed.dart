// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'update_is_public_post_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UpdateIsPublicPostEvent {
  String get postId => throw _privateConstructorUsedError;
  bool get isPublic => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String postId, bool isPublic)
        UpdateIsPublicPostRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String postId, bool isPublic)? UpdateIsPublicPostRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String postId, bool isPublic)? UpdateIsPublicPostRequest,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateIsPublicPostRequest value)
        UpdateIsPublicPostRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_UpdateIsPublicPostRequest value)?
        UpdateIsPublicPostRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateIsPublicPostRequest value)?
        UpdateIsPublicPostRequest,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UpdateIsPublicPostEventCopyWith<UpdateIsPublicPostEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateIsPublicPostEventCopyWith<$Res> {
  factory $UpdateIsPublicPostEventCopyWith(UpdateIsPublicPostEvent value,
          $Res Function(UpdateIsPublicPostEvent) then) =
      _$UpdateIsPublicPostEventCopyWithImpl<$Res>;
  $Res call({String postId, bool isPublic});
}

/// @nodoc
class _$UpdateIsPublicPostEventCopyWithImpl<$Res>
    implements $UpdateIsPublicPostEventCopyWith<$Res> {
  _$UpdateIsPublicPostEventCopyWithImpl(this._value, this._then);

  final UpdateIsPublicPostEvent _value;
  // ignore: unused_field
  final $Res Function(UpdateIsPublicPostEvent) _then;

  @override
  $Res call({
    Object? postId = freezed,
    Object? isPublic = freezed,
  }) {
    return _then(_value.copyWith(
      postId: postId == freezed
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      isPublic: isPublic == freezed
          ? _value.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_UpdateIsPublicPostRequestCopyWith<$Res>
    implements $UpdateIsPublicPostEventCopyWith<$Res> {
  factory _$$_UpdateIsPublicPostRequestCopyWith(
          _$_UpdateIsPublicPostRequest value,
          $Res Function(_$_UpdateIsPublicPostRequest) then) =
      __$$_UpdateIsPublicPostRequestCopyWithImpl<$Res>;
  @override
  $Res call({String postId, bool isPublic});
}

/// @nodoc
class __$$_UpdateIsPublicPostRequestCopyWithImpl<$Res>
    extends _$UpdateIsPublicPostEventCopyWithImpl<$Res>
    implements _$$_UpdateIsPublicPostRequestCopyWith<$Res> {
  __$$_UpdateIsPublicPostRequestCopyWithImpl(
      _$_UpdateIsPublicPostRequest _value,
      $Res Function(_$_UpdateIsPublicPostRequest) _then)
      : super(_value, (v) => _then(v as _$_UpdateIsPublicPostRequest));

  @override
  _$_UpdateIsPublicPostRequest get _value =>
      super._value as _$_UpdateIsPublicPostRequest;

  @override
  $Res call({
    Object? postId = freezed,
    Object? isPublic = freezed,
  }) {
    return _then(_$_UpdateIsPublicPostRequest(
      postId == freezed
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      isPublic == freezed
          ? _value.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_UpdateIsPublicPostRequest implements _UpdateIsPublicPostRequest {
  const _$_UpdateIsPublicPostRequest(this.postId, this.isPublic);

  @override
  final String postId;
  @override
  final bool isPublic;

  @override
  String toString() {
    return 'UpdateIsPublicPostEvent.UpdateIsPublicPostRequest(postId: $postId, isPublic: $isPublic)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateIsPublicPostRequest &&
            const DeepCollectionEquality().equals(other.postId, postId) &&
            const DeepCollectionEquality().equals(other.isPublic, isPublic));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(postId),
      const DeepCollectionEquality().hash(isPublic));

  @JsonKey(ignore: true)
  @override
  _$$_UpdateIsPublicPostRequestCopyWith<_$_UpdateIsPublicPostRequest>
      get copyWith => __$$_UpdateIsPublicPostRequestCopyWithImpl<
          _$_UpdateIsPublicPostRequest>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String postId, bool isPublic)
        UpdateIsPublicPostRequest,
  }) {
    return UpdateIsPublicPostRequest(postId, isPublic);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String postId, bool isPublic)? UpdateIsPublicPostRequest,
  }) {
    return UpdateIsPublicPostRequest?.call(postId, isPublic);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String postId, bool isPublic)? UpdateIsPublicPostRequest,
    required TResult orElse(),
  }) {
    if (UpdateIsPublicPostRequest != null) {
      return UpdateIsPublicPostRequest(postId, isPublic);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateIsPublicPostRequest value)
        UpdateIsPublicPostRequest,
  }) {
    return UpdateIsPublicPostRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_UpdateIsPublicPostRequest value)?
        UpdateIsPublicPostRequest,
  }) {
    return UpdateIsPublicPostRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateIsPublicPostRequest value)?
        UpdateIsPublicPostRequest,
    required TResult orElse(),
  }) {
    if (UpdateIsPublicPostRequest != null) {
      return UpdateIsPublicPostRequest(this);
    }
    return orElse();
  }
}

abstract class _UpdateIsPublicPostRequest implements UpdateIsPublicPostEvent {
  const factory _UpdateIsPublicPostRequest(
      final String postId, final bool isPublic) = _$_UpdateIsPublicPostRequest;

  @override
  String get postId;
  @override
  bool get isPublic;
  @override
  @JsonKey(ignore: true)
  _$$_UpdateIsPublicPostRequestCopyWith<_$_UpdateIsPublicPostRequest>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UpdateIsPublicPostState {
  String get userId => throw _privateConstructorUsedError;
  bool? get isPublic => throw _privateConstructorUsedError;
  bool? get success => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UpdateIsPublicPostStateCopyWith<UpdateIsPublicPostState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateIsPublicPostStateCopyWith<$Res> {
  factory $UpdateIsPublicPostStateCopyWith(UpdateIsPublicPostState value,
          $Res Function(UpdateIsPublicPostState) then) =
      _$UpdateIsPublicPostStateCopyWithImpl<$Res>;
  $Res call(
      {String userId,
      bool? isPublic,
      bool? success,
      String? message,
      String? errorMessage});
}

/// @nodoc
class _$UpdateIsPublicPostStateCopyWithImpl<$Res>
    implements $UpdateIsPublicPostStateCopyWith<$Res> {
  _$UpdateIsPublicPostStateCopyWithImpl(this._value, this._then);

  final UpdateIsPublicPostState _value;
  // ignore: unused_field
  final $Res Function(UpdateIsPublicPostState) _then;

  @override
  $Res call({
    Object? userId = freezed,
    Object? isPublic = freezed,
    Object? success = freezed,
    Object? message = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      isPublic: isPublic == freezed
          ? _value.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as bool?,
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
abstract class _$$_UpdateIsPublicPostStateCopyWith<$Res>
    implements $UpdateIsPublicPostStateCopyWith<$Res> {
  factory _$$_UpdateIsPublicPostStateCopyWith(_$_UpdateIsPublicPostState value,
          $Res Function(_$_UpdateIsPublicPostState) then) =
      __$$_UpdateIsPublicPostStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String userId,
      bool? isPublic,
      bool? success,
      String? message,
      String? errorMessage});
}

/// @nodoc
class __$$_UpdateIsPublicPostStateCopyWithImpl<$Res>
    extends _$UpdateIsPublicPostStateCopyWithImpl<$Res>
    implements _$$_UpdateIsPublicPostStateCopyWith<$Res> {
  __$$_UpdateIsPublicPostStateCopyWithImpl(_$_UpdateIsPublicPostState _value,
      $Res Function(_$_UpdateIsPublicPostState) _then)
      : super(_value, (v) => _then(v as _$_UpdateIsPublicPostState));

  @override
  _$_UpdateIsPublicPostState get _value =>
      super._value as _$_UpdateIsPublicPostState;

  @override
  $Res call({
    Object? userId = freezed,
    Object? isPublic = freezed,
    Object? success = freezed,
    Object? message = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_UpdateIsPublicPostState(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      isPublic: isPublic == freezed
          ? _value.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as bool?,
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

class _$_UpdateIsPublicPostState implements _UpdateIsPublicPostState {
  const _$_UpdateIsPublicPostState(
      {required this.userId,
      required this.isPublic,
      this.success,
      this.message,
      this.errorMessage});

  @override
  final String userId;
  @override
  final bool? isPublic;
  @override
  final bool? success;
  @override
  final String? message;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'UpdateIsPublicPostState(userId: $userId, isPublic: $isPublic, success: $success, message: $message, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateIsPublicPostState &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.isPublic, isPublic) &&
            const DeepCollectionEquality().equals(other.success, success) &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality()
                .equals(other.errorMessage, errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(isPublic),
      const DeepCollectionEquality().hash(success),
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(errorMessage));

  @JsonKey(ignore: true)
  @override
  _$$_UpdateIsPublicPostStateCopyWith<_$_UpdateIsPublicPostState>
      get copyWith =>
          __$$_UpdateIsPublicPostStateCopyWithImpl<_$_UpdateIsPublicPostState>(
              this, _$identity);
}

abstract class _UpdateIsPublicPostState implements UpdateIsPublicPostState {
  const factory _UpdateIsPublicPostState(
      {required final String userId,
      required final bool? isPublic,
      final bool? success,
      final String? message,
      final String? errorMessage}) = _$_UpdateIsPublicPostState;

  @override
  String get userId;
  @override
  bool? get isPublic;
  @override
  bool? get success;
  @override
  String? get message;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_UpdateIsPublicPostStateCopyWith<_$_UpdateIsPublicPostState>
      get copyWith => throw _privateConstructorUsedError;
}
