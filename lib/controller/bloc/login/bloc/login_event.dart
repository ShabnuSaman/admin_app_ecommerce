part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}


class CheckLoginStatusEvent extends LoginEvent{}

class LoginSuccessfulEvent extends LoginEvent{
  final String email;
  final String password;

  LoginSuccessfulEvent({required this.email,required this.password});
}

class LogoutEvent extends LoginEvent{}
