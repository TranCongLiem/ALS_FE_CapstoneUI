part of 'react_post_bloc.dart';

@freezed
class ReactPostEvent with _$ReactPostEvent {
  // const factory ReactPostEvent.createReactPostRequest(String userId) =
  //     _CreateReactPostRequest;
  const factory ReactPostEvent.reactPostRequest(String userId,String postId,bool status) =
      _ReactPostRequest;
  // const factory ReactPostEvent.checkExistReact() =
  //     _CheckExistReact;
}