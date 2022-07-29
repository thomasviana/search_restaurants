part of 'auth_bloc.dart';

abstract class AuthEvent {}

class AuthStatusRequested extends AuthEvent {}

class LogoutRequested extends AuthEvent {}
