part of 'list_user_group_chat_bloc.dart';
abstract class ListUserGroupChatState {}

class ListUserGroupChatBlocInitial extends ListUserGroupChatState {
  @override
  // TODO: implement props
  List<Object> get props => [];
  
}
class UserGroupChatLoadedState extends ListUserGroupChatState {

  List<ListGetAllUserInGroupChat> list1;
  
  UserGroupChatLoadedState(this.list1);
  @override
  // TODO: implement props
  List<Object?> get props => [list1];

}
