import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class LoginState extends Equatable {
  LoginState([List properties = const[]]) : super(properties);
}

class LoginInitial extends LoginState {
  @override
  String toString() => 'LoginInitial';
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