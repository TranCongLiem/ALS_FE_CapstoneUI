part of 'category_exercise_bloc.dart';

@immutable
abstract class CategoryExerciseBlocState {}
//const ExerciseBlocState();

class CategoryExerciseBlocInitial extends CategoryExerciseBlocState {
  @override
  // TODO: implement props
  List<Object> get props => [];
  
}
class CategoryExerciseLoadedState extends CategoryExerciseBlocState {

  List<CategoryExercise> list;
  
  CategoryExerciseLoadedState(this.list);
  @override
  // TODO: implement props
  List<Object?> get props => [list];

}
