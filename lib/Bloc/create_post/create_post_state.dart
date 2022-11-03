part of 'create_post_bloc.dart';

@freezed
@immutable
class CreatePostState with _$CreatePostState {
  const factory CreatePostState({
    required String userId,
    required String image,
    required String caption,
    required bool isCreated,
    bool? success,
    String? message,
    String? errorMessage,
  }) = _CreatePostState;

  factory CreatePostState.initial() => CreatePostState(
        userId: '',
        image: '',
        caption: '',
        isCreated: false,
      );
}