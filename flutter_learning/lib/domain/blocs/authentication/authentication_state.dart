import 'package:equatable/equatable.dart';

class AuthenticationState extends Equatable{
  AuthenticationState({List properties = const[]}) : super(properties);
}

class AuthenticationUninitialized extends AuthenticationState {
  @override
  String toString() => 'AuthenticationUninitialized';
}

class AuthenticationAuthenticated extends AuthenticationState {
  @override
  String toString() => 'AuthenticationAuthenticated';
}

class AuthenticateUnauthenticated extends AuthenticationState {
  @override
  String toString() => 'AuthenticateUnauthenticated';
}

class AuthenticateLoading extends AuthenticationState {
  @override
  String toString() => 'AuthenticateLoading';
}