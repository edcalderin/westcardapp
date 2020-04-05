import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:westcardapp/businessLogic/repositories/authRepository.dart';

part 'forgotpassword_event.dart';
part 'forgotpassword_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  @override
  ForgotPasswordState get initialState => ForgotPasswordInitial();
  final AuthRepository authRepository;
  ForgotPasswordBloc({@required this.authRepository});
  @override
  Stream<ForgotPasswordState> mapEventToState(
    ForgotPasswordEvent event,
  ) async* {
    if (event is ForgotPasswordPressed) {
      yield ForgotPasswordLoading();
      final dynamic response = await authRepository.forgotPassword(event.email);
      switch (response) {
        case 200:
          yield ForgotPasswordLoaded();
          break;
        case 500 | 503:
          yield ForgotPasswordFailed(errorText: 'Server error');
          break;
        case -1:
          yield ForgotPasswordFailed(errorText: 'Connection error');
          break;
        default:
          yield ForgotPasswordFailed(errorText: 'Unknown error');
      }
    }
  }
}
