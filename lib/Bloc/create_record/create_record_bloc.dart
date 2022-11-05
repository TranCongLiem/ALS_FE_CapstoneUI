import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:capstone_ui/Model/createRecord_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../services/api_Record.dart';

part 'create_record_event.dart';
part 'create_record_state.dart';
part 'create_record_bloc.freezed.dart';

class CreateRecordBloc extends Bloc<CreateRecordEvent, CreateRecordState> {
  final RecordService _recordService;

  CreateRecordBloc(this._recordService) : super(CreateRecordState.initial()) {
    on<_CreateRecordRequest>((event, emit) async {
      CreateRecordReQuestModel reqModel = CreateRecordReQuestModel(
          userId: event.userId,
          recordName: state.recordName,
          linkAudio: state.linkAudio);
      final result = await _recordService.createRecord(reqModel);
      if (result.message != null && result.success != null) {
        emit(state.copyWith(
          message: result.message ?? '',
          success: result.success,
          isCreated: true,
        ));
      } else {
        emit(state.copyWith(errorMessage: "  "));
      }
    });

    on<_RecordNameChanged>((event, emit) {
      emit(state.copyWith(recordName: event.recordName));
    });

    on<_LinkAudioChanged>((event, emit) {
      emit(state.copyWith(linkAudio: event.linkAudio));
    });

    on<_CreateCheckRequested>((event, emit) {
      emit(state.copyWith(isCreated: _recordService.isCreated()));
    });

    on<_SetStateFlase>((event, emit) {
        emit(state.copyWith(
          isCreated: false,
        ));
    });
  }
}
