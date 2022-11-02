part of 'create_post_bloc.dart';

@freezed
class CreatePostEvent with _$CreatePostEvent {
  const factory CreatePostEvent.imageChanged(String image) =
      _ImageChanged;
  const factory CreatePostEvent.captionChanged(String caption) =
      _CaptionChanged;
  const factory CreatePostEvent.createPostRequest() = _CreatePostRequest;
  const factory CreatePostEvent.createCheckRequested() = _CreateCheckRequested;
  const factory CreatePostEvent.setStateFlase() = _SetStateFlase;
}
