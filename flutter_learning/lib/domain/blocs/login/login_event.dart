import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class LoginEvent extends Equatable {}

class Login extends LoginEvent {
  final String userName;
  final String password;

  Login({@required this.userName, @required this.password});

  @override
  String toString() => 'Login { userName: $userName}, password: $password }';
}