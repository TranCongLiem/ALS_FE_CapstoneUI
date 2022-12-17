part of 'session_bloc.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class SessionEvent with _$SessionEvent {
  const factory SessionEvent.addToSession(Exericse exericse) = _AddToSession;
  const factory SessionEvent.createSessionRequested(
      String? userId, String sessionName) = _CreateSessionRequested;
  const factory SessionEvent.showCreatingSessionRequested() =
      _ShowCreatingSessionRequested;
  const factory SessionEvent.showSessionDetailRequested() =
      _ShowSessionDetailRequested;
  const factory SessionEvent.getSessionDetailRequested(String? sessionID) =
      _GetSessionDetailRequested;
  const factory SessionEvent.getSessionsByUserId(String? userId) =
      _GetSessionsByUserId;
  const factory SessionEvent.getSessionsByAdmin() = _GetSessionsByAdmin;
  const factory SessionEvent.removeFromCreatingSession(int index) =
      _RemoveFromCreatingSession;
  const factory SessionEvent.startSession() = _StartSession;
  const factory SessionEvent.endSession(
          List<CreateSessionRequestExercise> exercises, String userId) =
      _EndSession;
  const factory SessionEvent.getSessionHistory(String userId) =
      _GetSessionHistory;
  const factory SessionEvent.endExerciseWorkout(
      Exericse exericse, String? userId) = _EndExerciseWorkout;
}
