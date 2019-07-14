import 'package:equatable/equatable.dart';

class LoginEvent extends Equatable {}

class Login extends LoginEvent {
  @override
  String toString() => 'Login';
}