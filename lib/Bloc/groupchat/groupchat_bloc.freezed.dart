// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'groupchat_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GroupchatEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String groupChatId, String userId,
            String groupChatName, String groupChatImage)
        CreatedGroupChatRequest,
    required TResult Function(String groupChatName) groupChatNameChanged,
    required TResult Function(
            String groupChatId, String lastMessageGroup, String fullName)
        UpdatedLastMessageGroupChatRequest,
    required TResult Function(String memberId, String groupChatId)
        AddedMemberGroupChatRequest,
    required TResult Function(String groupId, String userId)
        RemovedMemberInGroupChatRequest,
    required TResult Function() SetErrorMessageGroupChatRequest,
    required TResult Function() SetIsCreatedGroupChatRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String groupChatId, String userId, String groupChatName,
            String groupChatImage)?
        CreatedGroupChatRequest,
    TResult Function(String groupChatName)? groupChatNameChanged,
    TResult Function(
            String groupChatId, String lastMessageGroup, String fullName)?
        UpdatedLastMessageGroupChatRequest,
    TResult Function(String memberId, String groupChatId)?
        AddedMemberGroupChatRequest,
    TResult Function(String groupId, String userId)?
        RemovedMemberInGroupChatRequest,
    TResult Function()? SetErrorMessageGroupChatRequest,
    TResult Function()? SetIsCreatedGroupChatRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String groupChatId, String userId, String groupChatName,
            String groupChatImage)?
        CreatedGroupChatRequest,
    TResult Function(String groupChatName)? groupChatNameChanged,
    TResult Function(
            String groupChatId, String lastMessageGroup, String fullName)?
        UpdatedLastMessageGroupChatRequest,
    TResult Function(String memberId, String groupChatId)?
        AddedMemberGroupChatRequest,
    TResult Function(String groupId, String userId)?
        RemovedMemberInGroupChatRequest,
    TResult Function()? SetErrorMessageGroupChatRequest,
    TResult Function()? SetIsCreatedGroupChatRequest,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreatedGroupChatRequest value)
        CreatedGroupChatRequest,
    required TResult Function(_GroupChatNameChanged value) groupChatNameChanged,
    required TResult Function(_UpdatedLastMessageGroupChatRequest value)
        UpdatedLastMessageGroupChatRequest,
    required TResult Function(_AddedMemberGroupChatRequest value)
        AddedMemberGroupChatRequest,
    required TResult Function(_RemovedMemberInGroupChatRequest value)
        RemovedMemberInGroupChatRequest,
    required TResult Function(_SetErrorMessageGroupChatRequest value)
        SetErrorMessageGroupChatRequest,
    required TResult Function(_SetIsCreatedGroupChatRequest value)
        SetIsCreatedGroupChatRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_CreatedGroupChatRequest value)? CreatedGroupChatRequest,
    TResult Function(_GroupChatNameChanged value)? groupChatNameChanged,
    TResult Function(_UpdatedLastMessageGroupChatRequest value)?
        UpdatedLastMessageGroupChatRequest,
    TResult Function(_AddedMemberGroupChatRequest value)?
        AddedMemberGroupChatRequest,
    TResult Function(_RemovedMemberInGroupChatRequest value)?
        RemovedMemberInGroupChatRequest,
    TResult Function(_SetErrorMessageGroupChatRequest value)?
        SetErrorMessageGroupChatRequest,
    TResult Function(_SetIsCreatedGroupChatRequest value)?
        SetIsCreatedGroupChatRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreatedGroupChatRequest value)? CreatedGroupChatRequest,
    TResult Function(_GroupChatNameChanged value)? groupChatNameChanged,
    TResult Function(_UpdatedLastMessageGroupChatRequest value)?
        UpdatedLastMessageGroupChatRequest,
    TResult Function(_AddedMemberGroupChatRequest value)?
        AddedMemberGroupChatRequest,
    TResult Function(_RemovedMemberInGroupChatRequest value)?
        RemovedMemberInGroupChatRequest,
    TResult Function(_SetErrorMessageGroupChatRequest value)?
        SetErrorMessageGroupChatRequest,
    TResult Function(_SetIsCreatedGroupChatRequest value)?
        SetIsCreatedGroupChatRequest,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupchatEventCopyWith<$Res> {
  factory $GroupchatEventCopyWith(
          GroupchatEvent value, $Res Function(GroupchatEvent) then) =
      _$GroupchatEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$GroupchatEventCopyWithImpl<$Res>
    implements $GroupchatEventCopyWith<$Res> {
  _$GroupchatEventCopyWithImpl(this._value, this._then);

  final GroupchatEvent _value;
  // ignore: unused_field
  final $Res Function(GroupchatEvent) _then;
}

/// @nodoc
abstract class _$$_CreatedGroupChatRequestCopyWith<$Res> {
  factory _$$_CreatedGroupChatRequestCopyWith(_$_CreatedGroupChatRequest value,
          $Res Function(_$_CreatedGroupChatRequest) then) =
      __$$_CreatedGroupChatRequestCopyWithImpl<$Res>;
  $Res call(
      {String groupChatId,
      String userId,
      String groupChatName,
      String groupChatImage});
}

/// @nodoc
class __$$_CreatedGroupChatRequestCopyWithImpl<$Res>
    extends _$GroupchatEventCopyWithImpl<$Res>
    implements _$$_CreatedGroupChatRequestCopyWith<$Res> {
  __$$_CreatedGroupChatRequestCopyWithImpl(_$_CreatedGroupChatRequest _value,
      $Res Function(_$_CreatedGroupChatRequest) _then)
      : super(_value, (v) => _then(v as _$_CreatedGroupChatRequest));

  @override
  _$_CreatedGroupChatRequest get _value =>
      super._value as _$_CreatedGroupChatRequest;

  @override
  $Res call({
    Object? groupChatId = freezed,
    Object? userId = freezed,
    Object? groupChatName = freezed,
    Object? groupChatImage = freezed,
  }) {
    return _then(_$_CreatedGroupChatRequest(
      groupChatId == freezed
          ? _value.groupChatId
          : groupChatId // ignore: cast_nullable_to_non_nullable
              as String,
      userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      groupChatName == freezed
          ? _value.groupChatName
          : groupChatName // ignore: cast_nullable_to_non_nullable
              as String,
      groupChatImage == freezed
          ? _value.groupChatImage
          : groupChatImage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_CreatedGroupChatRequest implements _CreatedGroupChatRequest {
  const _$_CreatedGroupChatRequest(
      this.groupChatId, this.userId, this.groupChatName, this.groupChatImage);

  @override
  final String groupChatId;
  @override
  final String userId;
  @override
  final String groupChatName;
  @override
  final String groupChatImage;

  @override
  String toString() {
    return 'GroupchatEvent.CreatedGroupChatRequest(groupChatId: $groupChatId, userId: $userId, groupChatName: $groupChatName, groupChatImage: $groupChatImage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreatedGroupChatRequest &&
            const DeepCollectionEquality()
                .equals(other.groupChatId, groupChatId) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality()
                .equals(other.groupChatName, groupChatName) &&
            const DeepCollectionEquality()
                .equals(other.groupChatImage, groupChatImage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(groupChatId),
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(groupChatName),
      const DeepCollectionEquality().hash(groupChatImage));

  @JsonKey(ignore: true)
  @override
  _$$_CreatedGroupChatRequestCopyWith<_$_CreatedGroupChatRequest>
      get copyWith =>
          __$$_CreatedGroupChatRequestCopyWithImpl<_$_CreatedGroupChatRequest>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String groupChatId, String userId,
            String groupChatName, String groupChatImage)
        CreatedGroupChatRequest,
    required TResult Function(String groupChatName) groupChatNameChanged,
    required TResult Function(
            String groupChatId, String lastMessageGroup, String fullName)
        UpdatedLastMessageGroupChatRequest,
    required TResult Function(String memberId, String groupChatId)
        AddedMemberGroupChatRequest,
    required TResult Function(String groupId, String userId)
        RemovedMemberInGroupChatRequest,
    required TResult Function() SetErrorMessageGroupChatRequest,
    required TResult Function() SetIsCreatedGroupChatRequest,
  }) {
    return CreatedGroupChatRequest(
        groupChatId, userId, groupChatName, groupChatImage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String groupChatId, String userId, String groupChatName,
            String groupChatImage)?
        CreatedGroupChatRequest,
    TResult Function(String groupChatName)? groupChatNameChanged,
    TResult Function(
            String groupChatId, String lastMessageGroup, String fullName)?
        UpdatedLastMessageGroupChatRequest,
    TResult Function(String memberId, String groupChatId)?
        AddedMemberGroupChatRequest,
    TResult Function(String groupId, String userId)?
        RemovedMemberInGroupChatRequest,
    TResult Function()? SetErrorMessageGroupChatRequest,
    TResult Function()? SetIsCreatedGroupChatRequest,
  }) {
    return CreatedGroupChatRequest?.call(
        groupChatId, userId, groupChatName, groupChatImage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String groupChatId, String userId, String groupChatName,
            String groupChatImage)?
        CreatedGroupChatRequest,
    TResult Function(String groupChatName)? groupChatNameChanged,
    TResult Function(
            String groupChatId, String lastMessageGroup, String fullName)?
        UpdatedLastMessageGroupChatRequest,
    TResult Function(String memberId, String groupChatId)?
        AddedMemberGroupChatRequest,
    TResult Function(String groupId, String userId)?
        RemovedMemberInGroupChatRequest,
    TResult Function()? SetErrorMessageGroupChatRequest,
    TResult Function()? SetIsCreatedGroupChatRequest,
    required TResult orElse(),
  }) {
    if (CreatedGroupChatRequest != null) {
      return CreatedGroupChatRequest(
          groupChatId, userId, groupChatName, groupChatImage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreatedGroupChatRequest value)
        CreatedGroupChatRequest,
    required TResult Function(_GroupChatNameChanged value) groupChatNameChanged,
    required TResult Function(_UpdatedLastMessageGroupChatRequest value)
        UpdatedLastMessageGroupChatRequest,
    required TResult Function(_AddedMemberGroupChatRequest value)
        AddedMemberGroupChatRequest,
    required TResult Function(_RemovedMemberInGroupChatRequest value)
        RemovedMemberInGroupChatRequest,
    required TResult Function(_SetErrorMessageGroupChatRequest value)
        SetErrorMessageGroupChatRequest,
    required TResult Function(_SetIsCreatedGroupChatRequest value)
        SetIsCreatedGroupChatRequest,
  }) {
    return CreatedGroupChatRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_CreatedGroupChatRequest value)? CreatedGroupChatRequest,
    TResult Function(_GroupChatNameChanged value)? groupChatNameChanged,
    TResult Function(_UpdatedLastMessageGroupChatRequest value)?
        UpdatedLastMessageGroupChatRequest,
    TResult Function(_AddedMemberGroupChatRequest value)?
        AddedMemberGroupChatRequest,
    TResult Function(_RemovedMemberInGroupChatRequest value)?
        RemovedMemberInGroupChatRequest,
    TResult Function(_SetErrorMessageGroupChatRequest value)?
        SetErrorMessageGroupChatRequest,
    TResult Function(_SetIsCreatedGroupChatRequest value)?
        SetIsCreatedGroupChatRequest,
  }) {
    return CreatedGroupChatRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreatedGroupChatRequest value)? CreatedGroupChatRequest,
    TResult Function(_GroupChatNameChanged value)? groupChatNameChanged,
    TResult Function(_UpdatedLastMessageGroupChatRequest value)?
        UpdatedLastMessageGroupChatRequest,
    TResult Function(_AddedMemberGroupChatRequest value)?
        AddedMemberGroupChatRequest,
    TResult Function(_RemovedMemberInGroupChatRequest value)?
        RemovedMemberInGroupChatRequest,
    TResult Function(_SetErrorMessageGroupChatRequest value)?
        SetErrorMessageGroupChatRequest,
    TResult Function(_SetIsCreatedGroupChatRequest value)?
        SetIsCreatedGroupChatRequest,
    required TResult orElse(),
  }) {
    if (CreatedGroupChatRequest != null) {
      return CreatedGroupChatRequest(this);
    }
    return orElse();
  }
}

abstract class _CreatedGroupChatRequest implements GroupchatEvent {
  const factory _CreatedGroupChatRequest(
      final String groupChatId,
      final String userId,
      final String groupChatName,
      final String groupChatImage) = _$_CreatedGroupChatRequest;

  String get groupChatId;
  String get userId;
  String get groupChatName;
  String get groupChatImage;
  @JsonKey(ignore: true)
  _$$_CreatedGroupChatRequestCopyWith<_$_CreatedGroupChatRequest>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GroupChatNameChangedCopyWith<$Res> {
  factory _$$_GroupChatNameChangedCopyWith(_$_GroupChatNameChanged value,
          $Res Function(_$_GroupChatNameChanged) then) =
      __$$_GroupChatNameChangedCopyWithImpl<$Res>;
  $Res call({String groupChatName});
}

/// @nodoc
class __$$_GroupChatNameChangedCopyWithImpl<$Res>
    extends _$GroupchatEventCopyWithImpl<$Res>
    implements _$$_GroupChatNameChangedCopyWith<$Res> {
  __$$_GroupChatNameChangedCopyWithImpl(_$_GroupChatNameChanged _value,
      $Res Function(_$_GroupChatNameChanged) _then)
      : super(_value, (v) => _then(v as _$_GroupChatNameChanged));

  @override
  _$_GroupChatNameChanged get _value => super._value as _$_GroupChatNameChanged;

  @override
  $Res call({
    Object? groupChatName = freezed,
  }) {
    return _then(_$_GroupChatNameChanged(
      groupChatName == freezed
          ? _value.groupChatName
          : groupChatName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GroupChatNameChanged implements _GroupChatNameChanged {
  const _$_GroupChatNameChanged(this.groupChatName);

  @override
  final String groupChatName;

  @override
  String toString() {
    return 'GroupchatEvent.groupChatNameChanged(groupChatName: $groupChatName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GroupChatNameChanged &&
            const DeepCollectionEquality()
                .equals(other.groupChatName, groupChatName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(groupChatName));

  @JsonKey(ignore: true)
  @override
  _$$_GroupChatNameChangedCopyWith<_$_GroupChatNameChanged> get copyWith =>
      __$$_GroupChatNameChangedCopyWithImpl<_$_GroupChatNameChanged>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String groupChatId, String userId,
            String groupChatName, String groupChatImage)
        CreatedGroupChatRequest,
    required TResult Function(String groupChatName) groupChatNameChanged,
    required TResult Function(
            String groupChatId, String lastMessageGroup, String fullName)
        UpdatedLastMessageGroupChatRequest,
    required TResult Function(String memberId, String groupChatId)
        AddedMemberGroupChatRequest,
    required TResult Function(String groupId, String userId)
        RemovedMemberInGroupChatRequest,
    required TResult Function() SetErrorMessageGroupChatRequest,
    required TResult Function() SetIsCreatedGroupChatRequest,
  }) {
    return groupChatNameChanged(groupChatName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String groupChatId, String userId, String groupChatName,
            String groupChatImage)?
        CreatedGroupChatRequest,
    TResult Function(String groupChatName)? groupChatNameChanged,
    TResult Function(
            String groupChatId, String lastMessageGroup, String fullName)?
        UpdatedLastMessageGroupChatRequest,
    TResult Function(String memberId, String groupChatId)?
        AddedMemberGroupChatRequest,
    TResult Function(String groupId, String userId)?
        RemovedMemberInGroupChatRequest,
    TResult Function()? SetErrorMessageGroupChatRequest,
    TResult Function()? SetIsCreatedGroupChatRequest,
  }) {
    return groupChatNameChanged?.call(groupChatName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String groupChatId, String userId, String groupChatName,
            String groupChatImage)?
        CreatedGroupChatRequest,
    TResult Function(String groupChatName)? groupChatNameChanged,
    TResult Function(
            String groupChatId, String lastMessageGroup, String fullName)?
        UpdatedLastMessageGroupChatRequest,
    TResult Function(String memberId, String groupChatId)?
        AddedMemberGroupChatRequest,
    TResult Function(String groupId, String userId)?
        RemovedMemberInGroupChatRequest,
    TResult Function()? SetErrorMessageGroupChatRequest,
    TResult Function()? SetIsCreatedGroupChatRequest,
    required TResult orElse(),
  }) {
    if (groupChatNameChanged != null) {
      return groupChatNameChanged(groupChatName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreatedGroupChatRequest value)
        CreatedGroupChatRequest,
    required TResult Function(_GroupChatNameChanged value) groupChatNameChanged,
    required TResult Function(_UpdatedLastMessageGroupChatRequest value)
        UpdatedLastMessageGroupChatRequest,
    required TResult Function(_AddedMemberGroupChatRequest value)
        AddedMemberGroupChatRequest,
    required TResult Function(_RemovedMemberInGroupChatRequest value)
        RemovedMemberInGroupChatRequest,
    required TResult Function(_SetErrorMessageGroupChatRequest value)
        SetErrorMessageGroupChatRequest,
    required TResult Function(_SetIsCreatedGroupChatRequest value)
        SetIsCreatedGroupChatRequest,
  }) {
    return groupChatNameChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_CreatedGroupChatRequest value)? CreatedGroupChatRequest,
    TResult Function(_GroupChatNameChanged value)? groupChatNameChanged,
    TResult Function(_UpdatedLastMessageGroupChatRequest value)?
        UpdatedLastMessageGroupChatRequest,
    TResult Function(_AddedMemberGroupChatRequest value)?
        AddedMemberGroupChatRequest,
    TResult Function(_RemovedMemberInGroupChatRequest value)?
        RemovedMemberInGroupChatRequest,
    TResult Function(_SetErrorMessageGroupChatRequest value)?
        SetErrorMessageGroupChatRequest,
    TResult Function(_SetIsCreatedGroupChatRequest value)?
        SetIsCreatedGroupChatRequest,
  }) {
    return groupChatNameChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreatedGroupChatRequest value)? CreatedGroupChatRequest,
    TResult Function(_GroupChatNameChanged value)? groupChatNameChanged,
    TResult Function(_UpdatedLastMessageGroupChatRequest value)?
        UpdatedLastMessageGroupChatRequest,
    TResult Function(_AddedMemberGroupChatRequest value)?
        AddedMemberGroupChatRequest,
    TResult Function(_RemovedMemberInGroupChatRequest value)?
        RemovedMemberInGroupChatRequest,
    TResult Function(_SetErrorMessageGroupChatRequest value)?
        SetErrorMessageGroupChatRequest,
    TResult Function(_SetIsCreatedGroupChatRequest value)?
        SetIsCreatedGroupChatRequest,
    required TResult orElse(),
  }) {
    if (groupChatNameChanged != null) {
      return groupChatNameChanged(this);
    }
    return orElse();
  }
}

abstract class _GroupChatNameChanged implements GroupchatEvent {
  const factory _GroupChatNameChanged(final String groupChatName) =
      _$_GroupChatNameChanged;

  String get groupChatName;
  @JsonKey(ignore: true)
  _$$_GroupChatNameChangedCopyWith<_$_GroupChatNameChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UpdatedLastMessageGroupChatRequestCopyWith<$Res> {
  factory _$$_UpdatedLastMessageGroupChatRequestCopyWith(
          _$_UpdatedLastMessageGroupChatRequest value,
          $Res Function(_$_UpdatedLastMessageGroupChatRequest) then) =
      __$$_UpdatedLastMessageGroupChatRequestCopyWithImpl<$Res>;
  $Res call({String groupChatId, String lastMessageGroup, String fullName});
}

/// @nodoc
class __$$_UpdatedLastMessageGroupChatRequestCopyWithImpl<$Res>
    extends _$GroupchatEventCopyWithImpl<$Res>
    implements _$$_UpdatedLastMessageGroupChatRequestCopyWith<$Res> {
  __$$_UpdatedLastMessageGroupChatRequestCopyWithImpl(
      _$_UpdatedLastMessageGroupChatRequest _value,
      $Res Function(_$_UpdatedLastMessageGroupChatRequest) _then)
      : super(_value, (v) => _then(v as _$_UpdatedLastMessageGroupChatRequest));

  @override
  _$_UpdatedLastMessageGroupChatRequest get _value =>
      super._value as _$_UpdatedLastMessageGroupChatRequest;

  @override
  $Res call({
    Object? groupChatId = freezed,
    Object? lastMessageGroup = freezed,
    Object? fullName = freezed,
  }) {
    return _then(_$_UpdatedLastMessageGroupChatRequest(
      groupChatId == freezed
          ? _value.groupChatId
          : groupChatId // ignore: cast_nullable_to_non_nullable
              as String,
      lastMessageGroup == freezed
          ? _value.lastMessageGroup
          : lastMessageGroup // ignore: cast_nullable_to_non_nullable
              as String,
      fullName == freezed
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UpdatedLastMessageGroupChatRequest
    implements _UpdatedLastMessageGroupChatRequest {
  const _$_UpdatedLastMessageGroupChatRequest(
      this.groupChatId, this.lastMessageGroup, this.fullName);

  @override
  final String groupChatId;
  @override
  final String lastMessageGroup;
  @override
  final String fullName;

  @override
  String toString() {
    return 'GroupchatEvent.UpdatedLastMessageGroupChatRequest(groupChatId: $groupChatId, lastMessageGroup: $lastMessageGroup, fullName: $fullName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdatedLastMessageGroupChatRequest &&
            const DeepCollectionEquality()
                .equals(other.groupChatId, groupChatId) &&
            const DeepCollectionEquality()
                .equals(other.lastMessageGroup, lastMessageGroup) &&
            const DeepCollectionEquality().equals(other.fullName, fullName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(groupChatId),
      const DeepCollectionEquality().hash(lastMessageGroup),
      const DeepCollectionEquality().hash(fullName));

  @JsonKey(ignore: true)
  @override
  _$$_UpdatedLastMessageGroupChatRequestCopyWith<
          _$_UpdatedLastMessageGroupChatRequest>
      get copyWith => __$$_UpdatedLastMessageGroupChatRequestCopyWithImpl<
          _$_UpdatedLastMessageGroupChatRequest>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String groupChatId, String userId,
            String groupChatName, String groupChatImage)
        CreatedGroupChatRequest,
    required TResult Function(String groupChatName) groupChatNameChanged,
    required TResult Function(
            String groupChatId, String lastMessageGroup, String fullName)
        UpdatedLastMessageGroupChatRequest,
    required TResult Function(String memberId, String groupChatId)
        AddedMemberGroupChatRequest,
    required TResult Function(String groupId, String userId)
        RemovedMemberInGroupChatRequest,
    required TResult Function() SetErrorMessageGroupChatRequest,
    required TResult Function() SetIsCreatedGroupChatRequest,
  }) {
    return UpdatedLastMessageGroupChatRequest(
        groupChatId, lastMessageGroup, fullName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String groupChatId, String userId, String groupChatName,
            String groupChatImage)?
        CreatedGroupChatRequest,
    TResult Function(String groupChatName)? groupChatNameChanged,
    TResult Function(
            String groupChatId, String lastMessageGroup, String fullName)?
        UpdatedLastMessageGroupChatRequest,
    TResult Function(String memberId, String groupChatId)?
        AddedMemberGroupChatRequest,
    TResult Function(String groupId, String userId)?
        RemovedMemberInGroupChatRequest,
    TResult Function()? SetErrorMessageGroupChatRequest,
    TResult Function()? SetIsCreatedGroupChatRequest,
  }) {
    return UpdatedLastMessageGroupChatRequest?.call(
        groupChatId, lastMessageGroup, fullName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String groupChatId, String userId, String groupChatName,
            String groupChatImage)?
        CreatedGroupChatRequest,
    TResult Function(String groupChatName)? groupChatNameChanged,
    TResult Function(
            String groupChatId, String lastMessageGroup, String fullName)?
        UpdatedLastMessageGroupChatRequest,
    TResult Function(String memberId, String groupChatId)?
        AddedMemberGroupChatRequest,
    TResult Function(String groupId, String userId)?
        RemovedMemberInGroupChatRequest,
    TResult Function()? SetErrorMessageGroupChatRequest,
    TResult Function()? SetIsCreatedGroupChatRequest,
    required TResult orElse(),
  }) {
    if (UpdatedLastMessageGroupChatRequest != null) {
      return UpdatedLastMessageGroupChatRequest(
          groupChatId, lastMessageGroup, fullName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreatedGroupChatRequest value)
        CreatedGroupChatRequest,
    required TResult Function(_GroupChatNameChanged value) groupChatNameChanged,
    required TResult Function(_UpdatedLastMessageGroupChatRequest value)
        UpdatedLastMessageGroupChatRequest,
    required TResult Function(_AddedMemberGroupChatRequest value)
        AddedMemberGroupChatRequest,
    required TResult Function(_RemovedMemberInGroupChatRequest value)
        RemovedMemberInGroupChatRequest,
    required TResult Function(_SetErrorMessageGroupChatRequest value)
        SetErrorMessageGroupChatRequest,
    required TResult Function(_SetIsCreatedGroupChatRequest value)
        SetIsCreatedGroupChatRequest,
  }) {
    return UpdatedLastMessageGroupChatRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_CreatedGroupChatRequest value)? CreatedGroupChatRequest,
    TResult Function(_GroupChatNameChanged value)? groupChatNameChanged,
    TResult Function(_UpdatedLastMessageGroupChatRequest value)?
        UpdatedLastMessageGroupChatRequest,
    TResult Function(_AddedMemberGroupChatRequest value)?
        AddedMemberGroupChatRequest,
    TResult Function(_RemovedMemberInGroupChatRequest value)?
        RemovedMemberInGroupChatRequest,
    TResult Function(_SetErrorMessageGroupChatRequest value)?
        SetErrorMessageGroupChatRequest,
    TResult Function(_SetIsCreatedGroupChatRequest value)?
        SetIsCreatedGroupChatRequest,
  }) {
    return UpdatedLastMessageGroupChatRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreatedGroupChatRequest value)? CreatedGroupChatRequest,
    TResult Function(_GroupChatNameChanged value)? groupChatNameChanged,
    TResult Function(_UpdatedLastMessageGroupChatRequest value)?
        UpdatedLastMessageGroupChatRequest,
    TResult Function(_AddedMemberGroupChatRequest value)?
        AddedMemberGroupChatRequest,
    TResult Function(_RemovedMemberInGroupChatRequest value)?
        RemovedMemberInGroupChatRequest,
    TResult Function(_SetErrorMessageGroupChatRequest value)?
        SetErrorMessageGroupChatRequest,
    TResult Function(_SetIsCreatedGroupChatRequest value)?
        SetIsCreatedGroupChatRequest,
    required TResult orElse(),
  }) {
    if (UpdatedLastMessageGroupChatRequest != null) {
      return UpdatedLastMessageGroupChatRequest(this);
    }
    return orElse();
  }
}

abstract class _UpdatedLastMessageGroupChatRequest implements GroupchatEvent {
  const factory _UpdatedLastMessageGroupChatRequest(
      final String groupChatId,
      final String lastMessageGroup,
      final String fullName) = _$_UpdatedLastMessageGroupChatRequest;

  String get groupChatId;
  String get lastMessageGroup;
  String get fullName;
  @JsonKey(ignore: true)
  _$$_UpdatedLastMessageGroupChatRequestCopyWith<
          _$_UpdatedLastMessageGroupChatRequest>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AddedMemberGroupChatRequestCopyWith<$Res> {
  factory _$$_AddedMemberGroupChatRequestCopyWith(
          _$_AddedMemberGroupChatRequest value,
          $Res Function(_$_AddedMemberGroupChatRequest) then) =
      __$$_AddedMemberGroupChatRequestCopyWithImpl<$Res>;
  $Res call({String memberId, String groupChatId});
}

/// @nodoc
class __$$_AddedMemberGroupChatRequestCopyWithImpl<$Res>
    extends _$GroupchatEventCopyWithImpl<$Res>
    implements _$$_AddedMemberGroupChatRequestCopyWith<$Res> {
  __$$_AddedMemberGroupChatRequestCopyWithImpl(
      _$_AddedMemberGroupChatRequest _value,
      $Res Function(_$_AddedMemberGroupChatRequest) _then)
      : super(_value, (v) => _then(v as _$_AddedMemberGroupChatRequest));

  @override
  _$_AddedMemberGroupChatRequest get _value =>
      super._value as _$_AddedMemberGroupChatRequest;

  @override
  $Res call({
    Object? memberId = freezed,
    Object? groupChatId = freezed,
  }) {
    return _then(_$_AddedMemberGroupChatRequest(
      memberId == freezed
          ? _value.memberId
          : memberId // ignore: cast_nullable_to_non_nullable
              as String,
      groupChatId == freezed
          ? _value.groupChatId
          : groupChatId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AddedMemberGroupChatRequest implements _AddedMemberGroupChatRequest {
  const _$_AddedMemberGroupChatRequest(this.memberId, this.groupChatId);

  @override
  final String memberId;
  @override
  final String groupChatId;

  @override
  String toString() {
    return 'GroupchatEvent.AddedMemberGroupChatRequest(memberId: $memberId, groupChatId: $groupChatId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddedMemberGroupChatRequest &&
            const DeepCollectionEquality().equals(other.memberId, memberId) &&
            const DeepCollectionEquality()
                .equals(other.groupChatId, groupChatId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(memberId),
      const DeepCollectionEquality().hash(groupChatId));

  @JsonKey(ignore: true)
  @override
  _$$_AddedMemberGroupChatRequestCopyWith<_$_AddedMemberGroupChatRequest>
      get copyWith => __$$_AddedMemberGroupChatRequestCopyWithImpl<
          _$_AddedMemberGroupChatRequest>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String groupChatId, String userId,
            String groupChatName, String groupChatImage)
        CreatedGroupChatRequest,
    required TResult Function(String groupChatName) groupChatNameChanged,
    required TResult Function(
            String groupChatId, String lastMessageGroup, String fullName)
        UpdatedLastMessageGroupChatRequest,
    required TResult Function(String memberId, String groupChatId)
        AddedMemberGroupChatRequest,
    required TResult Function(String groupId, String userId)
        RemovedMemberInGroupChatRequest,
    required TResult Function() SetErrorMessageGroupChatRequest,
    required TResult Function() SetIsCreatedGroupChatRequest,
  }) {
    return AddedMemberGroupChatRequest(memberId, groupChatId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String groupChatId, String userId, String groupChatName,
            String groupChatImage)?
        CreatedGroupChatRequest,
    TResult Function(String groupChatName)? groupChatNameChanged,
    TResult Function(
            String groupChatId, String lastMessageGroup, String fullName)?
        UpdatedLastMessageGroupChatRequest,
    TResult Function(String memberId, String groupChatId)?
        AddedMemberGroupChatRequest,
    TResult Function(String groupId, String userId)?
        RemovedMemberInGroupChatRequest,
    TResult Function()? SetErrorMessageGroupChatRequest,
    TResult Function()? SetIsCreatedGroupChatRequest,
  }) {
    return AddedMemberGroupChatRequest?.call(memberId, groupChatId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String groupChatId, String userId, String groupChatName,
            String groupChatImage)?
        CreatedGroupChatRequest,
    TResult Function(String groupChatName)? groupChatNameChanged,
    TResult Function(
            String groupChatId, String lastMessageGroup, String fullName)?
        UpdatedLastMessageGroupChatRequest,
    TResult Function(String memberId, String groupChatId)?
        AddedMemberGroupChatRequest,
    TResult Function(String groupId, String userId)?
        RemovedMemberInGroupChatRequest,
    TResult Function()? SetErrorMessageGroupChatRequest,
    TResult Function()? SetIsCreatedGroupChatRequest,
    required TResult orElse(),
  }) {
    if (AddedMemberGroupChatRequest != null) {
      return AddedMemberGroupChatRequest(memberId, groupChatId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreatedGroupChatRequest value)
        CreatedGroupChatRequest,
    required TResult Function(_GroupChatNameChanged value) groupChatNameChanged,
    required TResult Function(_UpdatedLastMessageGroupChatRequest value)
        UpdatedLastMessageGroupChatRequest,
    required TResult Function(_AddedMemberGroupChatRequest value)
        AddedMemberGroupChatRequest,
    required TResult Function(_RemovedMemberInGroupChatRequest value)
        RemovedMemberInGroupChatRequest,
    required TResult Function(_SetErrorMessageGroupChatRequest value)
        SetErrorMessageGroupChatRequest,
    required TResult Function(_SetIsCreatedGroupChatRequest value)
        SetIsCreatedGroupChatRequest,
  }) {
    return AddedMemberGroupChatRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_CreatedGroupChatRequest value)? CreatedGroupChatRequest,
    TResult Function(_GroupChatNameChanged value)? groupChatNameChanged,
    TResult Function(_UpdatedLastMessageGroupChatRequest value)?
        UpdatedLastMessageGroupChatRequest,
    TResult Function(_AddedMemberGroupChatRequest value)?
        AddedMemberGroupChatRequest,
    TResult Function(_RemovedMemberInGroupChatRequest value)?
        RemovedMemberInGroupChatRequest,
    TResult Function(_SetErrorMessageGroupChatRequest value)?
        SetErrorMessageGroupChatRequest,
    TResult Function(_SetIsCreatedGroupChatRequest value)?
        SetIsCreatedGroupChatRequest,
  }) {
    return AddedMemberGroupChatRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreatedGroupChatRequest value)? CreatedGroupChatRequest,
    TResult Function(_GroupChatNameChanged value)? groupChatNameChanged,
    TResult Function(_UpdatedLastMessageGroupChatRequest value)?
        UpdatedLastMessageGroupChatRequest,
    TResult Function(_AddedMemberGroupChatRequest value)?
        AddedMemberGroupChatRequest,
    TResult Function(_RemovedMemberInGroupChatRequest value)?
        RemovedMemberInGroupChatRequest,
    TResult Function(_SetErrorMessageGroupChatRequest value)?
        SetErrorMessageGroupChatRequest,
    TResult Function(_SetIsCreatedGroupChatRequest value)?
        SetIsCreatedGroupChatRequest,
    required TResult orElse(),
  }) {
    if (AddedMemberGroupChatRequest != null) {
      return AddedMemberGroupChatRequest(this);
    }
    return orElse();
  }
}

abstract class _AddedMemberGroupChatRequest implements GroupchatEvent {
  const factory _AddedMemberGroupChatRequest(
          final String memberId, final String groupChatId) =
      _$_AddedMemberGroupChatRequest;

  String get memberId;
  String get groupChatId;
  @JsonKey(ignore: true)
  _$$_AddedMemberGroupChatRequestCopyWith<_$_AddedMemberGroupChatRequest>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_RemovedMemberInGroupChatRequestCopyWith<$Res> {
  factory _$$_RemovedMemberInGroupChatRequestCopyWith(
          _$_RemovedMemberInGroupChatRequest value,
          $Res Function(_$_RemovedMemberInGroupChatRequest) then) =
      __$$_RemovedMemberInGroupChatRequestCopyWithImpl<$Res>;
  $Res call({String groupId, String userId});
}

/// @nodoc
class __$$_RemovedMemberInGroupChatRequestCopyWithImpl<$Res>
    extends _$GroupchatEventCopyWithImpl<$Res>
    implements _$$_RemovedMemberInGroupChatRequestCopyWith<$Res> {
  __$$_RemovedMemberInGroupChatRequestCopyWithImpl(
      _$_RemovedMemberInGroupChatRequest _value,
      $Res Function(_$_RemovedMemberInGroupChatRequest) _then)
      : super(_value, (v) => _then(v as _$_RemovedMemberInGroupChatRequest));

  @override
  _$_RemovedMemberInGroupChatRequest get _value =>
      super._value as _$_RemovedMemberInGroupChatRequest;

  @override
  $Res call({
    Object? groupId = freezed,
    Object? userId = freezed,
  }) {
    return _then(_$_RemovedMemberInGroupChatRequest(
      groupId == freezed
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String,
      userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_RemovedMemberInGroupChatRequest
    implements _RemovedMemberInGroupChatRequest {
  const _$_RemovedMemberInGroupChatRequest(this.groupId, this.userId);

  @override
  final String groupId;
  @override
  final String userId;

  @override
  String toString() {
    return 'GroupchatEvent.RemovedMemberInGroupChatRequest(groupId: $groupId, userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RemovedMemberInGroupChatRequest &&
            const DeepCollectionEquality().equals(other.groupId, groupId) &&
            const DeepCollectionEquality().equals(other.userId, userId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(groupId),
      const DeepCollectionEquality().hash(userId));

  @JsonKey(ignore: true)
  @override
  _$$_RemovedMemberInGroupChatRequestCopyWith<
          _$_RemovedMemberInGroupChatRequest>
      get copyWith => __$$_RemovedMemberInGroupChatRequestCopyWithImpl<
          _$_RemovedMemberInGroupChatRequest>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String groupChatId, String userId,
            String groupChatName, String groupChatImage)
        CreatedGroupChatRequest,
    required TResult Function(String groupChatName) groupChatNameChanged,
    required TResult Function(
            String groupChatId, String lastMessageGroup, String fullName)
        UpdatedLastMessageGroupChatRequest,
    required TResult Function(String memberId, String groupChatId)
        AddedMemberGroupChatRequest,
    required TResult Function(String groupId, String userId)
        RemovedMemberInGroupChatRequest,
    required TResult Function() SetErrorMessageGroupChatRequest,
    required TResult Function() SetIsCreatedGroupChatRequest,
  }) {
    return RemovedMemberInGroupChatRequest(groupId, userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String groupChatId, String userId, String groupChatName,
            String groupChatImage)?
        CreatedGroupChatRequest,
    TResult Function(String groupChatName)? groupChatNameChanged,
    TResult Function(
            String groupChatId, String lastMessageGroup, String fullName)?
        UpdatedLastMessageGroupChatRequest,
    TResult Function(String memberId, String groupChatId)?
        AddedMemberGroupChatRequest,
    TResult Function(String groupId, String userId)?
        RemovedMemberInGroupChatRequest,
    TResult Function()? SetErrorMessageGroupChatRequest,
    TResult Function()? SetIsCreatedGroupChatRequest,
  }) {
    return RemovedMemberInGroupChatRequest?.call(groupId, userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String groupChatId, String userId, String groupChatName,
            String groupChatImage)?
        CreatedGroupChatRequest,
    TResult Function(String groupChatName)? groupChatNameChanged,
    TResult Function(
            String groupChatId, String lastMessageGroup, String fullName)?
        UpdatedLastMessageGroupChatRequest,
    TResult Function(String memberId, String groupChatId)?
        AddedMemberGroupChatRequest,
    TResult Function(String groupId, String userId)?
        RemovedMemberInGroupChatRequest,
    TResult Function()? SetErrorMessageGroupChatRequest,
    TResult Function()? SetIsCreatedGroupChatRequest,
    required TResult orElse(),
  }) {
    if (RemovedMemberInGroupChatRequest != null) {
      return RemovedMemberInGroupChatRequest(groupId, userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreatedGroupChatRequest value)
        CreatedGroupChatRequest,
    required TResult Function(_GroupChatNameChanged value) groupChatNameChanged,
    required TResult Function(_UpdatedLastMessageGroupChatRequest value)
        UpdatedLastMessageGroupChatRequest,
    required TResult Function(_AddedMemberGroupChatRequest value)
        AddedMemberGroupChatRequest,
    required TResult Function(_RemovedMemberInGroupChatRequest value)
        RemovedMemberInGroupChatRequest,
    required TResult Function(_SetErrorMessageGroupChatRequest value)
        SetErrorMessageGroupChatRequest,
    required TResult Function(_SetIsCreatedGroupChatRequest value)
        SetIsCreatedGroupChatRequest,
  }) {
    return RemovedMemberInGroupChatRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_CreatedGroupChatRequest value)? CreatedGroupChatRequest,
    TResult Function(_GroupChatNameChanged value)? groupChatNameChanged,
    TResult Function(_UpdatedLastMessageGroupChatRequest value)?
        UpdatedLastMessageGroupChatRequest,
    TResult Function(_AddedMemberGroupChatRequest value)?
        AddedMemberGroupChatRequest,
    TResult Function(_RemovedMemberInGroupChatRequest value)?
        RemovedMemberInGroupChatRequest,
    TResult Function(_SetErrorMessageGroupChatRequest value)?
        SetErrorMessageGroupChatRequest,
    TResult Function(_SetIsCreatedGroupChatRequest value)?
        SetIsCreatedGroupChatRequest,
  }) {
    return RemovedMemberInGroupChatRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreatedGroupChatRequest value)? CreatedGroupChatRequest,
    TResult Function(_GroupChatNameChanged value)? groupChatNameChanged,
    TResult Function(_UpdatedLastMessageGroupChatRequest value)?
        UpdatedLastMessageGroupChatRequest,
    TResult Function(_AddedMemberGroupChatRequest value)?
        AddedMemberGroupChatRequest,
    TResult Function(_RemovedMemberInGroupChatRequest value)?
        RemovedMemberInGroupChatRequest,
    TResult Function(_SetErrorMessageGroupChatRequest value)?
        SetErrorMessageGroupChatRequest,
    TResult Function(_SetIsCreatedGroupChatRequest value)?
        SetIsCreatedGroupChatRequest,
    required TResult orElse(),
  }) {
    if (RemovedMemberInGroupChatRequest != null) {
      return RemovedMemberInGroupChatRequest(this);
    }
    return orElse();
  }
}

abstract class _RemovedMemberInGroupChatRequest implements GroupchatEvent {
  const factory _RemovedMemberInGroupChatRequest(
          final String groupId, final String userId) =
      _$_RemovedMemberInGroupChatRequest;

  String get groupId;
  String get userId;
  @JsonKey(ignore: true)
  _$$_RemovedMemberInGroupChatRequestCopyWith<
          _$_RemovedMemberInGroupChatRequest>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SetErrorMessageGroupChatRequestCopyWith<$Res> {
  factory _$$_SetErrorMessageGroupChatRequestCopyWith(
          _$_SetErrorMessageGroupChatRequest value,
          $Res Function(_$_SetErrorMessageGroupChatRequest) then) =
      __$$_SetErrorMessageGroupChatRequestCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SetErrorMessageGroupChatRequestCopyWithImpl<$Res>
    extends _$GroupchatEventCopyWithImpl<$Res>
    implements _$$_SetErrorMessageGroupChatRequestCopyWith<$Res> {
  __$$_SetErrorMessageGroupChatRequestCopyWithImpl(
      _$_SetErrorMessageGroupChatRequest _value,
      $Res Function(_$_SetErrorMessageGroupChatRequest) _then)
      : super(_value, (v) => _then(v as _$_SetErrorMessageGroupChatRequest));

  @override
  _$_SetErrorMessageGroupChatRequest get _value =>
      super._value as _$_SetErrorMessageGroupChatRequest;
}

/// @nodoc

class _$_SetErrorMessageGroupChatRequest
    implements _SetErrorMessageGroupChatRequest {
  const _$_SetErrorMessageGroupChatRequest();

  @override
  String toString() {
    return 'GroupchatEvent.SetErrorMessageGroupChatRequest()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SetErrorMessageGroupChatRequest);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String groupChatId, String userId,
            String groupChatName, String groupChatImage)
        CreatedGroupChatRequest,
    required TResult Function(String groupChatName) groupChatNameChanged,
    required TResult Function(
            String groupChatId, String lastMessageGroup, String fullName)
        UpdatedLastMessageGroupChatRequest,
    required TResult Function(String memberId, String groupChatId)
        AddedMemberGroupChatRequest,
    required TResult Function(String groupId, String userId)
        RemovedMemberInGroupChatRequest,
    required TResult Function() SetErrorMessageGroupChatRequest,
    required TResult Function() SetIsCreatedGroupChatRequest,
  }) {
    return SetErrorMessageGroupChatRequest();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String groupChatId, String userId, String groupChatName,
            String groupChatImage)?
        CreatedGroupChatRequest,
    TResult Function(String groupChatName)? groupChatNameChanged,
    TResult Function(
            String groupChatId, String lastMessageGroup, String fullName)?
        UpdatedLastMessageGroupChatRequest,
    TResult Function(String memberId, String groupChatId)?
        AddedMemberGroupChatRequest,
    TResult Function(String groupId, String userId)?
        RemovedMemberInGroupChatRequest,
    TResult Function()? SetErrorMessageGroupChatRequest,
    TResult Function()? SetIsCreatedGroupChatRequest,
  }) {
    return SetErrorMessageGroupChatRequest?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String groupChatId, String userId, String groupChatName,
            String groupChatImage)?
        CreatedGroupChatRequest,
    TResult Function(String groupChatName)? groupChatNameChanged,
    TResult Function(
            String groupChatId, String lastMessageGroup, String fullName)?
        UpdatedLastMessageGroupChatRequest,
    TResult Function(String memberId, String groupChatId)?
        AddedMemberGroupChatRequest,
    TResult Function(String groupId, String userId)?
        RemovedMemberInGroupChatRequest,
    TResult Function()? SetErrorMessageGroupChatRequest,
    TResult Function()? SetIsCreatedGroupChatRequest,
    required TResult orElse(),
  }) {
    if (SetErrorMessageGroupChatRequest != null) {
      return SetErrorMessageGroupChatRequest();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreatedGroupChatRequest value)
        CreatedGroupChatRequest,
    required TResult Function(_GroupChatNameChanged value) groupChatNameChanged,
    required TResult Function(_UpdatedLastMessageGroupChatRequest value)
        UpdatedLastMessageGroupChatRequest,
    required TResult Function(_AddedMemberGroupChatRequest value)
        AddedMemberGroupChatRequest,
    required TResult Function(_RemovedMemberInGroupChatRequest value)
        RemovedMemberInGroupChatRequest,
    required TResult Function(_SetErrorMessageGroupChatRequest value)
        SetErrorMessageGroupChatRequest,
    required TResult Function(_SetIsCreatedGroupChatRequest value)
        SetIsCreatedGroupChatRequest,
  }) {
    return SetErrorMessageGroupChatRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_CreatedGroupChatRequest value)? CreatedGroupChatRequest,
    TResult Function(_GroupChatNameChanged value)? groupChatNameChanged,
    TResult Function(_UpdatedLastMessageGroupChatRequest value)?
        UpdatedLastMessageGroupChatRequest,
    TResult Function(_AddedMemberGroupChatRequest value)?
        AddedMemberGroupChatRequest,
    TResult Function(_RemovedMemberInGroupChatRequest value)?
        RemovedMemberInGroupChatRequest,
    TResult Function(_SetErrorMessageGroupChatRequest value)?
        SetErrorMessageGroupChatRequest,
    TResult Function(_SetIsCreatedGroupChatRequest value)?
        SetIsCreatedGroupChatRequest,
  }) {
    return SetErrorMessageGroupChatRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreatedGroupChatRequest value)? CreatedGroupChatRequest,
    TResult Function(_GroupChatNameChanged value)? groupChatNameChanged,
    TResult Function(_UpdatedLastMessageGroupChatRequest value)?
        UpdatedLastMessageGroupChatRequest,
    TResult Function(_AddedMemberGroupChatRequest value)?
        AddedMemberGroupChatRequest,
    TResult Function(_RemovedMemberInGroupChatRequest value)?
        RemovedMemberInGroupChatRequest,
    TResult Function(_SetErrorMessageGroupChatRequest value)?
        SetErrorMessageGroupChatRequest,
    TResult Function(_SetIsCreatedGroupChatRequest value)?
        SetIsCreatedGroupChatRequest,
    required TResult orElse(),
  }) {
    if (SetErrorMessageGroupChatRequest != null) {
      return SetErrorMessageGroupChatRequest(this);
    }
    return orElse();
  }
}

abstract class _SetErrorMessageGroupChatRequest implements GroupchatEvent {
  const factory _SetErrorMessageGroupChatRequest() =
      _$_SetErrorMessageGroupChatRequest;
}

/// @nodoc
abstract class _$$_SetIsCreatedGroupChatRequestCopyWith<$Res> {
  factory _$$_SetIsCreatedGroupChatRequestCopyWith(
          _$_SetIsCreatedGroupChatRequest value,
          $Res Function(_$_SetIsCreatedGroupChatRequest) then) =
      __$$_SetIsCreatedGroupChatRequestCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SetIsCreatedGroupChatRequestCopyWithImpl<$Res>
    extends _$GroupchatEventCopyWithImpl<$Res>
    implements _$$_SetIsCreatedGroupChatRequestCopyWith<$Res> {
  __$$_SetIsCreatedGroupChatRequestCopyWithImpl(
      _$_SetIsCreatedGroupChatRequest _value,
      $Res Function(_$_SetIsCreatedGroupChatRequest) _then)
      : super(_value, (v) => _then(v as _$_SetIsCreatedGroupChatRequest));

  @override
  _$_SetIsCreatedGroupChatRequest get _value =>
      super._value as _$_SetIsCreatedGroupChatRequest;
}

/// @nodoc

class _$_SetIsCreatedGroupChatRequest implements _SetIsCreatedGroupChatRequest {
  const _$_SetIsCreatedGroupChatRequest();

  @override
  String toString() {
    return 'GroupchatEvent.SetIsCreatedGroupChatRequest()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SetIsCreatedGroupChatRequest);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String groupChatId, String userId,
            String groupChatName, String groupChatImage)
        CreatedGroupChatRequest,
    required TResult Function(String groupChatName) groupChatNameChanged,
    required TResult Function(
            String groupChatId, String lastMessageGroup, String fullName)
        UpdatedLastMessageGroupChatRequest,
    required TResult Function(String memberId, String groupChatId)
        AddedMemberGroupChatRequest,
    required TResult Function(String groupId, String userId)
        RemovedMemberInGroupChatRequest,
    required TResult Function() SetErrorMessageGroupChatRequest,
    required TResult Function() SetIsCreatedGroupChatRequest,
  }) {
    return SetIsCreatedGroupChatRequest();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String groupChatId, String userId, String groupChatName,
            String groupChatImage)?
        CreatedGroupChatRequest,
    TResult Function(String groupChatName)? groupChatNameChanged,
    TResult Function(
            String groupChatId, String lastMessageGroup, String fullName)?
        UpdatedLastMessageGroupChatRequest,
    TResult Function(String memberId, String groupChatId)?
        AddedMemberGroupChatRequest,
    TResult Function(String groupId, String userId)?
        RemovedMemberInGroupChatRequest,
    TResult Function()? SetErrorMessageGroupChatRequest,
    TResult Function()? SetIsCreatedGroupChatRequest,
  }) {
    return SetIsCreatedGroupChatRequest?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String groupChatId, String userId, String groupChatName,
            String groupChatImage)?
        CreatedGroupChatRequest,
    TResult Function(String groupChatName)? groupChatNameChanged,
    TResult Function(
            String groupChatId, String lastMessageGroup, String fullName)?
        UpdatedLastMessageGroupChatRequest,
    TResult Function(String memberId, String groupChatId)?
        AddedMemberGroupChatRequest,
    TResult Function(String groupId, String userId)?
        RemovedMemberInGroupChatRequest,
    TResult Function()? SetErrorMessageGroupChatRequest,
    TResult Function()? SetIsCreatedGroupChatRequest,
    required TResult orElse(),
  }) {
    if (SetIsCreatedGroupChatRequest != null) {
      return SetIsCreatedGroupChatRequest();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreatedGroupChatRequest value)
        CreatedGroupChatRequest,
    required TResult Function(_GroupChatNameChanged value) groupChatNameChanged,
    required TResult Function(_UpdatedLastMessageGroupChatRequest value)
        UpdatedLastMessageGroupChatRequest,
    required TResult Function(_AddedMemberGroupChatRequest value)
        AddedMemberGroupChatRequest,
    required TResult Function(_RemovedMemberInGroupChatRequest value)
        RemovedMemberInGroupChatRequest,
    required TResult Function(_SetErrorMessageGroupChatRequest value)
        SetErrorMessageGroupChatRequest,
    required TResult Function(_SetIsCreatedGroupChatRequest value)
        SetIsCreatedGroupChatRequest,
  }) {
    return SetIsCreatedGroupChatRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_CreatedGroupChatRequest value)? CreatedGroupChatRequest,
    TResult Function(_GroupChatNameChanged value)? groupChatNameChanged,
    TResult Function(_UpdatedLastMessageGroupChatRequest value)?
        UpdatedLastMessageGroupChatRequest,
    TResult Function(_AddedMemberGroupChatRequest value)?
        AddedMemberGroupChatRequest,
    TResult Function(_RemovedMemberInGroupChatRequest value)?
        RemovedMemberInGroupChatRequest,
    TResult Function(_SetErrorMessageGroupChatRequest value)?
        SetErrorMessageGroupChatRequest,
    TResult Function(_SetIsCreatedGroupChatRequest value)?
        SetIsCreatedGroupChatRequest,
  }) {
    return SetIsCreatedGroupChatRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreatedGroupChatRequest value)? CreatedGroupChatRequest,
    TResult Function(_GroupChatNameChanged value)? groupChatNameChanged,
    TResult Function(_UpdatedLastMessageGroupChatRequest value)?
        UpdatedLastMessageGroupChatRequest,
    TResult Function(_AddedMemberGroupChatRequest value)?
        AddedMemberGroupChatRequest,
    TResult Function(_RemovedMemberInGroupChatRequest value)?
        RemovedMemberInGroupChatRequest,
    TResult Function(_SetErrorMessageGroupChatRequest value)?
        SetErrorMessageGroupChatRequest,
    TResult Function(_SetIsCreatedGroupChatRequest value)?
        SetIsCreatedGroupChatRequest,
    required TResult orElse(),
  }) {
    if (SetIsCreatedGroupChatRequest != null) {
      return SetIsCreatedGroupChatRequest(this);
    }
    return orElse();
  }
}

abstract class _SetIsCreatedGroupChatRequest implements GroupchatEvent {
  const factory _SetIsCreatedGroupChatRequest() =
      _$_SetIsCreatedGroupChatRequest;
}

/// @nodoc
mixin _$GroupchatState {
  String get userId => throw _privateConstructorUsedError;
  String get groupChatName => throw _privateConstructorUsedError;
  bool? get success => throw _privateConstructorUsedError;
  bool? get isCreated => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GroupchatStateCopyWith<GroupchatState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupchatStateCopyWith<$Res> {
  factory $GroupchatStateCopyWith(
          GroupchatState value, $Res Function(GroupchatState) then) =
      _$GroupchatStateCopyWithImpl<$Res>;
  $Res call(
      {String userId,
      String groupChatName,
      bool? success,
      bool? isCreated,
      String? message,
      String? errorMessage});
}

/// @nodoc
class _$GroupchatStateCopyWithImpl<$Res>
    implements $GroupchatStateCopyWith<$Res> {
  _$GroupchatStateCopyWithImpl(this._value, this._then);

  final GroupchatState _value;
  // ignore: unused_field
  final $Res Function(GroupchatState) _then;

  @override
  $Res call({
    Object? userId = freezed,
    Object? groupChatName = freezed,
    Object? success = freezed,
    Object? isCreated = freezed,
    Object? message = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      groupChatName: groupChatName == freezed
          ? _value.groupChatName
          : groupChatName // ignore: cast_nullable_to_non_nullable
              as String,
      success: success == freezed
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      isCreated: isCreated == freezed
          ? _value.isCreated
          : isCreated // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_GroupchatStateCopyWith<$Res>
    implements $GroupchatStateCopyWith<$Res> {
  factory _$$_GroupchatStateCopyWith(
          _$_GroupchatState value, $Res Function(_$_GroupchatState) then) =
      __$$_GroupchatStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String userId,
      String groupChatName,
      bool? success,
      bool? isCreated,
      String? message,
      String? errorMessage});
}

/// @nodoc
class __$$_GroupchatStateCopyWithImpl<$Res>
    extends _$GroupchatStateCopyWithImpl<$Res>
    implements _$$_GroupchatStateCopyWith<$Res> {
  __$$_GroupchatStateCopyWithImpl(
      _$_GroupchatState _value, $Res Function(_$_GroupchatState) _then)
      : super(_value, (v) => _then(v as _$_GroupchatState));

  @override
  _$_GroupchatState get _value => super._value as _$_GroupchatState;

  @override
  $Res call({
    Object? userId = freezed,
    Object? groupChatName = freezed,
    Object? success = freezed,
    Object? isCreated = freezed,
    Object? message = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_GroupchatState(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      groupChatName: groupChatName == freezed
          ? _value.groupChatName
          : groupChatName // ignore: cast_nullable_to_non_nullable
              as String,
      success: success == freezed
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      isCreated: isCreated == freezed
          ? _value.isCreated
          : isCreated // ignore: cast_nullable_to_non_nullable
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

class _$_GroupchatState implements _GroupchatState {
  const _$_GroupchatState(
      {required this.userId,
      required this.groupChatName,
      this.success,
      this.isCreated,
      this.message,
      this.errorMessage});

  @override
  final String userId;
  @override
  final String groupChatName;
  @override
  final bool? success;
  @override
  final bool? isCreated;
  @override
  final String? message;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'GroupchatState(userId: $userId, groupChatName: $groupChatName, success: $success, isCreated: $isCreated, message: $message, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GroupchatState &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality()
                .equals(other.groupChatName, groupChatName) &&
            const DeepCollectionEquality().equals(other.success, success) &&
            const DeepCollectionEquality().equals(other.isCreated, isCreated) &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality()
                .equals(other.errorMessage, errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(groupChatName),
      const DeepCollectionEquality().hash(success),
      const DeepCollectionEquality().hash(isCreated),
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(errorMessage));

  @JsonKey(ignore: true)
  @override
  _$$_GroupchatStateCopyWith<_$_GroupchatState> get copyWith =>
      __$$_GroupchatStateCopyWithImpl<_$_GroupchatState>(this, _$identity);
}

abstract class _GroupchatState implements GroupchatState {
  const factory _GroupchatState(
      {required final String userId,
      required final String groupChatName,
      final bool? success,
      final bool? isCreated,
      final String? message,
      final String? errorMessage}) = _$_GroupchatState;

  @override
  String get userId;
  @override
  String get groupChatName;
  @override
  bool? get success;
  @override
  bool? get isCreated;
  @override
  String? get message;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_GroupchatStateCopyWith<_$_GroupchatState> get copyWith =>
      throw _privateConstructorUsedError;
}
