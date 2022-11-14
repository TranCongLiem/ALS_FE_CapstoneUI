part of 'react_post_bloc.dart';

@freezed
class ReactPostState with _$ReactPostState {
const factory ReactPostState({
    required String userId,
    required String postId,
    required bool status,
    bool? success,
    String? message,
    String? errorMessage,
    bool? check,

  }) = _ReactPostState;

  factory ReactPostState.initial() => ReactPostState(
        userId: '',
        postId: '',
        status: false,
      );}
