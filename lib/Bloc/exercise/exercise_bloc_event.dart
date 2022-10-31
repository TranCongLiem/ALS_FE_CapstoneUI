// part of 'exercise_bloc_bloc.dart';

// @freezed
// class ExerciseBlocEvent with _$ExerciseBlocEvent {
//   const factory ExerciseBlocEvent.started() = _Started;
// }

part of 'exercise_bloc_bloc.dart';

abstract class ExerciseBlocEvent {
  const ExerciseBlocEvent();
}

class LoadExerciseByCateEvent extends ExerciseBlocEvent {
  final String categoryId;
  const LoadExerciseByCateEvent({required this.categoryId});
  @override
  // TODO: implement props
  List<Object?> get props => [categoryId];
}
