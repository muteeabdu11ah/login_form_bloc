part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthSucess extends AuthState {
  final String uid;

  AuthSucess({required this.uid});
}

final class AuthFailure extends AuthState {
  final String error;

  AuthFailure({required this.error});
}
