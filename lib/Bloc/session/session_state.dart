part of 'session_bloc.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class SessionState with _$SessionState {
  const factory SessionState({
    required List<GetSessionsResponseModel> sessions,
    List<Exericse>? exercises,
    List<GetSessionDetailResponseModel>? details,
    String? message,
    Map<String?, List<GetSessionDetailResponseModel>>? detailsList,
    Map<String?, int>? exercisesCount,
    String? sessionId,
  }) = _SessionState;

  factory SessionState.initial() => SessionState(
        sessions: [],
        exercises: [],
        message: '',
      );
}
