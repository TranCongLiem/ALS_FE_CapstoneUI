// import 'package:bloc/bloc.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

// import '../../Model/getListExerciseByCate_model.dart';

// part 'exercise_bloc_event.dart';
// part 'exercise_bloc_state.dart';
// part 'exercise_bloc_bloc.freezed.dart';

// class ExerciseBlocBloc extends Bloc<ExerciseBlocEvent, ExerciseBlocState> {
//   ExerciseBlocBloc() : super(_Initial()) {
//     on<ExerciseBlocEvent>((event, emit) {
//       // TODO: implement event handler
//     });
//   }
// }




import 'package:bloc/bloc.dart';
import 'package:capstone_ui/Model/getListExerciseByCate_model.dart';
import 'package:capstone_ui/services/api_Exercise.dart';
import 'package:flutter/cupertino.dart';

part 'search_exercise_bloc_event.dart';
part 'search_exercise_bloc_state.dart';

class SearchExerciseBlocBloc extends Bloc<SearchExerciseBlocEvent, SearchExerciseBlocState> {
 final ExerciseService _exerciseService;
 
 
 
  SearchExerciseBlocBloc(this._exerciseService) : super(SearchExerciseBlocInitial()) {
    on<LoadExerciseByNameEvent>((event, emit) async {
      // TODO: implement event handler
      final name= event.name;
      final list= await _exerciseService.getListExerciseByName(name);
      emit(SearchExerciseLoadedState(list));
      
    });

  //   on<LoadAllExerciseEvent>((event, emit) async {
  //     // TODO: implement event handler
  //     //final categoryId= event.categoryId;
  //     final list= await _exerciseService.getAllExercise();
  //     emit(ExerciseLoadedState(list));
      
  //   });
  }
}

