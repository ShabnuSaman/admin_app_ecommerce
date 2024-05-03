import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  SignupBloc() : super(SignupInitial()) {
    on<SignupSuccessfullEvent>((event, emit) async {
      try {
        final userCredential = await auth.createUserWithEmailAndPassword(
            email: event.email.toString(), password: event.password.toString());

        final user = userCredential.user;

        if (user != null) {
          FirebaseFirestore.instance.collection("user").doc(user.uid).set({
            "uid": user.uid,
            "name": event.name.toString(),
            "email": user.email,
            "phone":event.phone,
            "CreatedAt": DateTime.now(),
          });
          emit(SignupAuthenticatedSuccessfulState(user));
        } else {
          emit(SignupUnAuthenticationState());
        }
      } catch (e) {
        emit(SignupAuthenticatedErrorState(errorMessage: e.toString()));
      }
    });
  }
}
