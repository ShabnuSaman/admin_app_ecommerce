import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  LoginBloc() : super(LoginInitial()) {
    on<CheckLoginStatusEvent>((event, emit) async {
      User? user;
      try {
        await Future.delayed(const Duration(seconds: 3));
        user = auth.currentUser;
        if (user != null) {
          emit(LoginAuthenticatedSuccessState(user));
        } else {
          emit(LoginUnAuthenticatedState());
        }
      } catch (e) {
        emit(LoginAuthenticationErrorState(loginErrorMessage: e.toString()));
      }
    });
    on<LoginSuccessfulEvent>(
      (event, emit) async {
        try {
          final userCredential = await auth.signInWithEmailAndPassword(
              email: event.email.toString(),
              password: event.password.toString());

          final user = userCredential.user;

          if (user != null) {
            emit(LoginAuthenticatedSuccessState(user));
          } else {
            emit(LoginUnAuthenticatedState());
          }
        } catch (e) {
          emit(LoginAuthenticationErrorState(loginErrorMessage: e.toString()));
        }
      },
    );
    on<LogoutEvent>((event, emit)async {
      try {
        await auth.signOut();
        emit(LoginUnAuthenticatedState());
      } catch (e) {
        emit(LoginAuthenticationErrorState(loginErrorMessage: e.toString()));
      }
    },);
  }
}
