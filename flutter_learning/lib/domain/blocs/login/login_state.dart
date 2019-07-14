import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class LoginState extends Equatable {
  LoginState([List properties = const[]]) : super(properties);
}

class LoginUninitialized extends LoginState {
  @override
  String toString() => 'LoginUninitialized';
}

class LoginLoading extends LoginState {
  @override
  String toString() => 'LoginLoading';
}

class LoginError extends LoginState {
  final String error;

  LoginError({@required this.error});

  @override
  String toString() => 'LoginError { error: $error }';
}