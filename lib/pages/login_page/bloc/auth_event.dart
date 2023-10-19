part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class AuthLoginEvent extends AuthEvent{
  final String userName;
  final String password;

  AuthLoginEvent({required this.userName, required this.password});
}
