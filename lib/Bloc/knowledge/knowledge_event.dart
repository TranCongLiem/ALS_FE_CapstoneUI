// part of 'knowledge_bloc.dart';
//
// abstract class ListKnowledgeBlocEvent {
//   const ListKnowledgeBlocEvent();
// }
//
// class LoadListKnowledgeEvent extends ListKnowledgeBlocEvent{
//   @override
//   // TODO: implement props
//   List<Object?> get props => [];
//
// }

part of 'knowledge_bloc.dart';

abstract class ListKnowledgeBlocEvent {
  const ListKnowledgeBlocEvent();
}

class LoadListKnowledgeEvent extends ListKnowledgeBlocEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class LoadKnowLedgeByCateEvent extends ListKnowledgeBlocEvent {
  //final String categoryId;
  final GetKnowledgeByCategoryKnowledgeIdRequest request;

  const LoadKnowLedgeByCateEvent({required this.request});

  @override
  // TODO: implement props
  List<Object?> get props => [request];

  LoadKnowLedgeByCateEvent copyWith({GetKnowledgeByCategoryKnowledgeIdRequest?  request}) {
    return LoadKnowLedgeByCateEvent(request: request?? this.request);
  }
}