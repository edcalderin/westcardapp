part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginLoading extends LoginState {
  @override
  List<Object> get props => null;
}

class LoginFailed extends LoginState {
  final String errorText;
  const LoginFailed({@required this.errorText});
  @override
  List<Object> get props => [errorText];
}
