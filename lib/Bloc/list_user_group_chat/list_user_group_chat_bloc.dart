import 'package:bloc/bloc.dart';
import 'package:capstone_ui/Model/groupChat_model.dart';
import 'package:capstone_ui/services/api_groupchat.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_user_group_chat_event.dart';
part 'list_user_group_chat_state.dart';

class ListUserGroupChatBloc extends Bloc<ListUserGroupChatEvent, ListUserGroupChatState> {
   final GroupChatService _GroupChatService;

  ListUserGroupChatBloc(this._GroupChatService) : super(ListUserGroupChatBlocInitial()) {
    on<LoadListUserGroupChatEvent>((event, emit) async {
      final list1= await _GroupChatService.getAllUserInGroupChat(event.groupId);
      emit(UserGroupChatLoadedState(list1));
    });
  }
}
