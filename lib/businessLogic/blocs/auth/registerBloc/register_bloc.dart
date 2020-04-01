import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:westcardapp/businessLogic/repositories/authRepository.dart';
import 'package:westcardapp/utils/authUtils.dart';

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
        yield RegisterFailed(
            errorText: 'Este correo electrónico ya está en uso');
      else if (responseRegister == null)
        yield RegisterFailed(errorText: 'Error de conexion');
      else if (statusCode == 500 || statusCode == 503)
        yield RegisterFailed(errorText: 'Error de servidor');
      else if (statusCode == 201) {
        this.authUtils.writeSecureToken(responseRegister.accessToken);
        yield RegisterSuccessfull();
      } else if (statusCode == 400)
        yield RegisterFailed(errorText: 'Solicitud inválida');
      else
        yield RegisterFailed(errorText: 'Error desconocido');
    }
  }
}
