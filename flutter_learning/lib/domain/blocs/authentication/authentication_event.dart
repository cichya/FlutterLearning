import 'package:equatable/equatable.dart';

class AuthenticationEvent extends Equatable {}

class LoggedIn extends AuthenticationEvent {
  @override
  String toString() => 'LoggedIn';
}

class LoggedOut extends AuthenticationEvent {
  @override
  String toString() => 'LoggedOut';
}