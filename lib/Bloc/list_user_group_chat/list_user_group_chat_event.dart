part of 'list_user_group_chat_bloc.dart';


abstract class ListUserGroupChatEvent {
  const ListUserGroupChatEvent();
}

class LoadListUserGroupChatEvent extends ListUserGroupChatEvent{
  final String groupId;
  const LoadListUserGroupChatEvent({required this.groupId});
  @override
  // TODO: implement props
  List<Object?> get props => [];

}