import 'package:bloc/bloc.dart';
import 'package:capstone_ui/Model/getListCategory_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../services/api_CategoryExercise.dart';

part 'category_exercise_event.dart';
part 'category_exercise_state.dart';
// part 'category_exercise_bloc.freezed.dart';

// class CategoryExerciseBloc extends Bloc<CategoryExerciseEvent, CategoryExerciseState> {
//   CategoryExerciseBloc() : super(_Initial()) {
//     on<CategoryExerciseEvent>((event, emit) {
//       // TODO: implement event handler
//     });
//   }
// }

class CategoryExerciseBlocBloc extends Bloc<CategoryExerciseBlocEvent, CategoryExerciseBlocState> {
 final CategoryExerciseService _exerciseService;
 
 
 
  CategoryExerciseBlocBloc(this._exerciseService) : super(CategoryExerciseBlocInitial()) {
    on<LoadCategoryExerciseEvent>((event, emit) async {
      // TODO: implement event handler

      final list= await _exerciseService.getListCategoryExercise();
      emit(CategoryExerciseLoadedState(list));
      
    });
  }
}
