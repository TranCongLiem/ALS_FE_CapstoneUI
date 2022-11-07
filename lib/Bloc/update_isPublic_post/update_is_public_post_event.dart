part of 'update_is_public_post_bloc.dart';

@freezed
class UpdateIsPublicPostEvent with _$UpdateIsPublicPostEvent {
  const factory UpdateIsPublicPostEvent.UpdateIsPublicPostRequest(String postId,bool isPublic) = _UpdateIsPublicPostRequest;
}