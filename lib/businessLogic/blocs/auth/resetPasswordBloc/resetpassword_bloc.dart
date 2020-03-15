import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:westcardapp/businessLogic/repositories/authRepository.dart';

part 'resetpassword_event.dart';
part 'resetpassword_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  @override
  ResetPasswordState get initialState => ResetPasswordInitial();
  final AuthRepository authRepository;
  ResetPasswordBloc({@required this.authRepository});
  @override
  Stream<ResetPasswordState> mapEventToState(
    ResetPasswordEvent event,
  ) async* {
    if (event is ResetPasswordPressed) {
      yield ResetPasswordLoading();
      final dynamic response = await this
          .authRepository
          .resetPassword(event.email, event.resetCode, event.password);
      switch (response) {
        case 200:
          yield ResetPasswordLoaded();
          break;
        case 500 | 503:
          yield ResetPasswordFailed(errorText: 'Server error');
          break;
        case -1:
          yield ResetPasswordFailed(errorText: 'Connection error');
          break;
        default:
          yield ResetPasswordFailed(errorText: 'Unknown error');
      }
    }
  }
}
