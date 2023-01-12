// part of 'exercise_bloc_bloc.dart';

// @freezed
// class ExerciseBlocEvent with _$ExerciseBlocEvent {
//   const factory ExerciseBlocEvent.started() = _Started;
// }

part of 'search_exercise_bloc_bloc.dart';

abstract class SearchExerciseBlocEvent {
  const SearchExerciseBlocEvent();
}

class LoadExerciseByNameEvent extends SearchExerciseBlocEvent {
  final String name;

  const LoadExerciseByNameEvent({required this.name});

  @override
  // TODO: implement props
  List<Object?> get props => [name];
  
  LoadExerciseByNameEvent copyWith({String? name}) {
    return LoadExerciseByNameEvent(name: name?? this.name);
  }
}

// class LoadAllExerciseEvent extends SearchExerciseBlocEvent {
//   @override
//   // TODO: implement props
//   List<Object?> get props => [];
// }
