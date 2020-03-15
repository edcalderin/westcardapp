import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'resetpwd_event.dart';
part 'resetpwd_state.dart';

class ResetpwdBloc extends Bloc<ResetpwdEvent, ResetpwdState> {
  @override
  ResetpwdState get initialState => ResetpwdInitial();

  @override
  Stream<ResetpwdState> mapEventToState(
    ResetpwdEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
