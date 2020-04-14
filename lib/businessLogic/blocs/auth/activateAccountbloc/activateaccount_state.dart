part of 'activateaccount_bloc.dart';

abstract class ActivateAccountState extends Equatable {
  const ActivateAccountState();
}

class ActivateAccountInitial extends ActivateAccountState {
  @override
  List<Object> get props => [];
}

class ActivateAccountLoading extends ActivateAccountState {
  @override
  List<Object> get props => null;
}

class ActivateAccountFailed extends ActivateAccountState {
  final String errorText;
  const ActivateAccountFailed({@required this.errorText});
  @override
  List<Object> get props => [errorText];
}
