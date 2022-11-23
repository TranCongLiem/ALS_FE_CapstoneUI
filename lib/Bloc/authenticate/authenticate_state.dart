part of 'authenticate_bloc.dart';

@freezed
@immutable
class AuthenticateState with _$AuthenticateState {
  const factory AuthenticateState({
    required String userId,
    required String phoneNumber,
    required String password,
    required String fullName,
    required bool isAuthenticated,
    required String relationshipWith,
    String? role,
    String? errorMessage,
  }) = _AuthenticateState;

  factory AuthenticateState.initial() => AuthenticateState(
        userId: '',
        phoneNumber: '',
        password: '',
        fullName: '',
        isAuthenticated: false,
        relationshipWith: '',
      );


      factory AuthenticateState.Logout() => AuthenticateState(
        userId: '',
        phoneNumber: '',
        password: '',
        fullName: '',
        isAuthenticated: false,
        relationshipWith: '',
      );
}

// class AuthenticateInitial extends AuthenticateState {}

// class Authenticated extends AuthenticateState {}

// class Unauthenticated extends AuthenticateState {}
