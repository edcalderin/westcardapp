part of 'resetpassword_bloc.dart';

abstract class ResetPasswordState extends Equatable {
  const ResetPasswordState();
}

class ResetPasswordInitial extends ResetPasswordState {
  @override
  List<Object> get props => [];
}

class ResetPasswordLoading extends ResetPasswordState {
  @override
  List<Object> get props => null;
}

class ResetPasswordLoaded extends ResetPasswordState {
  @override
  List<Object> get props => null;
}

class ResetPasswordFailed extends ResetPasswordState {
  final String errorText;
  const ResetPasswordFailed({@required this.errorText});
  @override
  List<Object> get props => [errorText];
}
