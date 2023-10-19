part of 'user_bloc.dart';

@immutable
abstract class UserState {
  List<UserModel> dataList;

  UserState(this.dataList);
}

class UserInitial extends UserState {
  UserInitial(super.dataList);
}

class UserLoading extends UserInitial{
  UserLoading(super.dataList);
}

class UserDataChangedSuccess extends UserInitial {
  UserDataChangedSuccess(super.dataList);
}