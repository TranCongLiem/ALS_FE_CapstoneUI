import 'package:bloc/bloc.dart';
import 'package:capstone_ui/Model/getListChat_model.dart';
import 'package:capstone_ui/services/api_chat.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_chat_event.dart';
part 'user_chat_state.dart';
part 'user_chat_bloc.freezed.dart';

class UserChatBloc extends Bloc<UserChatEvent, UserChatState> {
  final ChatService _chatService;
  UserChatBloc(this._chatService) : super(UserChatState.initial()) {
    on<_UpdateHasSeenRequest>((event, emit) async {
      UpdateHasSeenReQuestModel reqModel = UpdateHasSeenReQuestModel(
          userIdFrom: event.userIdFrom, userIdTo: event.userIdTo);
      final result = await _chatService.updateHasSeen(reqModel);
      if (result.message != null && result.success != null) {
        emit(state.copyWith(
          message: result.message ?? '',
          success: result.success,
        ));
      } else {
        emit(state.copyWith(errorMessage: "  "));
      }
    });
    on<_UpdateUserChatRequest>((event, emit) async {
      UpdateUserChatReQuestModel reqModel = UpdateUserChatReQuestModel(
          userIdFrom: event.userIdFrom,
          userIdTo: event.userIdTo,
          lastMessage: event.lastMessage);
      final result = await _chatService.updateUserChat(reqModel);
      if (result.message != null && result.success != null) {
        emit(state.copyWith(
          message: result.message ?? '',
          success: result.success,
        ));
      } else {
        emit(state.copyWith(errorMessage: "  "));
      }
    });
    on<_NotificationChatRequest>((event, emit) async {
      PushNotificationChatReQuestModel reqModel = PushNotificationChatReQuestModel(
          userIdFrom: event.userIdFrom,
          userIdTo: event.userIdTo,
          lastMessage: event.lastMessage);
      final result = await _chatService.pushNotificationChatting(reqModel);
      if (result == true) {
        
      } else {
        emit(state.copyWith(errorMessage: "  "));
      }
    });
  }
}
