import 'package:bloc/bloc.dart';
import 'package:capstone_ui/Model/createRecord_model.dart';
import 'package:capstone_ui/Model/getListCategory_model.dart';
import 'package:capstone_ui/Model/getListRecordById_model.dart';
import 'package:capstone_ui/services/api_Record.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'record_event.dart';
part 'record_state.dart';

class RecordBlocBloc extends Bloc<RecordBlocEvent, RecordBlocState> {
 final RecordService _recordService;
 
 
 
  RecordBlocBloc(this._recordService) : super(RecordBlocInitial()) {
    on<LoadRecordEvent>((event, emit) async {
      // TODO: implement event handler

      final list= await _recordService.getRecordById();
      emit(RecordLoadedState(list));
      
    });

    // on<LoadRecordEvent>((event, emit) async {
    //   CreateRecordQuestModel reqModel = CreateRecordQuestModel(recordId: state.
    //       recordName: state., linkAudio: state.);
    //   final result = await _recordService.createRecord(reqModel);
    //       success: result.success,
    //       message: result.message ?? '',
    //       isAuthenticated: true,
    //     ));
    // });

  //   on<_PhoneNumberChanged>((event, emit) {
  //     emit(state.copyWith(: event.phoneNumber));
  //   });
  // }
  }
}
