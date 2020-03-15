part of 'activateaccount_bloc.dart';

abstract class ActivateaccountState extends Equatable {
  const ActivateaccountState();
}

class ActivateaccountInitial extends ActivateaccountState {
  @override
  List<Object> get props => [];
}

class ActivateAccountLoading extends ActivateaccountState {
  @override
  List<Object> get props => null;
}

class ActivateAccountLoaded extends ActivateaccountState {
  @override
  List<Object> get props => null;
}

class ActivateAccountFailed extends ActivateaccountState {
  @override
  List<Object> get props => null;
}
