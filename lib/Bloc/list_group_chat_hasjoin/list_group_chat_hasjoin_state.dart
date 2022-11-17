part of 'list_group_chat_hasjoin_bloc.dart';

@immutable
abstract class ListGroupChatHasJoinState {}
//const ExerciseBlocState();

class ListGroupChatHasJoinBlocInitial extends ListGroupChatHasJoinState {
  @override
  // TODO: implement props
  List<Object> get props => [];
  
}
class GroupChatHasJoinLoadedState extends ListGroupChatHasJoinState {

  List<ListAllGroupChatUserJoin> list1;
  
  GroupChatHasJoinLoadedState(this.list1);
  @override
  // TODO: implement props
  List<Object?> get props => [list1];

}
