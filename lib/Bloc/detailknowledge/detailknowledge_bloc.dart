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
import 'package:capstone_ui/Model/getDetailKnowledge_model.dart';
import 'package:capstone_ui/Model/getListExerciseByCate_model.dart';
import 'package:capstone_ui/services/api_Exercise.dart';
import 'package:flutter/cupertino.dart';

import '../../services/api_DetailKnowledge.dart';

part 'detailknowledge_event.dart';
part 'detailknowledge_state.dart';

class DetailKnowledgeBlocBloc
    extends Bloc<DetailKnowledgeBlocEvent, DetailKnowledgeBlocState> {
  final DetailKnowledgeService _detailKnowledgeService;

  DetailKnowledgeBlocBloc(this._detailKnowledgeService)
      : super(DetailKnowledgeBlocInitial()) {
    on<LoadDetailKnowledgeEvent>((event, emit) async {
      // TODO: implement event handler
      final newsId = event.newsId;
      final list =
          await _detailKnowledgeService.getListDetailKnowledgeById(newsId);
      emit(DetailKnowledgeLoadedState(list));
    });
  }
}
