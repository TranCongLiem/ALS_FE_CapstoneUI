part of 'user_bloc.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.updateProfilePatientRequest(String userId) =
      _UpdateProfilePatientRequest;
  const factory UserEvent.updateProfileSupporterRequest(String userId) =
      _UpdateProfileSupporterRequest;
  const factory UserEvent.updateInformationPatientRequest(String userId) =
      _UpdateInformationPatientRequest;
  const factory UserEvent.getProfileUserByIdRequest(String userId) =
      _GetProfileUserByIdRequest;
  const factory UserEvent.checkPhonedExistInSystem(String phone) =
      _CheckPhonedExistInSystem;
  const factory UserEvent.updateInformationSupporterRequest(String userId) =
      _UpdateInformationSupporterRequest;
  // const factory UserEvent.getProfileUserByIdRequest() =
  //     _GetProfileUserByIdRequest;

  const factory UserEvent.getFullName(String fullName) = _GetFullName;
  const factory UserEvent.getAddress(String address) = _GetAddress;
  const factory UserEvent.getImageUser(String imageUser) = _GetImageUser;
  const factory UserEvent.getcondition(String condition) = _Getcondition;
  const factory UserEvent.getcause(String cause) = _Getcause;
  const factory UserEvent.getdateOfBirth(String dateOfBirth) = _GetdateOfBirth;
  const factory UserEvent.setStateFlase() = _SetStateFlase;
  const factory UserEvent.setStateFlaseSupporter() = _SetStateFlaseSupporter;
  const factory UserEvent.setStateFlaseInformationPatient() =
      _SetStateFlaseInformationPatient;
  const factory UserEvent.setStateFlaseInformationSupporter() =
      _SetStateFlaseInformationSupporter;

  const factory UserEvent.setStateFlaseCheckedPhone() =
      _SetStateFlaseCheckdPhone;
  const factory UserEvent.setStateFlaseCheckedSentOTP() =
      _SetStateFlaseCheckedSentOTP;
}
