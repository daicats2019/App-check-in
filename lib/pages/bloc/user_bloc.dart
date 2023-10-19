import 'package:app_check_in/model/user_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../untils/service.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial(<UserModel>[])) {
    on<UserDataFetched>(_onDataFetched);
  }

  _onDataFetched(UserDataFetched event, Emitter<UserState> emit) async {
    emit(UserLoading(state.dataList));
    var dataFromServer = await UserService.getDataUserServer();
    emit(UserDataChangedSuccess(dataFromServer));
  }
}
