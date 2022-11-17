part of 'authenticate_bloc.dart';

@freezed
@immutable
class AuthenticateState with _$AuthenticateState {
  const factory AuthenticateState({
    required String? userId,
    required String phoneNumber,
    required String password,
    required bool isAuthenticated,
    String? role,
    String? errorMessage,
  }) = _AuthenticateState;

  factory AuthenticateState.initial() => AuthenticateState(
        userId: '',
        phoneNumber: '',
        password: '',
        isAuthenticated: false,
      );
}

// class AuthenticateInitial extends AuthenticateState {}

// class Authenticated extends AuthenticateState {}

// class Unauthenticated extends AuthenticateState {}
