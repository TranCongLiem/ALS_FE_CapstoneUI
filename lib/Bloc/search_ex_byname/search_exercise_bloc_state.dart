part of 'search_exercise_bloc_bloc.dart';


@immutable
abstract class SearchExerciseBlocState {}
//const ExerciseBlocState();

class SearchExerciseBlocInitial extends SearchExerciseBlocState {
  @override
  // TODO: implement props
  List<Object> get props => [];
  
}
class SearchExerciseLoadedState extends SearchExerciseBlocState {

  List<Exericse> list;
  
  SearchExerciseLoadedState(this.list);
  @override
  // TODO: implement props
  List<Object?> get props => [list];

}


