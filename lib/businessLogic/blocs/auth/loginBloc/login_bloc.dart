import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:westcardapp/businessLogic/blocs/auth/authenticationBloc/authentication_bloc.dart';
import 'package:westcardapp/businessLogic/blocs/auth/loginBloc/login_string.dart';
import 'package:westcardapp/businessLogic/repositories/authRepository.dart';
import 'package:westcardapp/utils/blocMessages.dart' as messages;
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;
  final AuthenticationBloc authenticationBloc;
  LoginBloc({@required this.authRepository, @required this.authenticationBloc})
      : assert(authRepository != null),
        assert(authenticationBloc != null);
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
        await authRepository.signIn(event.email, event.plainPassword);
    final dynamic responseBody = jsonDecode(response.body);

    if (response.statusCode == 200) {
      dynamic responseStatus = await this
          .authRepository
          .accountStatus(event.email, jsonDecode(response.body)['accessToken']);
      if (responseStatus.statusCode == 200) {
        if (this.isActiveAccount(responseStatus)) {
          this.authenticationBloc.add(SignedIn(
              accessToken: responseBody['accessToken'], email: event.email));
          yield LoginInitial();
        } else
          yield LoginFailed(errorText: messages.INVALID_STATUS);
      } else
        yield LoginFailed(errorText: messages.UNEXPECTED_ERROR);
    } else if (response.statusCode == 400)
      yield LoginFailed(errorText: messages.LOGIN_DENIED);
    else if (response.statusCode == 500 || response.statusCode == 503)
      yield LoginFailed(errorText: messages.UNEXPECTED_ERROR);
    else
      yield LoginFailed(errorText: messages.CONNECTION_ERROR);
  }

  bool isActiveAccount(dynamic response) {
    dynamic responseDecoded = jsonDecode(response.body);
    return responseDecoded['message'] == 'active';
  }
}
