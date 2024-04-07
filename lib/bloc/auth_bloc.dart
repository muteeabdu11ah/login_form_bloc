import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginrequested>(
_onAuthloginRequest
    );

    on<AuthLogOutRequested>(_AuthLogoutRequested);
  }

  void _onAuthloginRequest (AuthLoginrequested event,Emitter<AuthState> emit) async {
      emit(AuthLoading());
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

        return emit(AuthSucess(uid: '$email-$password'));
      } on Exception catch (e) {
        return emit(AuthFailure(error: e.toString()));
      }
    }


    void _AuthLogoutRequested (AuthLogOutRequested event,Emitter<AuthState> emit) async {
      emit(AuthLoading());

      try {
        await Future.delayed(const Duration(seconds: 2));
        return emit(AuthInitial());
      } on Exception catch (e) {
        return emit(AuthFailure(error: e.toString()));
      }
    }
}
