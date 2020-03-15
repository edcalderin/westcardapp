part of 'activateaccount_bloc.dart';

abstract class ActivateaccountEvent extends Equatable {
  const ActivateaccountEvent();
}

class ActivateAccountPressed extends ActivateaccountEvent {
  final String email;
  final String activationCode;
  const ActivateAccountPressed(
      {@required this.email, @required this.activationCode});
  @override
  List<Object> get props => [email, activationCode];
}
