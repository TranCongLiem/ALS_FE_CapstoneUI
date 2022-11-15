part of 'user_chat_bloc.dart';

@freezed
class UserChatState with _$UserChatState {
const factory UserChatState({
    required String userId,
    bool? success,
    String? message,
    String? errorMessage,

  }) = _UserChatState;

  factory UserChatState.initial() => UserChatState(
        userId: '',
      );}


