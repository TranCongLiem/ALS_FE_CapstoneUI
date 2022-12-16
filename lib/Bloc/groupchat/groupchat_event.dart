part of 'groupchat_bloc.dart';

@freezed
class GroupchatEvent with _$GroupchatEvent {
  const factory GroupchatEvent.CreatedGroupChatRequest(
      String groupChatId,
      String userId,
      String groupChatName,
      String groupChatImage) = _CreatedGroupChatRequest;
  const factory GroupchatEvent.groupChatNameChanged(String groupChatName) =
      _GroupChatNameChanged;
  const factory GroupchatEvent.UpdatedLastMessageGroupChatRequest(
          String groupChatId, String lastMessageGroup, String fullName) =
      _UpdatedLastMessageGroupChatRequest;
  const factory GroupchatEvent.AddedMemberGroupChatRequest(
      String memberId, String groupChatId) = _AddedMemberGroupChatRequest;
  const factory GroupchatEvent.RemovedMemberInGroupChatRequest(
      String groupId, String userId) = _RemovedMemberInGroupChatRequest;
  const factory GroupchatEvent.SetErrorMessageGroupChatRequest() =
      _SetErrorMessageGroupChatRequest;
  const factory GroupchatEvent.SetIsCreatedGroupChatRequest() =
      _SetIsCreatedGroupChatRequest;
  const factory GroupchatEvent.SetIsRemovedGroupChatRequest() =
      _SetIsRemovedGroupChatRequest;
}
