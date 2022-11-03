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
      // RecordByIdReQuestModel recordByIdReQuestModel = RecordByIdReQuestModel(userId: userId)
      final list= await _recordService.getRecordById();
      emit(RecordLoadedState(list));
    });
    // on<LoadRecordEventByAdmin>((event, emit) async {
    //   // TODO: implement event handler
    //   // RecordByIdReQuestModel recordByIdReQuestModel = RecordByIdReQuestModel(userId: userId)
    //   final list= await _recordService.getRecordByIdAdmin();
    //   emit(RecordLoadedState(list));
    // });
    
}
}
