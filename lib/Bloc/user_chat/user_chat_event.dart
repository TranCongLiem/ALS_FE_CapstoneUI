part of 'user_chat_bloc.dart';

@freezed
class UserChatEvent with _$UserChatEvent {
  const factory UserChatEvent.UpdateHasSeenRequest(String userIdFrom,String userIdTo) = _UpdateHasSeenRequest;
  const factory UserChatEvent.UpdateUserChatRequest(String userIdFrom,String userIdTo,String lastMessage) = _UpdateUserChatRequest;
  const factory UserChatEvent.NotificationChatRequest(String userIdFrom,String userIdTo,String lastMessage) = _NotificationChatRequest;
}