part of 'list_group_chat_hasjoin_bloc.dart';

abstract class ListGroupChatHasJoinEvent {
  const ListGroupChatHasJoinEvent();
}

class LoadListGroupChatByUserIdEvent extends ListGroupChatHasJoinEvent{
  final String userId;
  const LoadListGroupChatByUserIdEvent({required this.userId});
  @override
  // TODO: implement props
  List<Object?> get props => [];

}