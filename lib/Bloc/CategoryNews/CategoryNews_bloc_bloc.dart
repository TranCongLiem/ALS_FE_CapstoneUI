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
import 'package:capstone_ui/services/api_ListKnowledge.dart';
import 'package:flutter/cupertino.dart';

import '../../Model/getListKnowledge_model.dart';

part 'CategoryNews_bloc_event.dart';
part 'CategoryNews_bloc_state.dart';

class CategoryKnowledgeBlocBloc
    extends Bloc<CategoryNewsBlocEvent, CategoryKnowledgeBlocState> {
  //final ExerciseService _exerciseService;
  final ListKnowledgeService _knowledgeService;

  CategoryKnowledgeBlocBloc(this._knowledgeService)
      : super(CategoryKnowledgeBlocInitial()) {
    on<LoadAllCategoryKnowLedge>((event, emit) async {
      final list = await _knowledgeService.GetAllCategoryKnowLedge();
      emit(CategoryKnowledgeLoadedState(list));
    });
  }
}