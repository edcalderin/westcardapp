import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:westcardapp/businessLogic/blocs/authenticationBloc/authentication_bloc.dart';
import 'package:westcardapp/businessLogic/repositories/authRepository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  AuthRepository authRepository;
  AuthenticationBloc authenticationBloc;
  LoginBloc({@required this.authRepository, @required this.authenticationBloc});
  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is SignInPressed) yield* mapToEventSignInPressed(event);
  }

  Stream<LoginState> mapToEventSignInPressed(SignInPressed event) async* {
    yield LoginLoading();
    final dynamic response =
        await authRepository.signIn(event.email, event.password);
    switch (response) {
      case 200:
        authenticationBloc.add(SignedIn(accessToken: '22'));
        break;
      default:
    }
  }
}
