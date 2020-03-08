import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'loginbloc_event.dart';
part 'loginbloc_state.dart';

class LoginblocBloc extends Bloc<LoginblocEvent, LoginblocState> {
  @override
  LoginblocState get initialState => LoginblocInitial();

  @override
  Stream<LoginblocState> mapEventToState(
    LoginblocEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
