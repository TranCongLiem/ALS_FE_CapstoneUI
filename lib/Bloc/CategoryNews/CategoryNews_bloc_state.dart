part of 'CategoryNews_bloc_bloc.dart';


@immutable
abstract class CategoryKnowledgeBlocState {}
//const ExerciseBlocState();

class CategoryKnowledgeBlocInitial extends CategoryKnowledgeBlocState {
  @override
  // TODO: implement props
  List<Object> get props => [];
  
}
class CategoryKnowledgeLoadedState extends CategoryKnowledgeBlocState {

  List<CategoryNewsKnowLedgeResponse> list;
  
  CategoryKnowledgeLoadedState(this.list);
  @override
  // TODO: implement props
  List<Object?> get props => [list];

}


