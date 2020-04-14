part of 'activateaccount_bloc.dart';

abstract class ActivateAccountEvent extends Equatable {
  const ActivateAccountEvent();
}

class ActivateAccountPressed extends ActivateAccountEvent {
  final String email;
  final String plainPassword;
  final String activationCode;
  const ActivateAccountPressed(
      {@required this.email,
      @required this.activationCode,
      @required this.plainPassword});
  @override
  List<Object> get props => [email, plainPassword, activationCode];
}
