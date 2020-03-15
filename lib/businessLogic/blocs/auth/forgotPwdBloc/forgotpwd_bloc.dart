import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'forgotpwd_event.dart';
part 'forgotpwd_state.dart';

class ForgotpwdBloc extends Bloc<ForgotpwdEvent, ForgotpwdState> {
  @override
  ForgotpwdState get initialState => ForgotpwdInitial();

  @override
  Stream<ForgotpwdState> mapEventToState(
    ForgotpwdEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
