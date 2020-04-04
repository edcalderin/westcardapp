import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:westcardapp/businessLogic/repositories/authRepository.dart';
import 'package:westcardapp/utils/authUtils.dart';
import 'package:westcardapp/utils/blocMessages.dart' as messages;
part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthRepository authRepository;
  final AuthUtils authUtils = AuthUtils();
  RegisterBloc({@required this.authRepository});
  @override
  RegisterState get initialState => RegisterInitial();

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is RegisterPressed) {
      yield RegisterLoading();
      final dynamic responseRegister =
          await authRepository.signUp(event.email, event.password);
      final int statusCode = responseRegister.statusCode;
      if (this.authUtils.isUsernameTaken(responseRegister))
        yield RegisterFailed(errorText: messages.EMAIL_EXISTS);
      else if (responseRegister == null)
        yield RegisterFailed(errorText: messages.CONNECTION_ERROR);
      else if (statusCode == 201)
        yield RegisterSuccessfull();
      else if (statusCode == 400)
        yield RegisterFailed(errorText: messages.INVALID_REQUEST);
      else
        yield RegisterFailed(errorText: messages.UNEXPECTED_ERROR);
    }
  }
}
