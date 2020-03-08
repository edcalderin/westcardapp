part of 'authenticationbloc_bloc.dart';

abstract class AuthenticationblocEvent extends Equatable {
  const AuthenticationblocEvent();
}

class AppStarted extends AuthenticationblocEvent {
  @override
  List<Object> get props => null;
}

class SignedIn extends AuthenticationblocEvent {
  final String accessToken;
  const SignedIn({@required this.accessToken});
  @override
  List<Object> get props => [accessToken];
}

class SignedOut extends AuthenticationblocEvent {
  @override
  List<Object> get props => null;
}