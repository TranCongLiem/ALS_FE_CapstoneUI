import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../Model/getListPost_model.dart';
import '../../Model/groupChat_model.dart';
import '../../services/api_groupchat.dart';

part 'list_group_chat_hasjoin_event.dart';
part 'list_group_chat_hasjoin_state.dart';

class ListGroupChatHasJoinBloc extends Bloc<ListGroupChatHasJoinEvent, ListGroupChatHasJoinState> {
 final GroupChatService _GroupChatService;
 
 
  ListGroupChatHasJoinBloc(this._GroupChatService) : super(ListGroupChatHasJoinBlocInitial()) {
    on<LoadListGroupChatByUserIdEvent>((event, emit) async {
      final list1= await _GroupChatService.getAllGroupChatUserJoin(event.userId);
      emit(GroupChatHasJoinLoadedState(list1));
    });

}
}
