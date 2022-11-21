part of 'push_noti_to_supporter_bloc.dart';

// @freezed
// class PushNotiToSupporterEvent with _$PushNotiToSupporterEvent {
//   const factory PushNotiToSupporterEvent.started() = _Started;
// }

abstract class PushNotiToSupporterEvent {
  const PushNotiToSupporterEvent();
}
 class PushNotiToSupporterByRequestEvent extends PushNotiToSupporterEvent {
  final CreatePushNotificationRequestModel createPushNotificationRequestModel;

  const PushNotiToSupporterByRequestEvent({required this.createPushNotificationRequestModel});

  @override
  // TODO: implement props
  List<Object?> get props => [createPushNotificationRequestModel];
  
  // LoadExerciseByCateEvent copyWith({String? categoryId}) {
  //   return LoadExerciseByCateEvent(categoryId: categoryId?? this.categoryId);
  // }
}