// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'create_post_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CreatePostEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String image) imageChanged,
    required TResult Function(String caption) captionChanged,
    required TResult Function(String userId) createPostRequest,
    required TResult Function() createCheckRequested,
    required TResult Function() setStateFlase,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String image)? imageChanged,
    TResult Function(String caption)? captionChanged,
    TResult Function(String userId)? createPostRequest,
    TResult Function()? createCheckRequested,
    TResult Function()? setStateFlase,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String image)? imageChanged,
    TResult Function(String caption)? captionChanged,
    TResult Function(String userId)? createPostRequest,
    TResult Function()? createCheckRequested,
    TResult Function()? setStateFlase,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ImageChanged value) imageChanged,
    required TResult Function(_CaptionChanged value) captionChanged,
    required TResult Function(_CreatePostRequest value) createPostRequest,
    required TResult Function(_CreateCheckRequested value) createCheckRequested,
    required TResult Function(_SetStateFlase value) setStateFlase,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ImageChanged value)? imageChanged,
    TResult Function(_CaptionChanged value)? captionChanged,
    TResult Function(_CreatePostRequest value)? createPostRequest,
    TResult Function(_CreateCheckRequested value)? createCheckRequested,
    TResult Function(_SetStateFlase value)? setStateFlase,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ImageChanged value)? imageChanged,
    TResult Function(_CaptionChanged value)? captionChanged,
    TResult Function(_CreatePostRequest value)? createPostRequest,
    TResult Function(_CreateCheckRequested value)? createCheckRequested,
    TResult Function(_SetStateFlase value)? setStateFlase,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatePostEventCopyWith<$Res> {
  factory $CreatePostEventCopyWith(
          CreatePostEvent value, $Res Function(CreatePostEvent) then) =
      _$CreatePostEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$CreatePostEventCopyWithImpl<$Res>
    implements $CreatePostEventCopyWith<$Res> {
  _$CreatePostEventCopyWithImpl(this._value, this._then);

  final CreatePostEvent _value;
  // ignore: unused_field
  final $Res Function(CreatePostEvent) _then;
}

/// @nodoc
abstract class _$$_ImageChangedCopyWith<$Res> {
  factory _$$_ImageChangedCopyWith(
          _$_ImageChanged value, $Res Function(_$_ImageChanged) then) =
      __$$_ImageChangedCopyWithImpl<$Res>;
  $Res call({String image});
}

/// @nodoc
class __$$_ImageChangedCopyWithImpl<$Res>
    extends _$CreatePostEventCopyWithImpl<$Res>
    implements _$$_ImageChangedCopyWith<$Res> {
  __$$_ImageChangedCopyWithImpl(
      _$_ImageChanged _value, $Res Function(_$_ImageChanged) _then)
      : super(_value, (v) => _then(v as _$_ImageChanged));

  @override
  _$_ImageChanged get _value => super._value as _$_ImageChanged;

  @override
  $Res call({
    Object? image = freezed,
  }) {
    return _then(_$_ImageChanged(
      image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ImageChanged implements _ImageChanged {
  const _$_ImageChanged(this.image);

  @override
  final String image;

  @override
  String toString() {
    return 'CreatePostEvent.imageChanged(image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ImageChanged &&
            const DeepCollectionEquality().equals(other.image, image));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(image));

  @JsonKey(ignore: true)
  @override
  _$$_ImageChangedCopyWith<_$_ImageChanged> get copyWith =>
      __$$_ImageChangedCopyWithImpl<_$_ImageChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String image) imageChanged,
    required TResult Function(String caption) captionChanged,
    required TResult Function(String userId) createPostRequest,
    required TResult Function() createCheckRequested,
    required TResult Function() setStateFlase,
  }) {
    return imageChanged(image);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String image)? imageChanged,
    TResult Function(String caption)? captionChanged,
    TResult Function(String userId)? createPostRequest,
    TResult Function()? createCheckRequested,
    TResult Function()? setStateFlase,
  }) {
    return imageChanged?.call(image);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String image)? imageChanged,
    TResult Function(String caption)? captionChanged,
    TResult Function(String userId)? createPostRequest,
    TResult Function()? createCheckRequested,
    TResult Function()? setStateFlase,
    required TResult orElse(),
  }) {
    if (imageChanged != null) {
      return imageChanged(image);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ImageChanged value) imageChanged,
    required TResult Function(_CaptionChanged value) captionChanged,
    required TResult Function(_CreatePostRequest value) createPostRequest,
    required TResult Function(_CreateCheckRequested value) createCheckRequested,
    required TResult Function(_SetStateFlase value) setStateFlase,
  }) {
    return imageChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ImageChanged value)? imageChanged,
    TResult Function(_CaptionChanged value)? captionChanged,
    TResult Function(_CreatePostRequest value)? createPostRequest,
    TResult Function(_CreateCheckRequested value)? createCheckRequested,
    TResult Function(_SetStateFlase value)? setStateFlase,
  }) {
    return imageChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ImageChanged value)? imageChanged,
    TResult Function(_CaptionChanged value)? captionChanged,
    TResult Function(_CreatePostRequest value)? createPostRequest,
    TResult Function(_CreateCheckRequested value)? createCheckRequested,
    TResult Function(_SetStateFlase value)? setStateFlase,
    required TResult orElse(),
  }) {
    if (imageChanged != null) {
      return imageChanged(this);
    }
    return orElse();
  }
}

abstract class _ImageChanged implements CreatePostEvent {
  const factory _ImageChanged(final String image) = _$_ImageChanged;

  String get image;
  @JsonKey(ignore: true)
  _$$_ImageChangedCopyWith<_$_ImageChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_CaptionChangedCopyWith<$Res> {
  factory _$$_CaptionChangedCopyWith(
          _$_CaptionChanged value, $Res Function(_$_CaptionChanged) then) =
      __$$_CaptionChangedCopyWithImpl<$Res>;
  $Res call({String caption});
}

/// @nodoc
class __$$_CaptionChangedCopyWithImpl<$Res>
    extends _$CreatePostEventCopyWithImpl<$Res>
    implements _$$_CaptionChangedCopyWith<$Res> {
  __$$_CaptionChangedCopyWithImpl(
      _$_CaptionChanged _value, $Res Function(_$_CaptionChanged) _then)
      : super(_value, (v) => _then(v as _$_CaptionChanged));

  @override
  _$_CaptionChanged get _value => super._value as _$_CaptionChanged;

  @override
  $Res call({
    Object? caption = freezed,
  }) {
    return _then(_$_CaptionChanged(
      caption == freezed
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_CaptionChanged implements _CaptionChanged {
  const _$_CaptionChanged(this.caption);

  @override
  final String caption;

  @override
  String toString() {
    return 'CreatePostEvent.captionChanged(caption: $caption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CaptionChanged &&
            const DeepCollectionEquality().equals(other.caption, caption));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(caption));

  @JsonKey(ignore: true)
  @override
  _$$_CaptionChangedCopyWith<_$_CaptionChanged> get copyWith =>
      __$$_CaptionChangedCopyWithImpl<_$_CaptionChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String image) imageChanged,
    required TResult Function(String caption) captionChanged,
    required TResult Function(String userId) createPostRequest,
    required TResult Function() createCheckRequested,
    required TResult Function() setStateFlase,
  }) {
    return captionChanged(caption);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String image)? imageChanged,
    TResult Function(String caption)? captionChanged,
    TResult Function(String userId)? createPostRequest,
    TResult Function()? createCheckRequested,
    TResult Function()? setStateFlase,
  }) {
    return captionChanged?.call(caption);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String image)? imageChanged,
    TResult Function(String caption)? captionChanged,
    TResult Function(String userId)? createPostRequest,
    TResult Function()? createCheckRequested,
    TResult Function()? setStateFlase,
    required TResult orElse(),
  }) {
    if (captionChanged != null) {
      return captionChanged(caption);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ImageChanged value) imageChanged,
    required TResult Function(_CaptionChanged value) captionChanged,
    required TResult Function(_CreatePostRequest value) createPostRequest,
    required TResult Function(_CreateCheckRequested value) createCheckRequested,
    required TResult Function(_SetStateFlase value) setStateFlase,
  }) {
    return captionChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ImageChanged value)? imageChanged,
    TResult Function(_CaptionChanged value)? captionChanged,
    TResult Function(_CreatePostRequest value)? createPostRequest,
    TResult Function(_CreateCheckRequested value)? createCheckRequested,
    TResult Function(_SetStateFlase value)? setStateFlase,
  }) {
    return captionChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ImageChanged value)? imageChanged,
    TResult Function(_CaptionChanged value)? captionChanged,
    TResult Function(_CreatePostRequest value)? createPostRequest,
    TResult Function(_CreateCheckRequested value)? createCheckRequested,
    TResult Function(_SetStateFlase value)? setStateFlase,
    required TResult orElse(),
  }) {
    if (captionChanged != null) {
      return captionChanged(this);
    }
    return orElse();
  }
}

abstract class _CaptionChanged implements CreatePostEvent {
  const factory _CaptionChanged(final String caption) = _$_CaptionChanged;

  String get caption;
  @JsonKey(ignore: true)
  _$$_CaptionChangedCopyWith<_$_CaptionChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_CreatePostRequestCopyWith<$Res> {
  factory _$$_CreatePostRequestCopyWith(_$_CreatePostRequest value,
          $Res Function(_$_CreatePostRequest) then) =
      __$$_CreatePostRequestCopyWithImpl<$Res>;
  $Res call({String userId});
}

/// @nodoc
class __$$_CreatePostRequestCopyWithImpl<$Res>
    extends _$CreatePostEventCopyWithImpl<$Res>
    implements _$$_CreatePostRequestCopyWith<$Res> {
  __$$_CreatePostRequestCopyWithImpl(
      _$_CreatePostRequest _value, $Res Function(_$_CreatePostRequest) _then)
      : super(_value, (v) => _then(v as _$_CreatePostRequest));

  @override
  _$_CreatePostRequest get _value => super._value as _$_CreatePostRequest;

  @override
  $Res call({
    Object? userId = freezed,
  }) {
    return _then(_$_CreatePostRequest(
      userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_CreatePostRequest implements _CreatePostRequest {
  const _$_CreatePostRequest(this.userId);

  @override
  final String userId;

  @override
  String toString() {
    return 'CreatePostEvent.createPostRequest(userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreatePostRequest &&
            const DeepCollectionEquality().equals(other.userId, userId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(userId));

  @JsonKey(ignore: true)
  @override
  _$$_CreatePostRequestCopyWith<_$_CreatePostRequest> get copyWith =>
      __$$_CreatePostRequestCopyWithImpl<_$_CreatePostRequest>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String image) imageChanged,
    required TResult Function(String caption) captionChanged,
    required TResult Function(String userId) createPostRequest,
    required TResult Function() createCheckRequested,
    required TResult Function() setStateFlase,
  }) {
    return createPostRequest(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String image)? imageChanged,
    TResult Function(String caption)? captionChanged,
    TResult Function(String userId)? createPostRequest,
    TResult Function()? createCheckRequested,
    TResult Function()? setStateFlase,
  }) {
    return createPostRequest?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String image)? imageChanged,
    TResult Function(String caption)? captionChanged,
    TResult Function(String userId)? createPostRequest,
    TResult Function()? createCheckRequested,
    TResult Function()? setStateFlase,
    required TResult orElse(),
  }) {
    if (createPostRequest != null) {
      return createPostRequest(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ImageChanged value) imageChanged,
    required TResult Function(_CaptionChanged value) captionChanged,
    required TResult Function(_CreatePostRequest value) createPostRequest,
    required TResult Function(_CreateCheckRequested value) createCheckRequested,
    required TResult Function(_SetStateFlase value) setStateFlase,
  }) {
    return createPostRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ImageChanged value)? imageChanged,
    TResult Function(_CaptionChanged value)? captionChanged,
    TResult Function(_CreatePostRequest value)? createPostRequest,
    TResult Function(_CreateCheckRequested value)? createCheckRequested,
    TResult Function(_SetStateFlase value)? setStateFlase,
  }) {
    return createPostRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ImageChanged value)? imageChanged,
    TResult Function(_CaptionChanged value)? captionChanged,
    TResult Function(_CreatePostRequest value)? createPostRequest,
    TResult Function(_CreateCheckRequested value)? createCheckRequested,
    TResult Function(_SetStateFlase value)? setStateFlase,
    required TResult orElse(),
  }) {
    if (createPostRequest != null) {
      return createPostRequest(this);
    }
    return orElse();
  }
}

abstract class _CreatePostRequest implements CreatePostEvent {
  const factory _CreatePostRequest(final String userId) = _$_CreatePostRequest;

  String get userId;
  @JsonKey(ignore: true)
  _$$_CreatePostRequestCopyWith<_$_CreatePostRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_CreateCheckRequestedCopyWith<$Res> {
  factory _$$_CreateCheckRequestedCopyWith(_$_CreateCheckRequested value,
          $Res Function(_$_CreateCheckRequested) then) =
      __$$_CreateCheckRequestedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_CreateCheckRequestedCopyWithImpl<$Res>
    extends _$CreatePostEventCopyWithImpl<$Res>
    implements _$$_CreateCheckRequestedCopyWith<$Res> {
  __$$_CreateCheckRequestedCopyWithImpl(_$_CreateCheckRequested _value,
      $Res Function(_$_CreateCheckRequested) _then)
      : super(_value, (v) => _then(v as _$_CreateCheckRequested));

  @override
  _$_CreateCheckRequested get _value => super._value as _$_CreateCheckRequested;
}

/// @nodoc

class _$_CreateCheckRequested implements _CreateCheckRequested {
  const _$_CreateCheckRequested();

  @override
  String toString() {
    return 'CreatePostEvent.createCheckRequested()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_CreateCheckRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String image) imageChanged,
    required TResult Function(String caption) captionChanged,
    required TResult Function(String userId) createPostRequest,
    required TResult Function() createCheckRequested,
    required TResult Function() setStateFlase,
  }) {
    return createCheckRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String image)? imageChanged,
    TResult Function(String caption)? captionChanged,
    TResult Function(String userId)? createPostRequest,
    TResult Function()? createCheckRequested,
    TResult Function()? setStateFlase,
  }) {
    return createCheckRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String image)? imageChanged,
    TResult Function(String caption)? captionChanged,
    TResult Function(String userId)? createPostRequest,
    TResult Function()? createCheckRequested,
    TResult Function()? setStateFlase,
    required TResult orElse(),
  }) {
    if (createCheckRequested != null) {
      return createCheckRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ImageChanged value) imageChanged,
    required TResult Function(_CaptionChanged value) captionChanged,
    required TResult Function(_CreatePostRequest value) createPostRequest,
    required TResult Function(_CreateCheckRequested value) createCheckRequested,
    required TResult Function(_SetStateFlase value) setStateFlase,
  }) {
    return createCheckRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ImageChanged value)? imageChanged,
    TResult Function(_CaptionChanged value)? captionChanged,
    TResult Function(_CreatePostRequest value)? createPostRequest,
    TResult Function(_CreateCheckRequested value)? createCheckRequested,
    TResult Function(_SetStateFlase value)? setStateFlase,
  }) {
    return createCheckRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ImageChanged value)? imageChanged,
    TResult Function(_CaptionChanged value)? captionChanged,
    TResult Function(_CreatePostRequest value)? createPostRequest,
    TResult Function(_CreateCheckRequested value)? createCheckRequested,
    TResult Function(_SetStateFlase value)? setStateFlase,
    required TResult orElse(),
  }) {
    if (createCheckRequested != null) {
      return createCheckRequested(this);
    }
    return orElse();
  }
}

abstract class _CreateCheckRequested implements CreatePostEvent {
  const factory _CreateCheckRequested() = _$_CreateCheckRequested;
}

/// @nodoc
abstract class _$$_SetStateFlaseCopyWith<$Res> {
  factory _$$_SetStateFlaseCopyWith(
          _$_SetStateFlase value, $Res Function(_$_SetStateFlase) then) =
      __$$_SetStateFlaseCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SetStateFlaseCopyWithImpl<$Res>
    extends _$CreatePostEventCopyWithImpl<$Res>
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
    return 'CreatePostEvent.setStateFlase()';
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
    required TResult Function(String image) imageChanged,
    required TResult Function(String caption) captionChanged,
    required TResult Function(String userId) createPostRequest,
    required TResult Function() createCheckRequested,
    required TResult Function() setStateFlase,
  }) {
    return setStateFlase();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String image)? imageChanged,
    TResult Function(String caption)? captionChanged,
    TResult Function(String userId)? createPostRequest,
    TResult Function()? createCheckRequested,
    TResult Function()? setStateFlase,
  }) {
    return setStateFlase?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String image)? imageChanged,
    TResult Function(String caption)? captionChanged,
    TResult Function(String userId)? createPostRequest,
    TResult Function()? createCheckRequested,
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
    required TResult Function(_ImageChanged value) imageChanged,
    required TResult Function(_CaptionChanged value) captionChanged,
    required TResult Function(_CreatePostRequest value) createPostRequest,
    required TResult Function(_CreateCheckRequested value) createCheckRequested,
    required TResult Function(_SetStateFlase value) setStateFlase,
  }) {
    return setStateFlase(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ImageChanged value)? imageChanged,
    TResult Function(_CaptionChanged value)? captionChanged,
    TResult Function(_CreatePostRequest value)? createPostRequest,
    TResult Function(_CreateCheckRequested value)? createCheckRequested,
    TResult Function(_SetStateFlase value)? setStateFlase,
  }) {
    return setStateFlase?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ImageChanged value)? imageChanged,
    TResult Function(_CaptionChanged value)? captionChanged,
    TResult Function(_CreatePostRequest value)? createPostRequest,
    TResult Function(_CreateCheckRequested value)? createCheckRequested,
    TResult Function(_SetStateFlase value)? setStateFlase,
    required TResult orElse(),
  }) {
    if (setStateFlase != null) {
      return setStateFlase(this);
    }
    return orElse();
  }
}

abstract class _SetStateFlase implements CreatePostEvent {
  const factory _SetStateFlase() = _$_SetStateFlase;
}

/// @nodoc
mixin _$CreatePostState {
  String get userId => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get caption => throw _privateConstructorUsedError;
  bool get isCreated => throw _privateConstructorUsedError;
  bool? get success => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreatePostStateCopyWith<CreatePostState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatePostStateCopyWith<$Res> {
  factory $CreatePostStateCopyWith(
          CreatePostState value, $Res Function(CreatePostState) then) =
      _$CreatePostStateCopyWithImpl<$Res>;
  $Res call(
      {String userId,
      String image,
      String caption,
      bool isCreated,
      bool? success,
      String? message,
      String? errorMessage});
}

/// @nodoc
class _$CreatePostStateCopyWithImpl<$Res>
    implements $CreatePostStateCopyWith<$Res> {
  _$CreatePostStateCopyWithImpl(this._value, this._then);

  final CreatePostState _value;
  // ignore: unused_field
  final $Res Function(CreatePostState) _then;

  @override
  $Res call({
    Object? userId = freezed,
    Object? image = freezed,
    Object? caption = freezed,
    Object? isCreated = freezed,
    Object? success = freezed,
    Object? message = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      caption: caption == freezed
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String,
      isCreated: isCreated == freezed
          ? _value.isCreated
          : isCreated // ignore: cast_nullable_to_non_nullable
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
    ));
  }
}

/// @nodoc
abstract class _$$_CreatePostStateCopyWith<$Res>
    implements $CreatePostStateCopyWith<$Res> {
  factory _$$_CreatePostStateCopyWith(
          _$_CreatePostState value, $Res Function(_$_CreatePostState) then) =
      __$$_CreatePostStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String userId,
      String image,
      String caption,
      bool isCreated,
      bool? success,
      String? message,
      String? errorMessage});
}

/// @nodoc
class __$$_CreatePostStateCopyWithImpl<$Res>
    extends _$CreatePostStateCopyWithImpl<$Res>
    implements _$$_CreatePostStateCopyWith<$Res> {
  __$$_CreatePostStateCopyWithImpl(
      _$_CreatePostState _value, $Res Function(_$_CreatePostState) _then)
      : super(_value, (v) => _then(v as _$_CreatePostState));

  @override
  _$_CreatePostState get _value => super._value as _$_CreatePostState;

  @override
  $Res call({
    Object? userId = freezed,
    Object? image = freezed,
    Object? caption = freezed,
    Object? isCreated = freezed,
    Object? success = freezed,
    Object? message = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_CreatePostState(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      caption: caption == freezed
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String,
      isCreated: isCreated == freezed
          ? _value.isCreated
          : isCreated // ignore: cast_nullable_to_non_nullable
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
    ));
  }
}

/// @nodoc

class _$_CreatePostState implements _CreatePostState {
  const _$_CreatePostState(
      {required this.userId,
      required this.image,
      required this.caption,
      required this.isCreated,
      this.success,
      this.message,
      this.errorMessage});

  @override
  final String userId;
  @override
  final String image;
  @override
  final String caption;
  @override
  final bool isCreated;
  @override
  final bool? success;
  @override
  final String? message;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'CreatePostState(userId: $userId, image: $image, caption: $caption, isCreated: $isCreated, success: $success, message: $message, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreatePostState &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.image, image) &&
            const DeepCollectionEquality().equals(other.caption, caption) &&
            const DeepCollectionEquality().equals(other.isCreated, isCreated) &&
            const DeepCollectionEquality().equals(other.success, success) &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality()
                .equals(other.errorMessage, errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(image),
      const DeepCollectionEquality().hash(caption),
      const DeepCollectionEquality().hash(isCreated),
      const DeepCollectionEquality().hash(success),
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(errorMessage));

  @JsonKey(ignore: true)
  @override
  _$$_CreatePostStateCopyWith<_$_CreatePostState> get copyWith =>
      __$$_CreatePostStateCopyWithImpl<_$_CreatePostState>(this, _$identity);
}

abstract class _CreatePostState implements CreatePostState {
  const factory _CreatePostState(
      {required final String userId,
      required final String image,
      required final String caption,
      required final bool isCreated,
      final bool? success,
      final String? message,
      final String? errorMessage}) = _$_CreatePostState;

  @override
  String get userId;
  @override
  String get image;
  @override
  String get caption;
  @override
  bool get isCreated;
  @override
  bool? get success;
  @override
  String? get message;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_CreatePostStateCopyWith<_$_CreatePostState> get copyWith =>
      throw _privateConstructorUsedError;
}
