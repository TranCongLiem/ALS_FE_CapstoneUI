part of 'authenticate_bloc.dart';

@freezed
class AuthenticateEvent with _$AuthenticateEvent {
  const factory AuthenticateEvent.phoneNumberChanged(String phoneNumber) =
      _PhoneNumberChanged;
  const factory AuthenticateEvent.passwordChanged(String password) =
      _PasswordChanged;
  const factory AuthenticateEvent.loginRequested() = _LoginRequested;
  const factory AuthenticateEvent.registrationRequested() =
      _RegistrationRequested;
  const factory AuthenticateEvent.authCheckRequested() = _AuthCheckRequested;
  const factory AuthenticateEvent.Logout() = _LogoutRequested;

}
