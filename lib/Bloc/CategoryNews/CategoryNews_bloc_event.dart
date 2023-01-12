// part of 'exercise_bloc_bloc.dart';

// @freezed
// class ExerciseBlocEvent with _$ExerciseBlocEvent {
//   const factory ExerciseBlocEvent.started() = _Started;
// }

part of 'CategoryNews_bloc_bloc.dart';

abstract class CategoryNewsBlocEvent {
  const CategoryNewsBlocEvent();
}

// class LoadKnowLedgeByCateEvent extends CategoryNewsBlocEvent {
//   //final String categoryId;
//   final GetKnowledgeByCategoryKnowledgeIdRequest request;

//   const LoadKnowLedgeByCateEvent({required this.request});

//   @override
//   // TODO: implement props
//   List<Object?> get props => [request];

//   LoadKnowLedgeByCateEvent copyWith({GetKnowledgeByCategoryKnowledgeIdRequest?  request}) {
//     return LoadKnowLedgeByCateEvent(request: request?? this.request);
//   }
// }

class LoadAllCategoryKnowLedge extends CategoryNewsBlocEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}