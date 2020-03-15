import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:westcardapp/businessLogic/blocs/auth/authenticationBloc/authentication_bloc.dart';
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
    if (response == -1)
      yield LoginFailed(errorText: 'Connection error');
    else if (response.statusCode == 200)
      authenticationBloc.add(SignedIn(accessToken: response.body.accessToken));
    else if (response.statusCode == 400)
      yield LoginFailed(errorText: 'Bad credentials');
    else if (response.statusCode == 500 || response == 503)
      yield LoginFailed(errorText: 'Server error');
  }
}
