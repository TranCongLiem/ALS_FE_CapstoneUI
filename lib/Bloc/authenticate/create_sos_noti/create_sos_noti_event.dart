part of 'create_sos_noti_bloc.dart';

// @freezed
// class CreateSosNotiEvent with _$CreateSosNotiEvent {
//   const factory CreateSosNotiEvent.started() = _Started;
// }
abstract class CreateSosNotiEvent {
  const CreateSosNotiEvent();
}
class SendSOSEvent extends CreateSosNotiEvent {
  final String userId;

  const SendSOSEvent({required this.userId});
 
}