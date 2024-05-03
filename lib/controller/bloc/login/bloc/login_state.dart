part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

class LoginLoading extends LoginState{}

class LoginAuthenticatedSuccessState extends LoginState{
  final User user;
  LoginAuthenticatedSuccessState( this.user);
}

class LoginUnAuthenticatedState extends LoginState{}

class LoginAuthenticationErrorState extends LoginState{
  final String loginErrorMessage;
  LoginAuthenticationErrorState({required this.loginErrorMessage});
}
