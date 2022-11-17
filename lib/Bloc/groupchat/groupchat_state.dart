part of 'groupchat_bloc.dart';

@freezed
class GroupchatState with _$GroupchatState {
const factory GroupchatState({
    required String userId,
    required String groupChatName,
    bool? success,
    String? message,
    String? errorMessage,

  }) = _GroupchatState;

  factory GroupchatState.initial() => GroupchatState(
        userId: '',
        groupChatName: '',
      );
}
