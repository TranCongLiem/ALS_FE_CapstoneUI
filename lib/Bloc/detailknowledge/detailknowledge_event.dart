part of 'detailknowledge_bloc.dart';

abstract class DetailKnowledgeBlocEvent {
  const DetailKnowledgeBlocEvent();
}

class LoadDetailKnowledgeEvent extends DetailKnowledgeBlocEvent {
  final String newsId;
  const LoadDetailKnowledgeEvent({required this.newsId});
  @override
  // TODO: implement props
  List<Object?> get props => [newsId];
}
