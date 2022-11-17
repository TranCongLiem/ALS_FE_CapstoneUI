part of 'list_group_chat_bloc.dart';

abstract class ListGroupChatEvent {
  const ListGroupChatEvent();
}

class LoadListGroupChatEvent extends ListGroupChatEvent{
  final String userId;
  const LoadListGroupChatEvent({required this.userId});
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
