import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../Model/removeRecord_model.dart';
import '../../services/api_Record.dart';

part 'remove_record_event.dart';
part 'remove_record_state.dart';
part 'remove_record_bloc.freezed.dart';

class RemoveRecordBloc extends Bloc<RemoveRecordEvent, RemoveRecordState> {
  final RecordService _recordService;
  RemoveRecordBloc(this._recordService) : super(RemoveRecordState.initial()) {
    on<_RemoveRecordRequest>((event, emit) async {
      RemoveRecordByIdRequestModel reqModel = RemoveRecordByIdRequestModel(
        recordId: state.recordId);
      final result = await _recordService.deleteRecord(reqModel);
      print('Tan18' + reqModel.recordId );
      if (result.message != null && result.success != null) {
        emit(state.copyWith(
          message: result.message ?? '',
          success: result.success,
          isRemoved: true,
        ));
      } else {
        emit(state.copyWith(errorMessage: ""));
      }
    });

    on<_GetRecordId>((event, emit) {
      emit(state.copyWith(recordId: event.recordId));
    });

    on<_RemoveCheckRequested>((event, emit) {
      emit(state.copyWith(isRemoved: _recordService.isRemoved()));
    });

    on<_SetStateFlase>((event, emit) {
        emit(state.copyWith(
          isRemoved: false,
        ));
    });
  }
}
