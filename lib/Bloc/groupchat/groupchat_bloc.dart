import 'package:bloc/bloc.dart';
import 'package:capstone_ui/Model/groupChat_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../services/api_groupchat.dart';

part 'groupchat_event.dart';
part 'groupchat_state.dart';
part 'groupchat_bloc.freezed.dart';

class GroupchatBloc extends Bloc<GroupchatEvent, GroupchatState> {
  final GroupChatService _groupChatService;
  GroupchatBloc(this._groupChatService) : super(GroupchatState.initial()) {
    on<_CreatedGroupChatRequest>((event, emit) async {
      CreateGroupChatRequest reqModel = CreateGroupChatRequest(
          groupChatId : event.groupChatId,
          userId: event.userId,
          groupChatName: event.groupChatName,
          groupChatImage: event.groupChatImage);
      final result = await _groupChatService.createGroupChat(reqModel);
      if (result.message != null && result.success != null) {
        emit(state.copyWith(
          message: result.message ?? '',
          success: result.success,
        ));
      } else {
        emit(state.copyWith(errorMessage: "  "));
      }
    });

    on<_UpdatedLastMessageGroupChatRequest>((event, emit) async {
      UpdateLastMessageGroupChatRequest reqModel = UpdateLastMessageGroupChatRequest(
          groupChatId: event.groupChatId,
          lastMessageGroup: event.lastMessageGroup,
          lastMessageSender: event.fullName);
      final result = await _groupChatService.updateLastMessageGroupChat(reqModel);
      if (result.message != null && result.success != null) {
        emit(state.copyWith(
          message: result.message ?? '',
          success: result.success,
        ));
      } else {
        emit(state.copyWith(errorMessage: "  "));
      }
    });

    on<_AddedMemberGroupChatRequest>((event, emit) async {
      AddMemberGroupChatRequest reqModel = AddMemberGroupChatRequest(
          memberId: event.memberId,
          groupChatId: event.groupChatId);
      final result = await _groupChatService.addMemberGroupChat(reqModel);
      if (result.message != null && result.success != null) {
        emit(state.copyWith(
          message: result.message ?? '',
          success: result.success,
        ));
      } else {
        emit(state.copyWith(errorMessage: "  "));
      }
    });

    on<_RemovedMemberInGroupChatRequest>((event, emit) async {
      RemoveMemberInGroupRequestModel reqModel = RemoveMemberInGroupRequestModel(
          groupId: event.groupId,
          userId: event.userId);
      final result = await _groupChatService.removeMember(reqModel);
      if (result.message != null && result.success != null) {
        emit(state.copyWith(
          message: result.message ?? '',
          success: result.success,
        ));
      } else {
        emit(state.copyWith(errorMessage: "  "));
      }
    });

    // on<_GroupChatNameChanged>((event, emit) {
    //   emit(state.copyWith(groupChatName: event.groupChatName));
    // });

  }
}
