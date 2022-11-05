part of 'react_post_bloc.dart';

@freezed
class ReactPostEvent with _$ReactPostEvent {
  const factory ReactPostEvent.createReactPostRequest(String userId) =
      _CreateReactPostRequest;
  const factory ReactPostEvent.updateReactPostRequest(String userId,bool status) =
      _UpdateReactPostRequest;
  const factory ReactPostEvent.checkExistReact() =
      _CheckExistReact;
}