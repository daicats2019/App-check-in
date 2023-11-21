import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../model/aciviity_today_model.dart';
import '../../../service/activity_action_service.dart';
import '../../../service/activity_service.dart';
import '../../../service/login_service.dart';
import '../../../service/user_service.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<AuthLoginEvent>(
      (event, emit) async {
        //xử lý logic cho event AuthLogin
        final result = await LoginService.login(event.userName, event.password);

        //sau khi xử lý logic xong thì phát động một state mới.
        if (result != null) {
          emit(AuthLoginSuccess(result));
        } else {
          emit(AuthLoginFailure());
        }
      },
    );

    on<ActivityTodayEvent>(
      (event, emit) async {
        //xử lý logic cho event AuthLogin
        final result = await ActivityService.checkActivityToday(event.token);
          print('${result} OKKOKOKOKOKOK');

        //sau khi xử lý logic xong thì phát động một state mới.
        if (result != null) {
          if (result.status == 'Available') {
            emit(NotCheckIn());
          } else if (result.status == 'CheckedIn') {
            emit(CheckedIn(result));
          } else if (result.status == 'CheckedOut') {
            emit(CheckedIn(result));
          } else if (result.status == 'CheckedInLate') {
            emit(CheckedIn(result));
          } else if (result.status == 'CheckedOutEarly') {
            emit(CheckedIn(result));
          }
        } else {
          emit(NotCheckIn());
        }
      },
    );


    on<ActivityAcrionEvent>(
          (event, emit) async {
        //xử lý logic cho event AuthLogin
        final result = await ActivityActionService.checkActivityAction(event.isCheckIn, event.token);

        //sau khi xử lý logic xong thì phát động một state mới.
        if (result != null) {
           emit(CheckInSucces());
        } else {
          emit(NotCheckIn());
        }
      },
    );
  }
}
