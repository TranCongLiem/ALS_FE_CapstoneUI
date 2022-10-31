part of 'detailknowledge_bloc.dart';

@immutable
abstract class DetailKnowledgeBlocState {}
//const ExerciseBlocState();

class DetailKnowledgeBlocInitial extends DetailKnowledgeBlocState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class DetailKnowledgeLoadedState extends DetailKnowledgeBlocState {
  List<DetailKnowledge> list;

  DetailKnowledgeLoadedState(this.list);
  @override
  // TODO: implement props
  List<Object?> get props => [list];
}
