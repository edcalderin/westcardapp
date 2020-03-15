import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:westcardapp/businessLogic/repositories/authRepository.dart';

part 'activateaccount_event.dart';
part 'activateaccount_state.dart';

class ActivateAccountBloc
    extends Bloc<ActivateAccountEvent, ActivateAccountState> {
  @override
  ActivateAccountState get initialState => ActivateAccountInitial();
  final AuthRepository authRepository;
  ActivateAccountBloc({@required this.authRepository});
  @override
  Stream<ActivateAccountState> mapEventToState(
    ActivateAccountEvent event,
  ) async* {
    if (event is ActivateAccountPressed) {
      yield ActivateAccountLoading();
      final dynamic response = await this
          .authRepository
          .activateAccount(event.email, event.activationCode);
      switch (response) {
        case 200:
          yield ActivateAccountLoaded();
          break;
        case 500 | 503:
          ActivateAccountFailed(errorText: 'Server error');
          break;
        case -1:
          ActivateAccountFailed(errorText: 'Connection error');
          break;
        default:
          ActivateAccountFailed(errorText: 'Unknown error');
      }
    }
  }
}
