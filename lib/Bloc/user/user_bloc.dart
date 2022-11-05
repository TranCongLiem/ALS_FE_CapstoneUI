import 'package:bloc/bloc.dart';
import 'package:capstone_ui/Model/getProfileUser_model.dart';
import 'package:capstone_ui/Model/updateProfilePatient_model.dart';
import 'package:capstone_ui/services/api_User.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_event.dart';
part 'user_state.dart';
part 'user_bloc.freezed.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserPatientService _userService;
  UserBloc(this._userService) : super(UserState.initial()) {
    on<_UpdateProfilePatientRequest>((event, emit) async {
      UpdateProfilePatientRequestModel reqModel = UpdateProfilePatientRequestModel(
        userId: event.userId,address: state.address,fullName: state.fullName);
      final result = await _userService.updateProfilePatient(reqModel);
      if (result.message != null && result.success != null) {
        emit(state.copyWith(
          message: result.message ?? '',
          success: result.success,
          isUpdatedProfilePatient: true,
        ));
      } else {
        emit(state.copyWith(errorMessage: ""));
      }
    });

    on<_GetProfileUserByIdRequest>((event, emit) async {
      GetProfileUserByIdRequestModel reqModel = GetProfileUserByIdRequestModel(
        userId: '43b6fcf9-b69b-40b0-93ab-87092eb25715');
      final result = await _userService.getProfileUserById(reqModel);
      if (result != null) {
        emit(state.copyWith(
          fullName: result.fullName ?? '',
          address: result.address ?? '',
        ));
      } else {
        emit(state.copyWith(errorMessage: ""));
      }
    });

    on<_GetFullName>((event, emit) {
      emit(state.copyWith(fullName: event.fullName));
    });

    on<_GetAddress>((event, emit) {
      emit(state.copyWith(address: event.address));
    });

    on<_UpdateProfilePatientCheckRequested>((event, emit) {
      emit(state.copyWith(isUpdatedProfilePatient: _userService.isUpdatedProfilePatient()));
    });

    on<_SetStateFlase>((event, emit) {
        emit(state.copyWith(
          isUpdatedProfilePatient: false,
        ));
    });

  }
}
