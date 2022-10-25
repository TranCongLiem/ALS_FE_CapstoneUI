

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Model/getListKnowledge_model.dart';
import '../../services/api_ListKnowledge.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'knowledge_event.dart';
part 'knowledge_state.dart';

// part 'category_exercise_bloc.freezed.dart';

// class CategoryExerciseBloc extends Bloc<CategoryExerciseEvent, CategoryExerciseState> {
//   CategoryExerciseBloc() : super(_Initial()) {
//     on<CategoryExerciseEvent>((event, emit) {
//       // TODO: implement event handler
//     });
//   }
// }

class ListKnowledgeBlocBloc extends Bloc<ListKnowledgeBlocEvent, ListKnowledgeBlocState> {
 final ListKnowledgeService _knowledgeService;
 
 
 
  ListKnowledgeBlocBloc(this._knowledgeService) : super(ListKnowledgeBlocInitial()) {
    on<LoadListKnowledgeEvent>((event, emit) async {
      // TODO: implement event handler

      final list= await _knowledgeService.getListKnowledge();
      emit(ListKnowledgeLoadedState(list));
      
    });
  }
}
