import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../Model/getListRecordById_model.dart';
import '../../services/api_Record.dart';

part 'record_list_admin_event.dart';
part 'record_list_admin_state.dart';

class RecordAdminBloc extends Bloc<RecordAdminBlocEvent, RecordAdminBlocState> {
 final RecordService _recordService;
 
 
 
  RecordAdminBloc(this._recordService) : super(RecordAdminBlocInitial()) {
    on<LoadRecordAdminEvent>((event, emit) async {
      // TODO: implement event handler
      // RecordByIdReQuestModel recordByIdReQuestModel = RecordByIdReQuestModel(userId: userId)
      final list= await _recordService.getRecordByIdAdmin();
      emit(RecordLoadedAdminState(list));
      
    });
  }
}
