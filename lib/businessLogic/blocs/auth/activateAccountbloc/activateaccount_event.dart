part of 'activateaccount_bloc.dart';

abstract class ActivateAccountEvent extends Equatable {
  const ActivateAccountEvent();
}

class ActivateAccountPressed extends ActivateAccountEvent {
  final String email;
  final String activationCode;
  const ActivateAccountPressed(
      {@required this.email, @required this.activationCode});
  @override
  List<Object> get props => [email, activationCode];
}
