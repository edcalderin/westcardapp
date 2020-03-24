part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();
}

class RegisterInitial extends RegisterState {
  @override
  List<Object> get props => [];
}

class RegisterLoading extends RegisterState {
  @override
  List<Object> get props => null;
}

class RegisterSuccessfull extends RegisterState {
  @override
  List<Object> get props => null;
}

class RegisterFailed extends RegisterState {
  final String errorText;
  const RegisterFailed({@required this.errorText});
  @override
  List<Object> get props => [errorText];
}
