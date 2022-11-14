import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../Model/getProfileUser_model.dart';
import '../../services/api_User.dart';

part 'user_detail_event.dart';
part 'user_detail_state.dart';

class GetDetailBloc extends Bloc<GetDeatailBlocEvent, GetDeatailBlocState> {
 final UserPatientService _userPatientService;
 
 
 
  GetDetailBloc(this._userPatientService) : super(GetDetailBlocInitial()) {
    on<LoadDetailUserEvent>((event, emit) async {
       GetProfileUserByIdRequestModel getProfileUserByIdRequestModel = GetProfileUserByIdRequestModel(userId: event.userId);
      GetProfileUserByIdResponeModel getProfileUserByIdResponeModel = await _userPatientService.getProfileUserById(getProfileUserByIdRequestModel);
      emit(GetDetailLoadedState(getProfileUserByIdResponeModel));
    });
}
}
