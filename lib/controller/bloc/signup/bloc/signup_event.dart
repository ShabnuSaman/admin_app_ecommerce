part of 'signup_bloc.dart';

@immutable
sealed class SignupEvent {}


class SignupSuccessfullEvent extends SignupEvent{
  final String name;
  final String email;
  final String password;
  final String phone;

  SignupSuccessfullEvent({required this.name,required this.email,required this.password,required this.phone});
}


