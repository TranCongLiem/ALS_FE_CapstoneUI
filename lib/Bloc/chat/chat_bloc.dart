import 'package:bloc/bloc.dart';
import 'package:capstone_ui/Model/getListChat_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../Model/getListPost_model.dart';
import '../../services/api_Post.dart';
import '../../services/api_chat.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
 final ChatService _ChatService;
 
 
 
  ChatBloc(this._ChatService) : super(ChatBlocInitial()) {
    on<LoadChatEvent>((event, emit) async {
      final list= await _ChatService.getAllChat(event.userId);
      emit(ChatLoadedState(list));
    });
    
}
}
