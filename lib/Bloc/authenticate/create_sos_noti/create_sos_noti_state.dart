part of 'create_sos_noti_bloc.dart';

// @freezed
// class CreateSosNotiState with _$CreateSosNotiState {
//   const factory CreateSosNotiState.initial() = _Initial;
// }
// class ExerciseLoadedState extends CreateSosNotiState {

//   List<Exericse> list;
  
//   ExerciseLoadedState(this.list);
//   @override
//   // TODO: implement props
//   List<Object?> get props => [list];

// }

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