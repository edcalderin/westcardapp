part of 'resetpassword_bloc.dart';

abstract class ResetPasswordEvent extends Equatable {
  const ResetPasswordEvent();
}

class ResetPasswordPressed extends ResetPasswordEvent {
  final String email, resetCode, password;
  const ResetPasswordPressed(
      {@required this.email,
      @required this.resetCode,
      @required this.password});
  @override
  List<Object> get props => [email, resetCode, password];
}
