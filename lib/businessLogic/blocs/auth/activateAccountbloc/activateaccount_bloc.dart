import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:westcardapp/businessLogic/blocs/auth/authenticationBloc/authentication_bloc.dart';
import 'package:westcardapp/businessLogic/repositories/authRepository.dart';
import 'package:westcardapp/utils/authUtils.dart';

part 'activateaccount_event.dart';
part 'activateaccount_state.dart';

class ActivateAccountBloc
    extends Bloc<ActivateAccountEvent, ActivateAccountState> {
  @override
  ActivateAccountState get initialState => ActivateAccountInitial();

  final AuthRepository authRepository;
  AuthenticationBloc authenticationBloc;
  ActivateAccountBloc(
      {@required this.authRepository, @required this.authenticationBloc});

  @override
  Stream<ActivateAccountState> mapEventToState(
    ActivateAccountEvent event,
  ) async* {
    if (event is ActivateAccountPressed) {
      yield ActivateAccountLoading();
      final int response = await this
          .authRepository
          .activateAccount(event.email, event.activationCode);

      if (response == 200) {
        final String accessToken = await AuthUtils().readSecureToken();
        this.authenticationBloc.add(SignedIn(accessToken: accessToken));
      } else if (response == 500 || response == 503)
        ActivateAccountFailed(errorText: 'Server error');
      else if (response == null)
        ActivateAccountFailed(errorText: 'Connection error');
      else
        ActivateAccountFailed(errorText: 'Unknown error');
    }
  }
}
