part of 'forgotpassword_bloc.dart';

abstract class ForgotPasswordEvent extends Equatable {
  const ForgotPasswordEvent();
}

class ForgotPasswordPressed extends ForgotPasswordEvent {
  final String email;
  const ForgotPasswordPressed({@required this.email});
  @override
  List<Object> get props => [email];
}
