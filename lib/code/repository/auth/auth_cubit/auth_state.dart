part of 'auth_cubit.dart';

class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthAuthenticated extends AuthState {
  final AuthModel user;

  AuthAuthenticated(this.user);
}

class AuthError extends AuthState {
  final String message;

  AuthError(this.message);
}

class UserDataLoaded extends AuthState {
  final List<Map<String, dynamic>> userData;

  UserDataLoaded(this.userData);
}
