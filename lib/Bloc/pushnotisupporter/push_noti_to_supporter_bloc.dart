import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../Model/CreatePushNotiToSupporter_model.dart';
import '../../services/api_ShortCutNotification.dart';

part 'push_noti_to_supporter_event.dart';
part 'push_noti_to_supporter_state.dart';

// class PushNotiToSupporterBloc extends Bloc<PushNotiToSupporterEvent, PushNotiToSupporterState> {
//   PushNotiToSupporterBloc() : super(_Initial()) {
//     on<PushNotiToSupporterEvent>((event, emit) {
//       // TODO: implement event handler
//     });
//   }
// }

class PushNotiToSupporterBloc
    extends Bloc<PushNotiToSupporterEvent, PushNotiToSupporterState> {
  final ShortCutNotificationService shortcutNotiService;

  PushNotiToSupporterBloc(this.shortcutNotiService)
      : super(PushNotiToSupporterBlocInitial()) {
    on<PushNotiToSupporterByRequestEvent>((event, emit) async {
      // TODO: implement event handler
      final request = event.createPushNotificationRequestModel;
      CreatePushNotificationResponeModel createPushNotificationResponeModel;
      if (request.receiverId.isEmpty || request.receiverId == null) {
        createPushNotificationResponeModel = CreatePushNotificationResponeModel(
            success: false, message: "Doesn't link any Supporter");
        emit(PushNotiToSupporterErrorState(
            createPushNotificationResponeModel));
      } else {
        createPushNotificationResponeModel =
            await shortcutNotiService.SentNotiToSupporter(request);
        emit(PushNotiToSupporterSuccessState(
            createPushNotificationResponeModel));
      }
    });
  }
}
