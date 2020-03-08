part of 'authenticationbloc_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();
}

class Uninitialized extends AuthenticationState {
  @override
  List<Object> get props => [];
}

class Unauthenticated extends AuthenticationState {
  @override
  List<Object> get props => null;
}

class Authenticated extends AuthenticationState {
  final String accessToken;
  const Authenticated({@required this.accessToken});
  @override
  List<Object> get props => [accessToken];
}

class AuthenticationFailed extends AuthenticationState {
  final String errorText;
  const AuthenticationFailed({@required this.errorText});
  @override
  List<Object> get props => [errorText];
}
