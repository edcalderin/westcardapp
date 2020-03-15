import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:westcardapp/businessLogic/repositories/authRepository.dart';
import 'package:westcardapp/utils/authUtils.dart';

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
    final String tokenSecureStorage = await authUtils.readSecureToken();
    if (tokenSecureStorage != null) {
      final int response =
          await this.authRepository.hasToken(tokenSecureStorage);
      switch (response) {
        case 200:
          Authenticated();
          break;
        case 401:
          Unauthenticated();
          break;
        case 500 | 503:
          AuthenticationFailed(errorText: 'Server error');
          break;
        case -1:
          AuthenticationFailed(errorText: 'Connection error');
          break;
        default:
          AuthenticationFailed(errorText: 'Unknown error');
      }
    } else
      yield Unauthenticated();
  }

  Stream<AuthenticationState> mapToEventSignedIn(SignedIn event) async* {
    yield AuthenticationLoading();
    await authUtils.writeSecureToken(event.accessToken);
    yield Authenticated();
  }

  Stream<AuthenticationState> mapToEventSignedOut(SignedOut event) async* {
    yield AuthenticationLoading();
    final String accessToken = await authUtils.readSecureToken();
    final dynamic response =
        await authRepository.signOut(event.email, accessToken);
    switch (response) {
      case 200:
        yield Unauthenticated();
        break;
      case 400:
        yield AuthenticationFailed(errorText: 'Bad credentials');
        break;
      case 500 | 503:
        yield AuthenticationFailed(errorText: 'Server error');
        break;
      case -1:
        yield AuthenticationFailed(errorText: 'Connection error');
        break;
      default:
    }
  }
}
