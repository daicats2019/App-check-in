import 'dart:async';

import 'package:app_check_in/model/aciviity_today_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../service/activity_service.dart';

part 'checktime_event.dart';
part 'checktime_state.dart';

class ChecktimeBloc extends Bloc<ChecktimeEvent, ChecktimeState> {
  ChecktimeBloc() : super(ChecktimeInitial()) {
    on<ChecktimeEvent>((event, emit) {
      // TODO: implement event handler
    });



    on<ActivityEvent>((event, emit) async {
      // TODO: implement event handler
      final result = await ActivityService.checkActivityToday(event.token);
      print('CHECKTIMEOKOKOK1${result}');
      if (result != null) {
        print('EMITOKOK');
        emit(CheckTimeSucces(result));
      }

    });

  }
}
