part of 'user_bloc.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.updateProfilePatientRequest(String userId) = _UpdateProfilePatientRequest;
  const factory UserEvent.getProfileUserByIdRequest() = _GetProfileUserByIdRequest;
  const factory UserEvent.getFullName(String fullName) = _GetFullName;
  const factory UserEvent.getAddress(String address) = _GetAddress;
  const factory UserEvent.updateProfilePatientCheckRequested() = _UpdateProfilePatientCheckRequested;
  const factory UserEvent.setStateFlase() = _SetStateFlase;
}