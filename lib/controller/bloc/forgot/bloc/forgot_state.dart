part of 'forgot_bloc.dart';

@immutable
sealed class ForgotState {}

class ForgotInitial extends ForgotState {}

class ForgotPasswordLoadingState extends ForgotState{}

class ForgotPasswordAuthenticatedState extends ForgotState{

}

class ForgotPasswordUnAuthenticatedState extends ForgotState{}

class ForgotPasswordAuthenticationError extends ForgotState{ 
  final String errorMessage;
  ForgotPasswordAuthenticationError({required this.errorMessage});
}
