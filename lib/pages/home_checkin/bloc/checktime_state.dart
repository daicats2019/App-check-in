part of 'checktime_bloc.dart';

@immutable
abstract class ChecktimeState {}

class ChecktimeInitial extends ChecktimeState {}

class CheckTimeSucces extends ChecktimeState {
  final ActivityModelToday data;
  CheckTimeSucces(this.data);
}