part of 'auth_bloc.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class SignupSuccess extends AuthState {
  final String message;
  SignupSuccess(this.message);
}


class LoginSuccess extends AuthState {
  final String message;
  LoginSuccess(this.message);
}


class AuthFailure extends AuthState {
  final String error;
  AuthFailure(this.error);
}
