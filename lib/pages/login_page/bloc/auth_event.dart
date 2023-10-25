part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class AuthLoginEvent extends AuthEvent{
  final String userName;
  final String password;

  AuthLoginEvent({required this.userName, required this.password});
}

class ActivityTodayEvent extends AuthEvent{
  final String token;

  ActivityTodayEvent({required this.token});
}

class ActivityAcrionEvent extends AuthEvent{
  final String? token;
  final String? action;
  final Bool is_check_in;

  ActivityAcrionEvent({this.action,required this.is_check_in, required this.token});
}
