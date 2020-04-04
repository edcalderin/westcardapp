import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:westcardapp/businessLogic/blocs/auth/authenticationBloc/authentication_bloc.dart';
import 'package:westcardapp/businessLogic/repositories/authRepository.dart';

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
      final dynamic response = await this
          .authRepository
          .activateAccount(event.email, event.activationCode);
      final int statusCode = response.statusCode;
      if (statusCode == 200)
        yield ActivateAccountLoaded();
      else if (statusCode == 400)
        yield ActivateAccountFailed(errorText: 'Formato invalido');
      else if (statusCode == 500 || statusCode == 503) {
        if (this.isInvalidAccount(response))
          yield ActivateAccountFailed(
              errorText: 'Correo electronico o codigo invalido');
        else
          yield ActivateAccountFailed(errorText: 'Error de servidor');
      } else
        yield ActivateAccountFailed(errorText: 'Error inesperado');
    }
  }

  bool isInvalidAccount(dynamic response) {
    try {
      final dynamic responseDecoded = jsonDecode(response.body);
      return responseDecoded['status'] == 'error';
    } catch (e) {
      return false;
    }
  }
}
