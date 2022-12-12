part of 'user_bloc.dart';

@freezed
@immutable
class UserState with _$UserState {
  const factory UserState({
    required String userId,
    required String fullName,
    required String address,
    required String imageUser,
    required String condition,
    required String cause,
    required String dateOfBirth,
    required bool isUpdatedProfilePatient,
    required bool isUpdatedProfileSupporter,
    required bool isUpdatedInformationPatient,
    required bool isUpdatedInformationSupporter,
    required bool isCheckedPhoneNumber,
    required bool isCheckedSentOTP,
    String? errorMessage,
    bool? success,
    String? message,
  }) = _UserState;

  factory UserState.initial() => UserState(
        userId: '',
        fullName: '',
        address: '',
        imageUser: '',
        condition: '',
        cause: '',
        dateOfBirth: '',
        isUpdatedProfilePatient: false,
        isUpdatedInformationPatient: false,
        isUpdatedInformationSupporter: false,
        isUpdatedProfileSupporter: false,
        isCheckedPhoneNumber: false,
        isCheckedSentOTP: false,
      );
}
