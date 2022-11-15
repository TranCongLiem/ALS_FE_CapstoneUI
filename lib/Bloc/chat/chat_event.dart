part of 'chat_bloc.dart';

abstract class ChatEvent {
  const ChatEvent();
}

class LoadChatEvent extends ChatEvent{
  final String userId;
  const LoadChatEvent({required this.userId});
  @override
  // TODO: implement props
  List<Object?> get props => [];

}