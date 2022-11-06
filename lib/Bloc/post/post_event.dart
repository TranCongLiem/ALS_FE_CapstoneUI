part of 'post_bloc.dart';

abstract class PostBlocEvent {
  const PostBlocEvent();
}

class LoadPostEvent extends PostBlocEvent{
  final String userId;
  const LoadPostEvent({required this.userId});
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
