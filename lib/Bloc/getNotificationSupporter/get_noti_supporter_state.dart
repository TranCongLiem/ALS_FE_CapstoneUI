 part of 'get_noti_supporter_bloc.dart';

// @freezed
// class GetNotiSupporterState with _$GetNotiSupporterState {
//   const factory GetNotiSupporterState.initial() = _Initial;
// }



@immutable
abstract class NotificationBlocState {}
//const ExerciseBlocState();

class NotificationBlocInitial extends NotificationBlocState {
  @override
  // TODO: implement props
  List<Object> get props => [];
  
}
class NotificationLoadedState extends NotificationBlocState {

  List<ShortCutNotification> list;
  
  NotificationLoadedState(this.list);
  @override
  // TODO: implement props
  List<Object?> get props => [list];

}