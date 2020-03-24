import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:westcardapp/businessLogic/repositories/authRepository.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthRepository authRepository;
  RegisterBloc({@required this.authRepository});
  @override
  RegisterState get initialState => RegisterInitial();

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is RegisterPressed) {
      yield RegisterLoading();
      final int responseRegister =
          await authRepository.signUp(event.email, event.password);
      if (responseRegister == null)
        yield RegisterFailed(errorText: 'Error de conexion');
      else if (responseRegister == 500 || responseRegister == 503)
        yield RegisterFailed(errorText: 'Error de servidor');
      else if (responseRegister == 201)
        yield RegisterSuccessfull();
      else if (responseRegister == 400)
        yield RegisterFailed(errorText: 'Solicitud inválida');
      else
        yield RegisterFailed(errorText: 'Error desconocido');
    }
  }
}
