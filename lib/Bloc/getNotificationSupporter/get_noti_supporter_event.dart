part of 'get_noti_supporter_bloc.dart';

abstract class NotiSupporterEvent {
  const NotiSupporterEvent();
}
class LoadNotificationBySupporterIdEvent extends NotiSupporterEvent {
  final String supporterId;

  const LoadNotificationBySupporterIdEvent({required this.supporterId});

  @override
  // TODO: implement props
  List<Object?> get props => [supporterId];
  
  LoadNotificationBySupporterIdEvent copyWith({String? categoryId}) {
    return LoadNotificationBySupporterIdEvent(supporterId: categoryId?? this.supporterId);
  }
}