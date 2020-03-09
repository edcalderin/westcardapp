part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class SignInPressed extends LoginEvent {
  final String email;
  final String password;
  const SignInPressed({@required this.email, @required this.password});
  @override
  List<Object> get props => [email, password];
}
