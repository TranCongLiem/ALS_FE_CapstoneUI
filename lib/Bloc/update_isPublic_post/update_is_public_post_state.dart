part of 'update_is_public_post_bloc.dart';

@freezed
class UpdateIsPublicPostState with _$UpdateIsPublicPostState {
  const factory UpdateIsPublicPostState({
    required String userId,
    required bool? isPublic,
    bool? success,
    String? message,
    String? errorMessage,
  }) = _UpdateIsPublicPostState;

  factory UpdateIsPublicPostState.initial() => UpdateIsPublicPostState(
        userId: '',
        isPublic: false,
      );
}
