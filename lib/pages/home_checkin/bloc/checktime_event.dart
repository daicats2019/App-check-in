part of 'checktime_bloc.dart';

@immutable
abstract class ChecktimeEvent {}

class ActivityEvent extends ChecktimeEvent {
  final String token;

  ActivityEvent({required this.token});
}