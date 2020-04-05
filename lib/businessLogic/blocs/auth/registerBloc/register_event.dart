part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
}

class RegisterPressed extends RegisterEvent {
  final String email;
  final String password;
  const RegisterPressed({@required this.email, @required this.password});
  @override
  List<Object> get props => [email, password];
}
