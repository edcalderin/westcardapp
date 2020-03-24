import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:westcardapp/businessLogic/blocs/auth/authenticationBloc/authentication_bloc.dart';
import 'package:westcardapp/businessLogic/blocs/auth/loginBloc/login_string.dart';
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
    if (response == null)
      yield LoginFailed(errorText: CONNECTION_ERROR);
    else if (response.statusCode == 200) {
      dynamic responseStatus = await this
          .authRepository
          .accountStatus(event.email, jsonDecode(response.body)['accessToken']);
      if (responseStatus.statusCode == 200) {
        if (this.isActiveAccount(responseStatus))
          authenticationBloc
              .add(SignedIn(accessToken: response.body.accessToken));
        else
          yield LoginFailed(errorText: INVALID_STATUS);
      } else
        yield LoginFailed(errorText: SERVER_ERROR);
    } else if (response.statusCode == 400)
      yield LoginFailed(errorText: BAD_CREDENTIALS);
    else if (response.statusCode == 500 || response == 503)
      yield LoginFailed(errorText: SERVER_ERROR);
  }

  bool isActiveAccount(dynamic response) {
    dynamic responseDecoded = jsonDecode(response.body);
    return responseDecoded['message'] == 'active';
  }
}
