part of 'forgot_bloc.dart';

@immutable
sealed class ForgotEvent {}


class ForgotPasswordSuccessfulEvent extends ForgotEvent{
  final String email;
  ForgotPasswordSuccessfulEvent({required this.email});
}

