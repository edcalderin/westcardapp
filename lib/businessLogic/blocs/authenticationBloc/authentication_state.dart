part of 'authentication_bloc.dart';

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
  @override
  List<Object> get props => null;
}

class AuthenticationLoading extends AuthenticationState {
  @override
  List<Object> get props => null;
}

class AuthenticationFailed extends AuthenticationState {
  final String errorText;
  const AuthenticationFailed({@required this.errorText});
  @override
  List<Object> get props => [errorText];
}
