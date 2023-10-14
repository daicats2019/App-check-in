part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class UserDataFetched extends UserEvent{}

class UserDataUpdate extends UserEvent{
  final UserModel dataToUpdate;

  UserDataUpdate({required this.dataToUpdate});
}

class UserDataDelete extends UserEvent{
  final UserModel dataToDeleted;

  UserDataDelete({required this.dataToDeleted});
}

class UserDataAdded extends UserEvent{
  final UserModel dataToAdded;

  UserDataAdded({required this.dataToAdded});
}

class UserDataRefresh extends UserEvent{}