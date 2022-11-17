//import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:capstone_ui/Model/login_model.dart';
import 'package:capstone_ui/services/api_login.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'authenticate_event.dart';
part 'authenticate_state.dart';
part 'authenticate_bloc.freezed.dart';

class AuthenticateBloc extends Bloc<AuthenticateEvent, AuthenticateState> {
  final UserService _userService;

  AuthenticateBloc(this._userService) : super(AuthenticateState.initial()) {
    on<_LoginRequested>((event, emit) async {
      LoginRequestModel reqModel = LoginRequestModel(
          phoneNumber: state.phoneNumber, password: state.password);
      final result = await _userService.login(reqModel);
      if (result.role != null && result.phoneNumber != null) {
        emit(state.copyWith(
          userId: result.userId,
          phoneNumber: result.phoneNumber ?? '',
          role: result.role,
          isAuthenticated: true,
        ));
      } else {
        emit(state.copyWith(errorMessage: "Invalid Phone Number or Password"));
        debugPrint(state.phoneNumber);
      }
    });

    on<_PhoneNumberChanged>((event, emit) {
      emit(state.copyWith(phoneNumber: event.phoneNumber));
    });

    on<_PasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password));
    });

    on<_AuthCheckRequested>((event, emit) {
      emit(state.copyWith(isAuthenticated: _userService.isUserAuthenticated()));
    });
  }
}
