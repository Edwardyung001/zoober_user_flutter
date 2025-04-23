part of 'auth_bloc.dart';

abstract class AuthEvent {}

class SignupRequested extends AuthEvent {
  final String name;
  final String email;
  final String phoneNumber;
  final String password;

  SignupRequested({required this.name, required this.email, required this.phoneNumber, required this.password});
}

class LoginRequested extends AuthEvent {
  final String phoneNumber;
  final String password;

  LoginRequested({required this.phoneNumber,required this.password});
}
