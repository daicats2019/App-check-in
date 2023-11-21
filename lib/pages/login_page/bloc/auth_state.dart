part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoginSuccess extends AuthState{
  final String token;
  AuthLoginSuccess( this.token);
}

class AuthLoginFailure extends AuthState{}

class CheckedIn extends AuthState{
  final ActivityModelToday data;
  CheckedIn( this.data);
}

class NotCheckIn extends AuthState {
}

class CheckInLate extends AuthState {
  final ActivityModelToday data;
  CheckInLate(this.data);
}

class CheckInEarly extends AuthState {
  final ActivityModelToday data;
  CheckInEarly(this.data);
}

class CheckInSucces extends AuthState {

}