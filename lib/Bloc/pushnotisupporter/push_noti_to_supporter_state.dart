part of 'push_noti_to_supporter_bloc.dart';

// @freezed
// class PushNotiToSupporterState with _$PushNotiToSupporterState {
//   const factory PushNotiToSupporterState.initial() = _Initial;
// }

@immutable
abstract class PushNotiToSupporterState {
const PushNotiToSupporterState();

}

class PushNotiToSupporterBlocInitial extends PushNotiToSupporterState {
 CreatePushNotificationResponeModel createPushNotificationResponeModel=   CreatePushNotificationResponeModel(success: false, message: "");
  
}
class  PushNotiToSupporterSuccessState extends PushNotiToSupporterState {

  late CreatePushNotificationResponeModel createPushNotificationResponeModel;
  
  PushNotiToSupporterSuccessState(this.createPushNotificationResponeModel);

}
class  PushNotiToSupporterErrorState extends PushNotiToSupporterState {

  //late CreatePushNotificationResponeModel createPushNotificationResponeModel;
 CreatePushNotificationResponeModel createPushNotificationResponeModel=   CreatePushNotificationResponeModel(success: false, message: "Cann't PushNotification.");

  
  PushNotiToSupporterErrorState(this.createPushNotificationResponeModel);

}