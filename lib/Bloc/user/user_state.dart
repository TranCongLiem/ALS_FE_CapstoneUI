part of 'user_bloc.dart';

@freezed
@immutable
class UserState with _$UserState {
  const factory UserState({
    required String userId,
    required String fullName,
    required String address,
    required bool isUpdatedProfilePatient,
    String? errorMessage,
    bool? success,
    String? message,
  }) = _UserState;

  factory UserState.initial() => UserState(
        userId: '',
        fullName: '',
        address: '',
        isUpdatedProfilePatient: false,
      );
}
