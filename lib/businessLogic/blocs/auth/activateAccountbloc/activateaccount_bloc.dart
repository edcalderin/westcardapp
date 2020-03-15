import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'activateaccount_event.dart';
part 'activateaccount_state.dart';

class ActivateaccountBloc extends Bloc<ActivateaccountEvent, ActivateaccountState> {
  @override
  ActivateaccountState get initialState => ActivateaccountInitial();

  @override
  Stream<ActivateaccountState> mapEventToState(
    ActivateaccountEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
