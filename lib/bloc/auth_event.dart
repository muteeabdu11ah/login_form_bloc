part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class AuthLoginrequested extends AuthEvent {
  final String Email;
  final String Password;

  AuthLoginrequested({required this.Email, required this.Password});
}

final class AuthLogOutRequested extends AuthEvent{}