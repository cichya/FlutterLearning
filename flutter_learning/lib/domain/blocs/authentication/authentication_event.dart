import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class AuthenticationEvent extends Equatable {
  AuthenticationEvent([List properties = const[]]) : super(properties);
}

class AppStarted extends AuthenticationEvent {
  @override
  String toString() => 'AppStarted';
}

class LoggedIn extends AuthenticationEvent {
  final String token;

  LoggedIn({@required this.token}) : super([token]);

  @override
  String toString() => 'LoggedIn { token: $token }';
}

class LoggedOut extends AuthenticationEvent {
  @override
  String toString() => 'LoggedOut';
}