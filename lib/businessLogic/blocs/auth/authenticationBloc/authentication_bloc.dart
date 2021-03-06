import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:westcardapp/businessLogic/repositories/authRepository.dart';
import 'package:westcardapp/utils/authUtils.dart';
import 'package:westcardapp/utils/blocMessages.dart' as messages;
part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthRepository authRepository;
  final AuthUtils authUtils = AuthUtils();
  AuthenticationBloc({@required this.authRepository});
  @override
  AuthenticationState get initialState => Uninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted)
      yield* mapToEventAppStared(event);
    else if (event is SignedIn)
      yield* mapToEventSignedIn(event);
    else if (event is SignedOut) yield* mapToEventSignedOut(event);
  }

  Stream<AuthenticationState> mapToEventAppStared(AppStarted event) async* {
    final dynamic secureData = await authUtils.readSecureAuthData();
    final String tokenSecureStorage=secureData[1];
    if (tokenSecureStorage != null) {
      final int response =
          await this.authRepository.hasToken(tokenSecureStorage);
      switch (response) {
        case 202:
          yield Authenticated();
          break;
        case 401:
          yield Unauthenticated();
          break;
        case -1:
          yield AuthenticationFailed(errorText: messages.CONNECTION_ERROR);
          break;
        default:
          yield AuthenticationFailed(errorText: messages.UNEXPECTED_ERROR);
      }
    } else
      yield Unauthenticated();
  }

  Stream<AuthenticationState> mapToEventSignedIn(SignedIn event) async* {
    yield AuthenticationLoading();
    await authUtils.writeSecureAuthData(
        accessToken: event.accessToken, email: event.email);
    yield Authenticated();
  }

  Stream<AuthenticationState> mapToEventSignedOut(SignedOut event) async* {
    yield AuthenticationLoading();
    final List<String> dataAuth = await authUtils.readSecureAuthData();
    final String accessToken = dataAuth[1];
    final dynamic response =
        await authRepository.signOut(event.email, accessToken);
    switch (response) {
      case 200:
        yield Unauthenticated();
        break;
      case 400:
        yield AuthenticationFailed(errorText: messages.INVALID_REQUEST);
        break;
      case -1:
        yield AuthenticationFailed(errorText: messages.CONNECTION_ERROR);
        break;
      default:
        yield AuthenticationFailed(errorText: messages.UNEXPECTED_ERROR);
    }
  }
}
