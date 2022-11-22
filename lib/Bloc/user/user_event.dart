part of 'user_bloc.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.updateProfilePatientRequest(String userId) =
      _UpdateProfilePatientRequest;
  const factory UserEvent.updateInformationPatientRequest(String userId) =
      _UpdateInformationPatientRequest;
  const factory UserEvent.updateInformationSupporterRequest(String userId) =
      _UpdateInformationSupporterRequest;
  const factory UserEvent.getProfileUserByIdRequest() =
      _GetProfileUserByIdRequest;
  const factory UserEvent.getFullName(String fullName) = _GetFullName;
  const factory UserEvent.getAddress(String address) = _GetAddress;
  const factory UserEvent.getImageUser(String imageUser) = _GetImageUser;
  const factory UserEvent.getcondition(String condition) = _Getcondition;
  const factory UserEvent.getcause(String cause) = _Getcause;
  const factory UserEvent.getdateOfBirth(String dateOfBirth) = _GetdateOfBirth;
  const factory UserEvent.updateProfilePatientCheckRequested() =
      _UpdateProfilePatientCheckRequested;
  const factory UserEvent.updateInformationPatientCheckRequested() =
      _UpdateInformationPatientCheckRequested;
  const factory UserEvent.updateInformationSupporterCheckRequested() =
      _UpdateInformationSupporterCheckRequested;
  const factory UserEvent.setStateFlase() = _SetStateFlase;
  const factory UserEvent.setStateFlaseInformationPatient() =
      _SetStateFlaseInformationPatient;
  const factory UserEvent.setStateFlaseInformationSupporter() =
      _SetStateFlaseInformationSupporter;
}
