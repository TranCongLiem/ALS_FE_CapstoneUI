part of 'session_bloc.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class SessionState with _$SessionState {
  const factory SessionState({
    required List<GetSessionsResponseModel> sessions,
    List<GetSessionsResponseModel>? adminSessions,
    List<Exericse>? exercises,
    List<GetSessionDetailResponseModel>? details,
    String? message,
    Map<String?, List<GetSessionDetailResponseModel>>? detailsList,
    Map<String?, int>? exercisesCount,
    String? sessionId,
    DateTime? startTime,
    DateTime? endTime,
    List<GetSessionHistoryResponseModel>? history,
  }) = _SessionState;

  factory SessionState.initial() => SessionState(
        sessions: [],
        adminSessions: [],
        exercises: [],
        message: '',
      );
}
