import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../service/login_service.dart';

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
          emit(AuthLoginSuccess());
        } else {
          emit(AuthLoginFailure());
        }
      },
    );
  }
}
