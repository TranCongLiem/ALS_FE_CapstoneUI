part of 'create_sos_noti_bloc.dart';
@immutable
abstract class SendSOSBlocState {}
//const ExerciseBlocState();
class SendSOSBlocInitial extends SendSOSBlocState {
 GetPhoneByIdResponeModel getRelatinshipWithUserByIdResponeModel= GetPhoneByIdResponeModel(phoneNumber: "");
  
}
class  SendSOSSuccessBlocState extends SendSOSBlocState {

  late GetPhoneByIdResponeModel getPhoneByIdResponeModel;
  
  SendSOSSuccessBlocState(this.getPhoneByIdResponeModel);

}
class  SendSOSFailBlocState extends SendSOSBlocState {

  //late CreatePushNotificationResponeModel createPushNotificationResponeModel;
 GetPhoneByIdResponeModel getPhoneByIdResponeModel=   GetPhoneByIdResponeModel(phoneNumber: "Can not send SOS");

  
  SendSOSFailBlocState(this.getPhoneByIdResponeModel);
  

}