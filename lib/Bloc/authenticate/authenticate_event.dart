part of 'authenticate_bloc.dart';

@freezed
class AuthenticateEvent with _$AuthenticateEvent {
  const factory AuthenticateEvent.phoneNumberChanged(String phoneNumber) =
      _PhoneNumberChanged;
  const factory AuthenticateEvent.passwordChanged(String password) =
      _PasswordChanged;
  const factory AuthenticateEvent.loginRequested() = _LoginRequested;
  const factory AuthenticateEvent.registrationPatientRequested(
      String phoneNumber, String password) = _RegistrationPatientRequested;
  const factory AuthenticateEvent.registrationSupporterRequested(
      String phoneNumber, String password) = _RegistrationSupporterRequested;
  const factory AuthenticateEvent.authCheckRequested() = _AuthCheckRequested;

  const factory AuthenticateEvent.Logout() = _LogoutRequested;


  const factory AuthenticateEvent.checkRegisterPatientRequested() =
      _checkRegisterPatientRequested;
  const factory AuthenticateEvent.checkRegisterSupporterRequested() =
      _checkRegisterSupporterRequested;

  const factory AuthenticateEvent.setCheckRegisterPatientFalseRequested() =
      _setCheckRegisterPatientFalseRequested;
  const factory AuthenticateEvent.setCheckRegisterSupporterFalseRequested() =
      _setCheckRegisterSupporterFalseRequested;
  const factory AuthenticateEvent.phoneNumberChangedPatient(
      String phoneNumber) = _PhoneNumberChangedPatient;
  const factory AuthenticateEvent.passwordChangedPatient(String password) =
      _PasswordChangedPatient;
  const factory AuthenticateEvent.phoneNumberChangedSupporter(
      String phoneNumber) = _PhoneNumberChangedSupporter;
  const factory AuthenticateEvent.passwordChangedSupporter(String password) =
      _PasswordChangedSupporter;

}
