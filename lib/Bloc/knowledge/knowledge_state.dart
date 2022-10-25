part of 'knowledge_bloc.dart';



@immutable
abstract class ListKnowledgeBlocState {}
//const ExerciseBlocState();

class ListKnowledgeBlocInitial extends ListKnowledgeBlocState {
  @override
  // TODO: implement props
  List<Object> get props => [];
  
}
class ListKnowledgeLoadedState extends ListKnowledgeBlocState {

  List<ListKnowledge> list;
  
  ListKnowledgeLoadedState(this.list);
  @override
  // TODO: implement props
  List<Object?> get props => [list];

}
