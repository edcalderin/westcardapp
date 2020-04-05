part of 'forgotpassword_bloc.dart';

abstract class ForgotPasswordState extends Equatable {
  const ForgotPasswordState();
}

class ForgotPasswordInitial extends ForgotPasswordState {
  @override
  List<Object> get props => [];
}

class ForgotPasswordLoading extends ForgotPasswordState {
  @override
  List<Object> get props => null;
}

class ForgotPasswordLoaded extends ForgotPasswordState {
  @override
  List<Object> get props => null;
}

class ForgotPasswordFailed extends ForgotPasswordState {
  final String errorText;
  const ForgotPasswordFailed({@required this.errorText});
  @override
  List<Object> get props => [errorText];
}
