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
      UpdateProfilePatientRequestModel reqModel =
          UpdateProfilePatientRequestModel(
              userId: event.userId,
              address: state.address,
              fullName: state.fullName);
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

    on<_UpdateInformationPatientRequest>((event, emit) async {
      UpdateInformationPatientRequestModel reqModel =
          UpdateInformationPatientRequestModel(
              userId: event.userId,
              address: state.address,
              fullName: state.fullName,
              imageUser: state.imageUser,
              cause: "String",
              condition: state.condition,
              dateOfBirth: state.dateOfBirth);
      final result = await _userService.updateInformationPatient(reqModel);
      if (result.message != null && result.success != null) {
        emit(state.copyWith(
          message: result.message ?? '',
          success: result.success,
          isUpdatedInformationPatient: true,
        ));
      } else {
        emit(state.copyWith(errorMessage: ""));
      }
    });

    on<_GetProfileUserByIdRequest>((event, emit) async {
      GetProfileUserByIdRequestModel reqModel = GetProfileUserByIdRequestModel(
          userId: event.userId);
      final result = await _userService.getProfileUserById(reqModel);
      if (result != null) {
        emit(state.copyWith(
          fullName: result.fullName ?? '',
          address: result.address ?? '',
          imageUser: result.imageUser ?? ''
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
      emit(state.copyWith(
          isUpdatedProfilePatient: _userService.isUpdatedProfilePatient()));
    });

    on<_SetStateFlase>((event, emit) {
      emit(state.copyWith(
        isUpdatedProfilePatient: false,
      ));
    });

    on<_GetImageUser>((event, emit) {
      emit(state.copyWith(imageUser: event.imageUser));
    });

    on<_Getcondition>((event, emit) {
      emit(state.copyWith(condition: event.condition));
    });

    on<_GetdateOfBirth>((event, emit) {
      emit(state.copyWith(dateOfBirth: event.dateOfBirth));
    });

    on<_UpdateInformationPatientCheckRequested>((event, emit) {
      emit(state.copyWith(
          isUpdatedInformationPatient:
              _userService.isUpdatedInformationPatient()));
    });

    on<_SetStateFlaseInformationPatient>((event, emit) {
      emit(state.copyWith(
        isUpdatedInformationPatient: false,
      ));
    });
  }
}
