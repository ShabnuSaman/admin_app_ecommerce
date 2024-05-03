part of 'signup_bloc.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}

class SignupAuthenticatedSuccessfulState extends SignupState{
  final User user;
  SignupAuthenticatedSuccessfulState(this.user);
}
class SignupUnAuthenticationState extends SignupState{}

class SignupAuthenticatedErrorState extends SignupState{
  final String errorMessage;
  SignupAuthenticatedErrorState({required this.errorMessage});
}