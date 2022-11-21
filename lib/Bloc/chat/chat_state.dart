part of 'chat_bloc.dart';

@immutable
abstract class ChatState {}
//const ExerciseBlocState();

class ChatBlocInitial extends ChatState {
  @override
  // TODO: implement props
  List<Object> get props => [];
  
}
class ChatLoadedState extends ChatState {

  List<ListChat> list;
  
  ChatLoadedState(this.list);
  @override
  // TODO: implement props
  List<Object?> get props => [list];

}