//import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:capstone_ui/Model/login_model.dart';
import 'package:capstone_ui/services/api_login.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../Model/register_model.dart';
import '../../services/api_register.dart';

part 'authenticate_event.dart';
part 'authenticate_state.dart';
part 'authenticate_bloc.freezed.dart';

class AuthenticateBloc extends Bloc<AuthenticateEvent, AuthenticateState> {
  final UserService _userService;

  AuthenticateBloc(this._userService) : super(AuthenticateState.initial()) {
    on<_LoginRequested>((event, emit) async {
      LoginRequestModel reqModel = LoginRequestModel(
          phoneNumber: state.phoneNumber, password: state.password);
      LoginResponeModel result = await _userService.login(reqModel);
      if (result.phoneNumber != null && result.role != null) {
        emit(state.copyWith(
          userId: result.userId ?? '',
          phoneNumber: result.phoneNumber ?? '',
          role: result.role,
          fullName: result.fullName ?? '',
          isCheckLogin: false,
          isAuthenticated: true,
          relationshipWith: result.relationshipWith ?? '',
          errorMessage: "",
        ));
      } else {
        emit(state.copyWith(
          errorMessage: "Số điện thoại hoặc mật khẩu không chính xác",
          isCheckLogin: true,
        ));
      }
    });

    on<_RegistrationPatientRequested>((event, emit) async {
      RegisterRequestModel reqModel = RegisterRequestModel(
          phoneNumber: state.phoneNumberPatient,
          password: state.passwordPatient);
      final result = await _userService.loginPatient(reqModel);
      if (result.role != null && result.phoneNumber != null) {
        emit(state.copyWith(
          userId: result.userId ?? '',
          phoneNumber: result.phoneNumber ?? '',
          role: result.role,
          fullName: result.fullName ?? '',
          isRegisterPatient: true,
          errorMessage: '',
        ));
      } else {
        emit(state.copyWith(errorMessage: "Số điện thoại đã tồn tại"));
        debugPrint(state.phoneNumber);
      }
    });

    on<_fullNameChanged>((event, emit) {
      emit(state.copyWith(fullName: event.fullName));
    });

    on<_RegistrationSupporterRequested>((event, emit) async {
      RegisterRequestModel reqModel = RegisterRequestModel(
          phoneNumber: state.phoneNumberSupporter,
          password: state.passwordSupporter);
      final result = await _userService.loginSupporter(reqModel);
      if (result.role != null && result.phoneNumber != null) {
        emit(state.copyWith(
          userId: result.userId ?? '',
          phoneNumber: result.phoneNumber ?? '',
          role: result.role,
          fullName: result.fullName ?? '',
          isRegisterSupporter: true,
        ));
      } else {
        emit(state.copyWith(errorMessage: "Số điện thoại đã tồn tại"));
        debugPrint(state.phoneNumber);
      }
    });

    on<_ChangePasswordRequested>((event, emit) async {
      ForgotPasswordRequestModel reqModel = ForgotPasswordRequestModel(
          phoneNumber: event.phoneNumber, newPassword: event.newPassword);
      final result = await _userService.forgotPassword(reqModel);
      if (result.role != null && result.phoneNumber != null) {
        emit(state.copyWith(
          userId: result.userId ?? '',
          phoneNumber: result.phoneNumber ?? '',
          role: result.role,
          fullName: result.fullName ?? '',
          isChangedPassword: true,
        ));
      } else {
        emit(state.copyWith(errorMessage: "Đổi mật khẩu không thành công"));
        debugPrint(state.phoneNumber);
      }
    });

    on<_PhoneNumberChanged>((event, emit) {
      emit(state.copyWith(phoneNumber: event.phoneNumber));
    });
    on<_SetErrorMessageRequested>((event, emit) {
      emit(state.copyWith(errorMessage: ''));
    });
    on<_PasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password));
    });

    on<_PhoneNumberChangedPatient>((event, emit) {
      emit(state.copyWith(phoneNumberPatient: event.phoneNumber));
    });

    on<_PasswordChangedPatient>((event, emit) {
      emit(state.copyWith(passwordPatient: event.password));
    });

    on<_PhoneNumberChangedSupporter>((event, emit) {
      emit(state.copyWith(phoneNumberSupporter: event.phoneNumber));
    });

    on<_PasswordChangedSupporter>((event, emit) {
      emit(state.copyWith(passwordSupporter: event.password));
    });
    on<_UpdateRelationshipwith>((event, emit) {
      emit(state.copyWith(relationshipWith: event.relationsipwith));
    });
    on<_AuthCheckRequested>((event, emit) {
      emit(state.copyWith(isAuthenticated: _userService.isUserAuthenticated()));
    });

    on<_LogoutRequested>((event, emit) {
      emit(state.copyWith(
          isAuthenticated: _userService.Logout(),
          isRegisterPatient: false,
          isRegisterSupporter: false));
    });

    on<_checkRegisterPatientRequested>((event, emit) {
      emit(state.copyWith(isRegisterPatient: _userService.isRegisterPatient()));
    });
    on<_checkRegisterSupporterRequested>((event, emit) {
      emit(state.copyWith(
          isRegisterSupporter: _userService.isRegisterSupporter()));
    });
    on<_setCheckRegisterPatientFalseRequested>((event, emit) {
      emit(state.copyWith(isRegisterPatient: false));
    });
    on<_setCheckRegisterSupporterFalseRequested>((event, emit) {
      emit(state.copyWith(isRegisterSupporter: false));
    });
    on<_CheckLoginRequested>((event, emit) {
      emit(state.copyWith(isCheckLogin: _userService.isLogin()));
    });

    on<_CheckLoginFalseRequested>((event, emit) {
      emit(state.copyWith(isCheckLogin: false));
    });
    on<_SetCheckFalseChangedPassword>((event, emit) {
      emit(state.copyWith(isChangedPassword: false));
    });
  }
}
