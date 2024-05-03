import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'forgot_event.dart';
part 'forgot_state.dart';

class ForgotBloc extends Bloc<ForgotEvent, ForgotState> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  ForgotBloc() : super(ForgotInitial()) {
    on<ForgotPasswordSuccessfulEvent>((event, emit) async {
      emit(ForgotPasswordLoadingState());
      emit(ForgotPasswordLoadingState());
      try {
        await auth.sendPasswordResetEmail(email: event.email);

        emit(ForgotPasswordAuthenticatedState());
      } catch (e) {
        emit(ForgotPasswordAuthenticationError(errorMessage: e.toString()));
      }
    });
  }
}
