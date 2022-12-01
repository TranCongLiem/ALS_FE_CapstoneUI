// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'create_record_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CreateRecordEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String recordName) recordNameChanged,
    required TResult Function(String linkAudio) linkAudioChanged,
    required TResult Function(String userId) createRecordRequest,
    required TResult Function(String userId) createRecordConfirmedRequest,
    required TResult Function() setStateFlase,
    required TResult Function() createCheckRequested,
    required TResult Function() setErrorMessageRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String recordName)? recordNameChanged,
    TResult Function(String linkAudio)? linkAudioChanged,
    TResult Function(String userId)? createRecordRequest,
    TResult Function(String userId)? createRecordConfirmedRequest,
    TResult Function()? setStateFlase,
    TResult Function()? createCheckRequested,
    TResult Function()? setErrorMessageRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String recordName)? recordNameChanged,
    TResult Function(String linkAudio)? linkAudioChanged,
    TResult Function(String userId)? createRecordRequest,
    TResult Function(String userId)? createRecordConfirmedRequest,
    TResult Function()? setStateFlase,
    TResult Function()? createCheckRequested,
    TResult Function()? setErrorMessageRequested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RecordNameChanged value) recordNameChanged,
    required TResult Function(_LinkAudioChanged value) linkAudioChanged,
    required TResult Function(_CreateRecordRequest value) createRecordRequest,
    required TResult Function(_CreateRecordConfirmedRequest value)
        createRecordConfirmedRequest,
    required TResult Function(_SetStateFlase value) setStateFlase,
    required TResult Function(_CreateCheckRequested value) createCheckRequested,
    required TResult Function(_SetErrorMessageRequested value)
        setErrorMessageRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_RecordNameChanged value)? recordNameChanged,
    TResult Function(_LinkAudioChanged value)? linkAudioChanged,
    TResult Function(_CreateRecordRequest value)? createRecordRequest,
    TResult Function(_CreateRecordConfirmedRequest value)?
        createRecordConfirmedRequest,
    TResult Function(_SetStateFlase value)? setStateFlase,
    TResult Function(_CreateCheckRequested value)? createCheckRequested,
    TResult Function(_SetErrorMessageRequested value)? setErrorMessageRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RecordNameChanged value)? recordNameChanged,
    TResult Function(_LinkAudioChanged value)? linkAudioChanged,
    TResult Function(_CreateRecordRequest value)? createRecordRequest,
    TResult Function(_CreateRecordConfirmedRequest value)?
        createRecordConfirmedRequest,
    TResult Function(_SetStateFlase value)? setStateFlase,
    TResult Function(_CreateCheckRequested value)? createCheckRequested,
    TResult Function(_SetErrorMessageRequested value)? setErrorMessageRequested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateRecordEventCopyWith<$Res> {
  factory $CreateRecordEventCopyWith(
          CreateRecordEvent value, $Res Function(CreateRecordEvent) then) =
      _$CreateRecordEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$CreateRecordEventCopyWithImpl<$Res>
    implements $CreateRecordEventCopyWith<$Res> {
  _$CreateRecordEventCopyWithImpl(this._value, this._then);

  final CreateRecordEvent _value;
  // ignore: unused_field
  final $Res Function(CreateRecordEvent) _then;
}

/// @nodoc
abstract class _$$_RecordNameChangedCopyWith<$Res> {
  factory _$$_RecordNameChangedCopyWith(_$_RecordNameChanged value,
          $Res Function(_$_RecordNameChanged) then) =
      __$$_RecordNameChangedCopyWithImpl<$Res>;
  $Res call({String recordName});
}

/// @nodoc
class __$$_RecordNameChangedCopyWithImpl<$Res>
    extends _$CreateRecordEventCopyWithImpl<$Res>
    implements _$$_RecordNameChangedCopyWith<$Res> {
  __$$_RecordNameChangedCopyWithImpl(
      _$_RecordNameChanged _value, $Res Function(_$_RecordNameChanged) _then)
      : super(_value, (v) => _then(v as _$_RecordNameChanged));

  @override
  _$_RecordNameChanged get _value => super._value as _$_RecordNameChanged;

  @override
  $Res call({
    Object? recordName = freezed,
  }) {
    return _then(_$_RecordNameChanged(
      recordName == freezed
          ? _value.recordName
          : recordName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_RecordNameChanged implements _RecordNameChanged {
  const _$_RecordNameChanged(this.recordName);

  @override
  final String recordName;

  @override
  String toString() {
    return 'CreateRecordEvent.recordNameChanged(recordName: $recordName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecordNameChanged &&
            const DeepCollectionEquality()
                .equals(other.recordName, recordName));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(recordName));

  @JsonKey(ignore: true)
  @override
  _$$_RecordNameChangedCopyWith<_$_RecordNameChanged> get copyWith =>
      __$$_RecordNameChangedCopyWithImpl<_$_RecordNameChanged>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String recordName) recordNameChanged,
    required TResult Function(String linkAudio) linkAudioChanged,
    required TResult Function(String userId) createRecordRequest,
    required TResult Function(String userId) createRecordConfirmedRequest,
    required TResult Function() setStateFlase,
    required TResult Function() createCheckRequested,
    required TResult Function() setErrorMessageRequested,
  }) {
    return recordNameChanged(recordName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String recordName)? recordNameChanged,
    TResult Function(String linkAudio)? linkAudioChanged,
    TResult Function(String userId)? createRecordRequest,
    TResult Function(String userId)? createRecordConfirmedRequest,
    TResult Function()? setStateFlase,
    TResult Function()? createCheckRequested,
    TResult Function()? setErrorMessageRequested,
  }) {
    return recordNameChanged?.call(recordName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String recordName)? recordNameChanged,
    TResult Function(String linkAudio)? linkAudioChanged,
    TResult Function(String userId)? createRecordRequest,
    TResult Function(String userId)? createRecordConfirmedRequest,
    TResult Function()? setStateFlase,
    TResult Function()? createCheckRequested,
    TResult Function()? setErrorMessageRequested,
    required TResult orElse(),
  }) {
    if (recordNameChanged != null) {
      return recordNameChanged(recordName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RecordNameChanged value) recordNameChanged,
    required TResult Function(_LinkAudioChanged value) linkAudioChanged,
    required TResult Function(_CreateRecordRequest value) createRecordRequest,
    required TResult Function(_CreateRecordConfirmedRequest value)
        createRecordConfirmedRequest,
    required TResult Function(_SetStateFlase value) setStateFlase,
    required TResult Function(_CreateCheckRequested value) createCheckRequested,
    required TResult Function(_SetErrorMessageRequested value)
        setErrorMessageRequested,
  }) {
    return recordNameChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_RecordNameChanged value)? recordNameChanged,
    TResult Function(_LinkAudioChanged value)? linkAudioChanged,
    TResult Function(_CreateRecordRequest value)? createRecordRequest,
    TResult Function(_CreateRecordConfirmedRequest value)?
        createRecordConfirmedRequest,
    TResult Function(_SetStateFlase value)? setStateFlase,
    TResult Function(_CreateCheckRequested value)? createCheckRequested,
    TResult Function(_SetErrorMessageRequested value)? setErrorMessageRequested,
  }) {
    return recordNameChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RecordNameChanged value)? recordNameChanged,
    TResult Function(_LinkAudioChanged value)? linkAudioChanged,
    TResult Function(_CreateRecordRequest value)? createRecordRequest,
    TResult Function(_CreateRecordConfirmedRequest value)?
        createRecordConfirmedRequest,
    TResult Function(_SetStateFlase value)? setStateFlase,
    TResult Function(_CreateCheckRequested value)? createCheckRequested,
    TResult Function(_SetErrorMessageRequested value)? setErrorMessageRequested,
    required TResult orElse(),
  }) {
    if (recordNameChanged != null) {
      return recordNameChanged(this);
    }
    return orElse();
  }
}

abstract class _RecordNameChanged implements CreateRecordEvent {
  const factory _RecordNameChanged(final String recordName) =
      _$_RecordNameChanged;

  String get recordName;
  @JsonKey(ignore: true)
  _$$_RecordNameChangedCopyWith<_$_RecordNameChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LinkAudioChangedCopyWith<$Res> {
  factory _$$_LinkAudioChangedCopyWith(
          _$_LinkAudioChanged value, $Res Function(_$_LinkAudioChanged) then) =
      __$$_LinkAudioChangedCopyWithImpl<$Res>;
  $Res call({String linkAudio});
}

/// @nodoc
class __$$_LinkAudioChangedCopyWithImpl<$Res>
    extends _$CreateRecordEventCopyWithImpl<$Res>
    implements _$$_LinkAudioChangedCopyWith<$Res> {
  __$$_LinkAudioChangedCopyWithImpl(
      _$_LinkAudioChanged _value, $Res Function(_$_LinkAudioChanged) _then)
      : super(_value, (v) => _then(v as _$_LinkAudioChanged));

  @override
  _$_LinkAudioChanged get _value => super._value as _$_LinkAudioChanged;

  @override
  $Res call({
    Object? linkAudio = freezed,
  }) {
    return _then(_$_LinkAudioChanged(
      linkAudio == freezed
          ? _value.linkAudio
          : linkAudio // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LinkAudioChanged implements _LinkAudioChanged {
  const _$_LinkAudioChanged(this.linkAudio);

  @override
  final String linkAudio;

  @override
  String toString() {
    return 'CreateRecordEvent.linkAudioChanged(linkAudio: $linkAudio)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LinkAudioChanged &&
            const DeepCollectionEquality().equals(other.linkAudio, linkAudio));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(linkAudio));

  @JsonKey(ignore: true)
  @override
  _$$_LinkAudioChangedCopyWith<_$_LinkAudioChanged> get copyWith =>
      __$$_LinkAudioChangedCopyWithImpl<_$_LinkAudioChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String recordName) recordNameChanged,
    required TResult Function(String linkAudio) linkAudioChanged,
    required TResult Function(String userId) createRecordRequest,
    required TResult Function(String userId) createRecordConfirmedRequest,
    required TResult Function() setStateFlase,
    required TResult Function() createCheckRequested,
    required TResult Function() setErrorMessageRequested,
  }) {
    return linkAudioChanged(linkAudio);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String recordName)? recordNameChanged,
    TResult Function(String linkAudio)? linkAudioChanged,
    TResult Function(String userId)? createRecordRequest,
    TResult Function(String userId)? createRecordConfirmedRequest,
    TResult Function()? setStateFlase,
    TResult Function()? createCheckRequested,
    TResult Function()? setErrorMessageRequested,
  }) {
    return linkAudioChanged?.call(linkAudio);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String recordName)? recordNameChanged,
    TResult Function(String linkAudio)? linkAudioChanged,
    TResult Function(String userId)? createRecordRequest,
    TResult Function(String userId)? createRecordConfirmedRequest,
    TResult Function()? setStateFlase,
    TResult Function()? createCheckRequested,
    TResult Function()? setErrorMessageRequested,
    required TResult orElse(),
  }) {
    if (linkAudioChanged != null) {
      return linkAudioChanged(linkAudio);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RecordNameChanged value) recordNameChanged,
    required TResult Function(_LinkAudioChanged value) linkAudioChanged,
    required TResult Function(_CreateRecordRequest value) createRecordRequest,
    required TResult Function(_CreateRecordConfirmedRequest value)
        createRecordConfirmedRequest,
    required TResult Function(_SetStateFlase value) setStateFlase,
    required TResult Function(_CreateCheckRequested value) createCheckRequested,
    required TResult Function(_SetErrorMessageRequested value)
        setErrorMessageRequested,
  }) {
    return linkAudioChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_RecordNameChanged value)? recordNameChanged,
    TResult Function(_LinkAudioChanged value)? linkAudioChanged,
    TResult Function(_CreateRecordRequest value)? createRecordRequest,
    TResult Function(_CreateRecordConfirmedRequest value)?
        createRecordConfirmedRequest,
    TResult Function(_SetStateFlase value)? setStateFlase,
    TResult Function(_CreateCheckRequested value)? createCheckRequested,
    TResult Function(_SetErrorMessageRequested value)? setErrorMessageRequested,
  }) {
    return linkAudioChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RecordNameChanged value)? recordNameChanged,
    TResult Function(_LinkAudioChanged value)? linkAudioChanged,
    TResult Function(_CreateRecordRequest value)? createRecordRequest,
    TResult Function(_CreateRecordConfirmedRequest value)?
        createRecordConfirmedRequest,
    TResult Function(_SetStateFlase value)? setStateFlase,
    TResult Function(_CreateCheckRequested value)? createCheckRequested,
    TResult Function(_SetErrorMessageRequested value)? setErrorMessageRequested,
    required TResult orElse(),
  }) {
    if (linkAudioChanged != null) {
      return linkAudioChanged(this);
    }
    return orElse();
  }
}

abstract class _LinkAudioChanged implements CreateRecordEvent {
  const factory _LinkAudioChanged(final String linkAudio) = _$_LinkAudioChanged;

  String get linkAudio;
  @JsonKey(ignore: true)
  _$$_LinkAudioChangedCopyWith<_$_LinkAudioChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_CreateRecordRequestCopyWith<$Res> {
  factory _$$_CreateRecordRequestCopyWith(_$_CreateRecordRequest value,
          $Res Function(_$_CreateRecordRequest) then) =
      __$$_CreateRecordRequestCopyWithImpl<$Res>;
  $Res call({String userId});
}

/// @nodoc
class __$$_CreateRecordRequestCopyWithImpl<$Res>
    extends _$CreateRecordEventCopyWithImpl<$Res>
    implements _$$_CreateRecordRequestCopyWith<$Res> {
  __$$_CreateRecordRequestCopyWithImpl(_$_CreateRecordRequest _value,
      $Res Function(_$_CreateRecordRequest) _then)
      : super(_value, (v) => _then(v as _$_CreateRecordRequest));

  @override
  _$_CreateRecordRequest get _value => super._value as _$_CreateRecordRequest;

  @override
  $Res call({
    Object? userId = freezed,
  }) {
    return _then(_$_CreateRecordRequest(
      userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_CreateRecordRequest implements _CreateRecordRequest {
  const _$_CreateRecordRequest(this.userId);

  @override
  final String userId;

  @override
  String toString() {
    return 'CreateRecordEvent.createRecordRequest(userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateRecordRequest &&
            const DeepCollectionEquality().equals(other.userId, userId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(userId));

  @JsonKey(ignore: true)
  @override
  _$$_CreateRecordRequestCopyWith<_$_CreateRecordRequest> get copyWith =>
      __$$_CreateRecordRequestCopyWithImpl<_$_CreateRecordRequest>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String recordName) recordNameChanged,
    required TResult Function(String linkAudio) linkAudioChanged,
    required TResult Function(String userId) createRecordRequest,
    required TResult Function(String userId) createRecordConfirmedRequest,
    required TResult Function() setStateFlase,
    required TResult Function() createCheckRequested,
    required TResult Function() setErrorMessageRequested,
  }) {
    return createRecordRequest(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String recordName)? recordNameChanged,
    TResult Function(String linkAudio)? linkAudioChanged,
    TResult Function(String userId)? createRecordRequest,
    TResult Function(String userId)? createRecordConfirmedRequest,
    TResult Function()? setStateFlase,
    TResult Function()? createCheckRequested,
    TResult Function()? setErrorMessageRequested,
  }) {
    return createRecordRequest?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String recordName)? recordNameChanged,
    TResult Function(String linkAudio)? linkAudioChanged,
    TResult Function(String userId)? createRecordRequest,
    TResult Function(String userId)? createRecordConfirmedRequest,
    TResult Function()? setStateFlase,
    TResult Function()? createCheckRequested,
    TResult Function()? setErrorMessageRequested,
    required TResult orElse(),
  }) {
    if (createRecordRequest != null) {
      return createRecordRequest(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RecordNameChanged value) recordNameChanged,
    required TResult Function(_LinkAudioChanged value) linkAudioChanged,
    required TResult Function(_CreateRecordRequest value) createRecordRequest,
    required TResult Function(_CreateRecordConfirmedRequest value)
        createRecordConfirmedRequest,
    required TResult Function(_SetStateFlase value) setStateFlase,
    required TResult Function(_CreateCheckRequested value) createCheckRequested,
    required TResult Function(_SetErrorMessageRequested value)
        setErrorMessageRequested,
  }) {
    return createRecordRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_RecordNameChanged value)? recordNameChanged,
    TResult Function(_LinkAudioChanged value)? linkAudioChanged,
    TResult Function(_CreateRecordRequest value)? createRecordRequest,
    TResult Function(_CreateRecordConfirmedRequest value)?
        createRecordConfirmedRequest,
    TResult Function(_SetStateFlase value)? setStateFlase,
    TResult Function(_CreateCheckRequested value)? createCheckRequested,
    TResult Function(_SetErrorMessageRequested value)? setErrorMessageRequested,
  }) {
    return createRecordRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RecordNameChanged value)? recordNameChanged,
    TResult Function(_LinkAudioChanged value)? linkAudioChanged,
    TResult Function(_CreateRecordRequest value)? createRecordRequest,
    TResult Function(_CreateRecordConfirmedRequest value)?
        createRecordConfirmedRequest,
    TResult Function(_SetStateFlase value)? setStateFlase,
    TResult Function(_CreateCheckRequested value)? createCheckRequested,
    TResult Function(_SetErrorMessageRequested value)? setErrorMessageRequested,
    required TResult orElse(),
  }) {
    if (createRecordRequest != null) {
      return createRecordRequest(this);
    }
    return orElse();
  }
}

abstract class _CreateRecordRequest implements CreateRecordEvent {
  const factory _CreateRecordRequest(final String userId) =
      _$_CreateRecordRequest;

  String get userId;
  @JsonKey(ignore: true)
  _$$_CreateRecordRequestCopyWith<_$_CreateRecordRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_CreateRecordConfirmedRequestCopyWith<$Res> {
  factory _$$_CreateRecordConfirmedRequestCopyWith(
          _$_CreateRecordConfirmedRequest value,
          $Res Function(_$_CreateRecordConfirmedRequest) then) =
      __$$_CreateRecordConfirmedRequestCopyWithImpl<$Res>;
  $Res call({String userId});
}

/// @nodoc
class __$$_CreateRecordConfirmedRequestCopyWithImpl<$Res>
    extends _$CreateRecordEventCopyWithImpl<$Res>
    implements _$$_CreateRecordConfirmedRequestCopyWith<$Res> {
  __$$_CreateRecordConfirmedRequestCopyWithImpl(
      _$_CreateRecordConfirmedRequest _value,
      $Res Function(_$_CreateRecordConfirmedRequest) _then)
      : super(_value, (v) => _then(v as _$_CreateRecordConfirmedRequest));

  @override
  _$_CreateRecordConfirmedRequest get _value =>
      super._value as _$_CreateRecordConfirmedRequest;

  @override
  $Res call({
    Object? userId = freezed,
  }) {
    return _then(_$_CreateRecordConfirmedRequest(
      userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_CreateRecordConfirmedRequest implements _CreateRecordConfirmedRequest {
  const _$_CreateRecordConfirmedRequest(this.userId);

  @override
  final String userId;

  @override
  String toString() {
    return 'CreateRecordEvent.createRecordConfirmedRequest(userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateRecordConfirmedRequest &&
            const DeepCollectionEquality().equals(other.userId, userId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(userId));

  @JsonKey(ignore: true)
  @override
  _$$_CreateRecordConfirmedRequestCopyWith<_$_CreateRecordConfirmedRequest>
      get copyWith => __$$_CreateRecordConfirmedRequestCopyWithImpl<
          _$_CreateRecordConfirmedRequest>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String recordName) recordNameChanged,
    required TResult Function(String linkAudio) linkAudioChanged,
    required TResult Function(String userId) createRecordRequest,
    required TResult Function(String userId) createRecordConfirmedRequest,
    required TResult Function() setStateFlase,
    required TResult Function() createCheckRequested,
    required TResult Function() setErrorMessageRequested,
  }) {
    return createRecordConfirmedRequest(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String recordName)? recordNameChanged,
    TResult Function(String linkAudio)? linkAudioChanged,
    TResult Function(String userId)? createRecordRequest,
    TResult Function(String userId)? createRecordConfirmedRequest,
    TResult Function()? setStateFlase,
    TResult Function()? createCheckRequested,
    TResult Function()? setErrorMessageRequested,
  }) {
    return createRecordConfirmedRequest?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String recordName)? recordNameChanged,
    TResult Function(String linkAudio)? linkAudioChanged,
    TResult Function(String userId)? createRecordRequest,
    TResult Function(String userId)? createRecordConfirmedRequest,
    TResult Function()? setStateFlase,
    TResult Function()? createCheckRequested,
    TResult Function()? setErrorMessageRequested,
    required TResult orElse(),
  }) {
    if (createRecordConfirmedRequest != null) {
      return createRecordConfirmedRequest(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RecordNameChanged value) recordNameChanged,
    required TResult Function(_LinkAudioChanged value) linkAudioChanged,
    required TResult Function(_CreateRecordRequest value) createRecordRequest,
    required TResult Function(_CreateRecordConfirmedRequest value)
        createRecordConfirmedRequest,
    required TResult Function(_SetStateFlase value) setStateFlase,
    required TResult Function(_CreateCheckRequested value) createCheckRequested,
    required TResult Function(_SetErrorMessageRequested value)
        setErrorMessageRequested,
  }) {
    return createRecordConfirmedRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_RecordNameChanged value)? recordNameChanged,
    TResult Function(_LinkAudioChanged value)? linkAudioChanged,
    TResult Function(_CreateRecordRequest value)? createRecordRequest,
    TResult Function(_CreateRecordConfirmedRequest value)?
        createRecordConfirmedRequest,
    TResult Function(_SetStateFlase value)? setStateFlase,
    TResult Function(_CreateCheckRequested value)? createCheckRequested,
    TResult Function(_SetErrorMessageRequested value)? setErrorMessageRequested,
  }) {
    return createRecordConfirmedRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RecordNameChanged value)? recordNameChanged,
    TResult Function(_LinkAudioChanged value)? linkAudioChanged,
    TResult Function(_CreateRecordRequest value)? createRecordRequest,
    TResult Function(_CreateRecordConfirmedRequest value)?
        createRecordConfirmedRequest,
    TResult Function(_SetStateFlase value)? setStateFlase,
    TResult Function(_CreateCheckRequested value)? createCheckRequested,
    TResult Function(_SetErrorMessageRequested value)? setErrorMessageRequested,
    required TResult orElse(),
  }) {
    if (createRecordConfirmedRequest != null) {
      return createRecordConfirmedRequest(this);
    }
    return orElse();
  }
}

abstract class _CreateRecordConfirmedRequest implements CreateRecordEvent {
  const factory _CreateRecordConfirmedRequest(final String userId) =
      _$_CreateRecordConfirmedRequest;

  String get userId;
  @JsonKey(ignore: true)
  _$$_CreateRecordConfirmedRequestCopyWith<_$_CreateRecordConfirmedRequest>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SetStateFlaseCopyWith<$Res> {
  factory _$$_SetStateFlaseCopyWith(
          _$_SetStateFlase value, $Res Function(_$_SetStateFlase) then) =
      __$$_SetStateFlaseCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SetStateFlaseCopyWithImpl<$Res>
    extends _$CreateRecordEventCopyWithImpl<$Res>
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
    return 'CreateRecordEvent.setStateFlase()';
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
    required TResult Function(String recordName) recordNameChanged,
    required TResult Function(String linkAudio) linkAudioChanged,
    required TResult Function(String userId) createRecordRequest,
    required TResult Function(String userId) createRecordConfirmedRequest,
    required TResult Function() setStateFlase,
    required TResult Function() createCheckRequested,
    required TResult Function() setErrorMessageRequested,
  }) {
    return setStateFlase();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String recordName)? recordNameChanged,
    TResult Function(String linkAudio)? linkAudioChanged,
    TResult Function(String userId)? createRecordRequest,
    TResult Function(String userId)? createRecordConfirmedRequest,
    TResult Function()? setStateFlase,
    TResult Function()? createCheckRequested,
    TResult Function()? setErrorMessageRequested,
  }) {
    return setStateFlase?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String recordName)? recordNameChanged,
    TResult Function(String linkAudio)? linkAudioChanged,
    TResult Function(String userId)? createRecordRequest,
    TResult Function(String userId)? createRecordConfirmedRequest,
    TResult Function()? setStateFlase,
    TResult Function()? createCheckRequested,
    TResult Function()? setErrorMessageRequested,
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
    required TResult Function(_RecordNameChanged value) recordNameChanged,
    required TResult Function(_LinkAudioChanged value) linkAudioChanged,
    required TResult Function(_CreateRecordRequest value) createRecordRequest,
    required TResult Function(_CreateRecordConfirmedRequest value)
        createRecordConfirmedRequest,
    required TResult Function(_SetStateFlase value) setStateFlase,
    required TResult Function(_CreateCheckRequested value) createCheckRequested,
    required TResult Function(_SetErrorMessageRequested value)
        setErrorMessageRequested,
  }) {
    return setStateFlase(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_RecordNameChanged value)? recordNameChanged,
    TResult Function(_LinkAudioChanged value)? linkAudioChanged,
    TResult Function(_CreateRecordRequest value)? createRecordRequest,
    TResult Function(_CreateRecordConfirmedRequest value)?
        createRecordConfirmedRequest,
    TResult Function(_SetStateFlase value)? setStateFlase,
    TResult Function(_CreateCheckRequested value)? createCheckRequested,
    TResult Function(_SetErrorMessageRequested value)? setErrorMessageRequested,
  }) {
    return setStateFlase?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RecordNameChanged value)? recordNameChanged,
    TResult Function(_LinkAudioChanged value)? linkAudioChanged,
    TResult Function(_CreateRecordRequest value)? createRecordRequest,
    TResult Function(_CreateRecordConfirmedRequest value)?
        createRecordConfirmedRequest,
    TResult Function(_SetStateFlase value)? setStateFlase,
    TResult Function(_CreateCheckRequested value)? createCheckRequested,
    TResult Function(_SetErrorMessageRequested value)? setErrorMessageRequested,
    required TResult orElse(),
  }) {
    if (setStateFlase != null) {
      return setStateFlase(this);
    }
    return orElse();
  }
}

abstract class _SetStateFlase implements CreateRecordEvent {
  const factory _SetStateFlase() = _$_SetStateFlase;
}

/// @nodoc
abstract class _$$_CreateCheckRequestedCopyWith<$Res> {
  factory _$$_CreateCheckRequestedCopyWith(_$_CreateCheckRequested value,
          $Res Function(_$_CreateCheckRequested) then) =
      __$$_CreateCheckRequestedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_CreateCheckRequestedCopyWithImpl<$Res>
    extends _$CreateRecordEventCopyWithImpl<$Res>
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
    return 'CreateRecordEvent.createCheckRequested()';
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
    required TResult Function(String recordName) recordNameChanged,
    required TResult Function(String linkAudio) linkAudioChanged,
    required TResult Function(String userId) createRecordRequest,
    required TResult Function(String userId) createRecordConfirmedRequest,
    required TResult Function() setStateFlase,
    required TResult Function() createCheckRequested,
    required TResult Function() setErrorMessageRequested,
  }) {
    return createCheckRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String recordName)? recordNameChanged,
    TResult Function(String linkAudio)? linkAudioChanged,
    TResult Function(String userId)? createRecordRequest,
    TResult Function(String userId)? createRecordConfirmedRequest,
    TResult Function()? setStateFlase,
    TResult Function()? createCheckRequested,
    TResult Function()? setErrorMessageRequested,
  }) {
    return createCheckRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String recordName)? recordNameChanged,
    TResult Function(String linkAudio)? linkAudioChanged,
    TResult Function(String userId)? createRecordRequest,
    TResult Function(String userId)? createRecordConfirmedRequest,
    TResult Function()? setStateFlase,
    TResult Function()? createCheckRequested,
    TResult Function()? setErrorMessageRequested,
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
    required TResult Function(_RecordNameChanged value) recordNameChanged,
    required TResult Function(_LinkAudioChanged value) linkAudioChanged,
    required TResult Function(_CreateRecordRequest value) createRecordRequest,
    required TResult Function(_CreateRecordConfirmedRequest value)
        createRecordConfirmedRequest,
    required TResult Function(_SetStateFlase value) setStateFlase,
    required TResult Function(_CreateCheckRequested value) createCheckRequested,
    required TResult Function(_SetErrorMessageRequested value)
        setErrorMessageRequested,
  }) {
    return createCheckRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_RecordNameChanged value)? recordNameChanged,
    TResult Function(_LinkAudioChanged value)? linkAudioChanged,
    TResult Function(_CreateRecordRequest value)? createRecordRequest,
    TResult Function(_CreateRecordConfirmedRequest value)?
        createRecordConfirmedRequest,
    TResult Function(_SetStateFlase value)? setStateFlase,
    TResult Function(_CreateCheckRequested value)? createCheckRequested,
    TResult Function(_SetErrorMessageRequested value)? setErrorMessageRequested,
  }) {
    return createCheckRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RecordNameChanged value)? recordNameChanged,
    TResult Function(_LinkAudioChanged value)? linkAudioChanged,
    TResult Function(_CreateRecordRequest value)? createRecordRequest,
    TResult Function(_CreateRecordConfirmedRequest value)?
        createRecordConfirmedRequest,
    TResult Function(_SetStateFlase value)? setStateFlase,
    TResult Function(_CreateCheckRequested value)? createCheckRequested,
    TResult Function(_SetErrorMessageRequested value)? setErrorMessageRequested,
    required TResult orElse(),
  }) {
    if (createCheckRequested != null) {
      return createCheckRequested(this);
    }
    return orElse();
  }
}

abstract class _CreateCheckRequested implements CreateRecordEvent {
  const factory _CreateCheckRequested() = _$_CreateCheckRequested;
}

/// @nodoc
abstract class _$$_SetErrorMessageRequestedCopyWith<$Res> {
  factory _$$_SetErrorMessageRequestedCopyWith(
          _$_SetErrorMessageRequested value,
          $Res Function(_$_SetErrorMessageRequested) then) =
      __$$_SetErrorMessageRequestedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SetErrorMessageRequestedCopyWithImpl<$Res>
    extends _$CreateRecordEventCopyWithImpl<$Res>
    implements _$$_SetErrorMessageRequestedCopyWith<$Res> {
  __$$_SetErrorMessageRequestedCopyWithImpl(_$_SetErrorMessageRequested _value,
      $Res Function(_$_SetErrorMessageRequested) _then)
      : super(_value, (v) => _then(v as _$_SetErrorMessageRequested));

  @override
  _$_SetErrorMessageRequested get _value =>
      super._value as _$_SetErrorMessageRequested;
}

/// @nodoc

class _$_SetErrorMessageRequested implements _SetErrorMessageRequested {
  const _$_SetErrorMessageRequested();

  @override
  String toString() {
    return 'CreateRecordEvent.setErrorMessageRequested()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SetErrorMessageRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String recordName) recordNameChanged,
    required TResult Function(String linkAudio) linkAudioChanged,
    required TResult Function(String userId) createRecordRequest,
    required TResult Function(String userId) createRecordConfirmedRequest,
    required TResult Function() setStateFlase,
    required TResult Function() createCheckRequested,
    required TResult Function() setErrorMessageRequested,
  }) {
    return setErrorMessageRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String recordName)? recordNameChanged,
    TResult Function(String linkAudio)? linkAudioChanged,
    TResult Function(String userId)? createRecordRequest,
    TResult Function(String userId)? createRecordConfirmedRequest,
    TResult Function()? setStateFlase,
    TResult Function()? createCheckRequested,
    TResult Function()? setErrorMessageRequested,
  }) {
    return setErrorMessageRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String recordName)? recordNameChanged,
    TResult Function(String linkAudio)? linkAudioChanged,
    TResult Function(String userId)? createRecordRequest,
    TResult Function(String userId)? createRecordConfirmedRequest,
    TResult Function()? setStateFlase,
    TResult Function()? createCheckRequested,
    TResult Function()? setErrorMessageRequested,
    required TResult orElse(),
  }) {
    if (setErrorMessageRequested != null) {
      return setErrorMessageRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RecordNameChanged value) recordNameChanged,
    required TResult Function(_LinkAudioChanged value) linkAudioChanged,
    required TResult Function(_CreateRecordRequest value) createRecordRequest,
    required TResult Function(_CreateRecordConfirmedRequest value)
        createRecordConfirmedRequest,
    required TResult Function(_SetStateFlase value) setStateFlase,
    required TResult Function(_CreateCheckRequested value) createCheckRequested,
    required TResult Function(_SetErrorMessageRequested value)
        setErrorMessageRequested,
  }) {
    return setErrorMessageRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_RecordNameChanged value)? recordNameChanged,
    TResult Function(_LinkAudioChanged value)? linkAudioChanged,
    TResult Function(_CreateRecordRequest value)? createRecordRequest,
    TResult Function(_CreateRecordConfirmedRequest value)?
        createRecordConfirmedRequest,
    TResult Function(_SetStateFlase value)? setStateFlase,
    TResult Function(_CreateCheckRequested value)? createCheckRequested,
    TResult Function(_SetErrorMessageRequested value)? setErrorMessageRequested,
  }) {
    return setErrorMessageRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RecordNameChanged value)? recordNameChanged,
    TResult Function(_LinkAudioChanged value)? linkAudioChanged,
    TResult Function(_CreateRecordRequest value)? createRecordRequest,
    TResult Function(_CreateRecordConfirmedRequest value)?
        createRecordConfirmedRequest,
    TResult Function(_SetStateFlase value)? setStateFlase,
    TResult Function(_CreateCheckRequested value)? createCheckRequested,
    TResult Function(_SetErrorMessageRequested value)? setErrorMessageRequested,
    required TResult orElse(),
  }) {
    if (setErrorMessageRequested != null) {
      return setErrorMessageRequested(this);
    }
    return orElse();
  }
}

abstract class _SetErrorMessageRequested implements CreateRecordEvent {
  const factory _SetErrorMessageRequested() = _$_SetErrorMessageRequested;
}

/// @nodoc
mixin _$CreateRecordState {
  String get userId => throw _privateConstructorUsedError;
  String get recordName => throw _privateConstructorUsedError;
  String get linkAudio => throw _privateConstructorUsedError;
  bool get isCreated => throw _privateConstructorUsedError;
  bool? get success => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateRecordStateCopyWith<CreateRecordState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateRecordStateCopyWith<$Res> {
  factory $CreateRecordStateCopyWith(
          CreateRecordState value, $Res Function(CreateRecordState) then) =
      _$CreateRecordStateCopyWithImpl<$Res>;
  $Res call(
      {String userId,
      String recordName,
      String linkAudio,
      bool isCreated,
      bool? success,
      String? message,
      String? errorMessage});
}

/// @nodoc
class _$CreateRecordStateCopyWithImpl<$Res>
    implements $CreateRecordStateCopyWith<$Res> {
  _$CreateRecordStateCopyWithImpl(this._value, this._then);

  final CreateRecordState _value;
  // ignore: unused_field
  final $Res Function(CreateRecordState) _then;

  @override
  $Res call({
    Object? userId = freezed,
    Object? recordName = freezed,
    Object? linkAudio = freezed,
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
      recordName: recordName == freezed
          ? _value.recordName
          : recordName // ignore: cast_nullable_to_non_nullable
              as String,
      linkAudio: linkAudio == freezed
          ? _value.linkAudio
          : linkAudio // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_CreateRecordStateCopyWith<$Res>
    implements $CreateRecordStateCopyWith<$Res> {
  factory _$$_CreateRecordStateCopyWith(_$_CreateRecordState value,
          $Res Function(_$_CreateRecordState) then) =
      __$$_CreateRecordStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String userId,
      String recordName,
      String linkAudio,
      bool isCreated,
      bool? success,
      String? message,
      String? errorMessage});
}

/// @nodoc
class __$$_CreateRecordStateCopyWithImpl<$Res>
    extends _$CreateRecordStateCopyWithImpl<$Res>
    implements _$$_CreateRecordStateCopyWith<$Res> {
  __$$_CreateRecordStateCopyWithImpl(
      _$_CreateRecordState _value, $Res Function(_$_CreateRecordState) _then)
      : super(_value, (v) => _then(v as _$_CreateRecordState));

  @override
  _$_CreateRecordState get _value => super._value as _$_CreateRecordState;

  @override
  $Res call({
    Object? userId = freezed,
    Object? recordName = freezed,
    Object? linkAudio = freezed,
    Object? isCreated = freezed,
    Object? success = freezed,
    Object? message = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_CreateRecordState(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      recordName: recordName == freezed
          ? _value.recordName
          : recordName // ignore: cast_nullable_to_non_nullable
              as String,
      linkAudio: linkAudio == freezed
          ? _value.linkAudio
          : linkAudio // ignore: cast_nullable_to_non_nullable
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

class _$_CreateRecordState implements _CreateRecordState {
  const _$_CreateRecordState(
      {required this.userId,
      required this.recordName,
      required this.linkAudio,
      required this.isCreated,
      this.success,
      this.message,
      this.errorMessage});

  @override
  final String userId;
  @override
  final String recordName;
  @override
  final String linkAudio;
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
    return 'CreateRecordState(userId: $userId, recordName: $recordName, linkAudio: $linkAudio, isCreated: $isCreated, success: $success, message: $message, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateRecordState &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality()
                .equals(other.recordName, recordName) &&
            const DeepCollectionEquality().equals(other.linkAudio, linkAudio) &&
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
      const DeepCollectionEquality().hash(recordName),
      const DeepCollectionEquality().hash(linkAudio),
      const DeepCollectionEquality().hash(isCreated),
      const DeepCollectionEquality().hash(success),
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(errorMessage));

  @JsonKey(ignore: true)
  @override
  _$$_CreateRecordStateCopyWith<_$_CreateRecordState> get copyWith =>
      __$$_CreateRecordStateCopyWithImpl<_$_CreateRecordState>(
          this, _$identity);
}

abstract class _CreateRecordState implements CreateRecordState {
  const factory _CreateRecordState(
      {required final String userId,
      required final String recordName,
      required final String linkAudio,
      required final bool isCreated,
      final bool? success,
      final String? message,
      final String? errorMessage}) = _$_CreateRecordState;

  @override
  String get userId;
  @override
  String get recordName;
  @override
  String get linkAudio;
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
  _$$_CreateRecordStateCopyWith<_$_CreateRecordState> get copyWith =>
      throw _privateConstructorUsedError;
}
