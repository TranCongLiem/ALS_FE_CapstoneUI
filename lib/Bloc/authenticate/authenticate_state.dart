part of 'authenticate_bloc.dart';

@freezed
@immutable
class AuthenticateState with _$AuthenticateState {
  const factory AuthenticateState({
    required String userId,
    required String phoneNumber,
    required String password,
    required String phoneNumberPatient,
    required String passwordPatient,
    required String phoneNumberSupporter,
    required String passwordSupporter,
    required String phoneNumberChangePassword,
    required String passwordChanged,
    required String fullName,
    required bool isAuthenticated,
    required String relationshipWith,
    required bool isRegisterPatient,
    required bool isRegisterSupporter,
    required bool isCheckLogin,
    required bool isChangedPassword,
    String? role,
    String? errorMessage,
  }) = _AuthenticateState;

  factory AuthenticateState.initial() => AuthenticateState(
        userId: '',
        phoneNumber: '',
        password: '',
        fullName: '',
        isRegisterPatient: false,
        isRegisterSupporter: false,
        phoneNumberPatient: '',
        passwordPatient: '',
        phoneNumberSupporter: '',
        passwordSupporter: '',
        phoneNumberChangePassword: '',
        passwordChanged: '',
        isAuthenticated: false,
        relationshipWith: '',
        isCheckLogin: false,
        isChangedPassword: false,
      );

  factory AuthenticateState.Logout() => AuthenticateState(
        userId: '',
        phoneNumber: '',
        password: '',
        fullName: '',
        isRegisterPatient: false,
        isRegisterSupporter: false,
        phoneNumberPatient: '',
        passwordPatient: '',
        phoneNumberSupporter: '',
        passwordSupporter: '',
        phoneNumberChangePassword: '',
        passwordChanged: '',
        isAuthenticated: false,
        relationshipWith: '',
        isCheckLogin: false,
        isChangedPassword: false,
      );
}

// class AuthenticateInitial extends AuthenticateState {}

// class Authenticated extends AuthenticateState {}

// class Unauthenticated extends AuthenticateState {}
