part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
}

class AppStarted extends AuthenticationEvent {
  @override
  List<Object> get props => null;
}

class SignedIn extends AuthenticationEvent {
  final String accessToken;
  final String email;
  const SignedIn({@required this.accessToken, @required this.email});
  @override
  List<Object> get props => [accessToken, email];
}

class SignedOut extends AuthenticationEvent {
  final String email;
  const SignedOut({@required this.email});
  @override
  List<Object> get props => [email];
}
