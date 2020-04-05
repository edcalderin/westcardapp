part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class SignInPressed extends LoginEvent {
  final String email;
  final String plainPassword;
  const SignInPressed({@required this.email, @required this.plainPassword});
  @override
  List<Object> get props => [email, plainPassword];
}
