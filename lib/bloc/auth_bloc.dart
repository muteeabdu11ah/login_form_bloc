import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginrequested>((event, emit) async {
      try {
        final email = event.Email;
        final password = event.Password;
        final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

        if (!emailRegExp.hasMatch(email)) {
          return emit(AuthFailure(error: 'Invalid email address'));
        }
        if (password.length < 6) {
          return emit(
              AuthFailure(error: 'Password can,t be less than 6 characters'));
        }

        await Future.delayed(const Duration(seconds: 1));
        () {
          emit(AuthSucess(uid: '$email-$password'));
        };
      } on Exception catch (e) {
        return emit(AuthFailure(error: e.toString()));
      }
    });
  }
}
