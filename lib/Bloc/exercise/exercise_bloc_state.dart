part of 'exercise_bloc_bloc.dart';


@immutable
abstract class ExerciseBlocState {}
//const ExerciseBlocState();

class ExerciseBlocInitial extends ExerciseBlocState {
  @override
  // TODO: implement props
  List<Object> get props => [];
  
}
class ExerciseLoadedState extends ExerciseBlocState {

  List<Exericse> list;
  
  ExerciseLoadedState(this.list);
  @override
  // TODO: implement props
  List<Object?> get props => [list];

}


