part of 'post_bloc.dart';

@immutable
abstract class PostBlocState {}
//const ExerciseBlocState();

class PostBlocInitial extends PostBlocState {
  @override
  // TODO: implement props
  List<Object> get props => [];
  
}
class PostLoadedState extends PostBlocState {

  List<ListPost> list;
  
  PostLoadedState(this.list);
  @override
  // TODO: implement props
  List<Object?> get props => [list];

}