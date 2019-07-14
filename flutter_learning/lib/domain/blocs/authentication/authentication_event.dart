import 'package:equatable/equatable.dart';

class AuthenticationEvent extends Equatable {}

class LogIn extends AuthenticationEvent {
  @override
  String toString() => 'LogIn';
}

class LogOut extends AuthenticationEvent {
  @override
  String toString() => 'LogOut';
}