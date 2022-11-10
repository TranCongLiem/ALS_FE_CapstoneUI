

import 'package:bloc/bloc.dart';
import 'package:capstone_ui/Model/getListCategory_model.dart';
import 'package:capstone_ui/services/api_ShortCutNotification.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../Model/getNotification_model.dart';
part 'get_noti_supporter_event.dart';
part 'get_noti_supporter_state.dart';
class NotificationBlocBloc extends Bloc<NotiSupporterEvent, NotificationBlocState> {
 final ShortCutNotificationService _shortCutNotificationService;
 
 
 
   NotificationBlocBloc(this._shortCutNotificationService) : super(NotificationBlocInitial()) {
    on<LoadNotificationBySupporterIdEvent>((event, emit) async {
      // TODO: implement event handler
      final supporterId= event.supporterId;
      final list= await _shortCutNotificationService.getListShortCutNotificationBySupporterId(supporterId);
      emit(NotificationLoadedState(list));
      
    });
  }
}
