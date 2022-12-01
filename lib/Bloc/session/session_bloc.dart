import 'package:bloc/bloc.dart';
import 'package:capstone_ui/Model/session_model.dart';
import 'package:capstone_ui/services/api_Session.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:capstone_ui/Model/getListExerciseByCate_model.dart';

part 'session_event.dart';
part 'session_state.dart';
part 'session_bloc.freezed.dart';

class SessionBloc extends Bloc<SessionEvent, SessionState> {
  List<Exericse>? tmpExercises;
  final SessionService _sessionService;
  List<CreateSessionRequestExercise> requestExercises = [];
  Map<String?, List<GetSessionDetailResponseModel>>? detailsList = {};
  Map<String?, int>? exercisesCount = {};
  //int? temp;
  // final List<GetSessionsResponseModel> list = [
  //   GetSessionsResponseModel(
  //     sessionId: "733fbb6d-318b-45a5-876f-523ba18be6d7",
  //     userId: "dbadb347-79c4-40cf-9f6d-a68a5a050fc9",
  //   ),
  // ];

  SessionBloc(this._sessionService) : super(SessionState.initial()) {
    on<_AddToSession>((event, emit) {
      tmpExercises = state.exercises;
      tmpExercises?.add(event.exericse);
      emit(state.copyWith(
        exercises: tmpExercises,
      ));
    });

    on<_CreateSessionRequested>((event, emit) async {
      final list = state.exercises;
      if (list != null) {
        for (var ex in list) {
          var reqEx = CreateSessionRequestExercise(exerciseId: ex.ExericseID);
          requestExercises.add(reqEx);
        }
      }
      CreateSessionRequestModel requestModel = CreateSessionRequestModel(
        userId: event.userId,
        sessionName: event.sessionName,
        startTime: DateTime.now(),
        endTime: DateTime.now(),
        exercises: requestExercises,
      );
      requestExercises = [];
      final result = await _sessionService.createSession(requestModel);
      if (result.isSuccess) {
        emit(state.copyWith(
          message: result.message,
          exercises: [],
        ));
      } else {
        emit(state.copyWith(
          message: "Create Session Failed",
        ));
      }
    });

    on<_GetSessionDetailRequested>(
      (event, emit) async {
        final list = await _sessionService.getSessionsDetail(event.sessionID);
        emit(state.copyWith(
          details: list,
          sessionId: event.sessionID,
        ));
      },
    );

    on<_GetSessionsByUserId>(
      (event, emit) async {
        final list = await _sessionService.getSessionsByUserId(event.userId!);
        // final sessionId = list[0].sessionId;
        // final details = await _sessionService.getSessionsDetail(sessionId);
        if (list != null) {
          for (var session in list) {
            var details =
                await _sessionService.getSessionsDetail(session.sessionId);
            //detailsList?.update(session.sessionId, (value) => details);
            detailsList?[session.sessionId] = details;
            exercisesCount?[session.sessionId] = details.length;
            //temp = exercisesCount![session.sessionId];
          }
        }
        emit(state.copyWith(
          sessions: list,
          detailsList: detailsList,
          exercisesCount: exercisesCount,
        ));
      },
    );

    on<_ShowSessionDetailRequested>(
      (event, emit) {},
    );

    on<_RemoveFromCreatingSession>(
      (event, emit) {
        tmpExercises = state.exercises;
        tmpExercises!.removeAt(event.index);
        emit(state.copyWith(
          exercises: tmpExercises,
        ));
      },
    );

    on<_StartSession>((event, emit) {
      final startTime = DateTime.now();
      emit(state.copyWith(
        startTime: startTime,
      ));
    });

    on<_EndSession>((event, emit) async {
      final endTime = DateTime.now();
      CreateSessionHistoryRequestModel requestModel =
          CreateSessionHistoryRequestModel(
        userId: event.userId,
        startTime: state.startTime!,
        endTime: endTime,
        sessionId: event.sessionId,
      );
      final result = await _sessionService.createSessionHistory(requestModel);
      if (result.isSuccess) {
        emit(state.copyWith(
          message: result.message,
        ));
      } else {
        emit(state.copyWith(
          message: "Create Session History Failed",
        ));
      }
    });

    on<_GetSessionHistory>(
      ((event, emit) async {
        final list = await _sessionService.getSessionHistory(event.userId);
        emit(
          state.copyWith(
            history: list,
          ),
        );
      }),
    );
  }
}
