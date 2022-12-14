import 'package:bloc/bloc.dart';
import 'package:capstone_ui/Model/getProfileUser_model.dart';
import 'package:capstone_ui/Model/updateProfilePatient_model.dart';
import 'package:capstone_ui/services/api_User.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../Model/updateProfileSupporter_model.dart';

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
              fullName: state.fullName,
              imageUser: state.imageUser);
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

    on<_UpdateProfileSupporterRequest>((event, emit) async {
      UpdateProfileSupporterRequestModel reqModel =
          UpdateProfileSupporterRequestModel(
              userId: event.userId,
              address: state.address,
              fullName: state.fullName,
              imageUser: state.imageUser);
      final result = await _userService.updateProfileSupporter(reqModel);
      if (result.message != null && result.success != null) {
        emit(state.copyWith(
          message: result.message ?? '',
          success: result.success,
          isUpdatedProfileSupporter: true,
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

    on<_UpdateInformationSupporterRequest>((event, emit) async {
      UpdateInformationSupporterRequestModel reqModel =
          UpdateInformationSupporterRequestModel(
        userId: event.userId,
        fullName: state.fullName,
        address: state.address,
        imageUser: state.imageUser,
      );
      final result = await _userService.updateInformationSupporter(reqModel);
      if (result.message != null && result.success != null) {
        emit(state.copyWith(
          message: result.message ?? '',
          success: result.success,
          isUpdatedInformationSupporter: true,
        ));
      } else {
        emit(state.copyWith(errorMessage: ""));
      }
    });

    on<_CheckPhonedExistInSystem>((event, emit) async {
      GetPhoneRequestModel reqModel = GetPhoneRequestModel(
        phoneNumber: event.phone,
      );
      final result = await _userService.checkPhoneNumber(reqModel);
      if (result.success == false) {
        emit(state.copyWith(
          message: result.message ?? '',
          success: result.success,
          isCheckedPhoneNumber: true,
        ));
      } else {
        emit(state.copyWith(
          errorMessage: "",
          isCheckedSentOTP: true,
        ));
      }
    });

    on<_GetProfileUserByIdRequest>((event, emit) async {
      GetProfileUserByIdRequestModel reqModel =
          GetProfileUserByIdRequestModel(userId: event.userId);
      final result = await _userService.getProfileUserById(reqModel);
      if (result != null) {
        emit(state.copyWith(
            fullName: result.fullName ?? '',
            address: result.address ?? '',
            imageUser: result.imageUser ?? ''));
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

    on<_SetStateFlaseInformationPatient>((event, emit) {
      emit(state.copyWith(isUpdatedInformationPatient: false));
    });

    on<_SetStateFlaseInformationSupporter>((event, emit) {
      emit(state.copyWith(isUpdatedInformationSupporter: false));
    });
    on<_SetStateFlaseCheckdPhone>((event, emit) {
      emit(state.copyWith(isCheckedPhoneNumber: false));
    });
    on<_SetStateFlaseCheckedSentOTP>((event, emit) {
      emit(state.copyWith(isCheckedSentOTP: false));
    });
  }
}
