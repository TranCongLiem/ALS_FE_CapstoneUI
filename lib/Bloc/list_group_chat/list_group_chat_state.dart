part of 'list_group_chat_bloc.dart';

@immutable
abstract class ListGroupChatState {}
//const ExerciseBlocState();

class GroupChatBlocInitial extends ListGroupChatState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class GroupChatLoadedState extends ListGroupChatState {

  List<ListAllGroupChat> list2;
  
  GroupChatLoadedState(this.list2);
  @override
  // TODO: implement props
  List<Object?> get props => [list2];

}