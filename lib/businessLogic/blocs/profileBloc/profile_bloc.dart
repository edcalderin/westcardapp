import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:westcardapp/businessLogic/repositories/profileRepository.dart';
import 'package:westcardapp/models/profileModel.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository profileRepository;
  ProfileBloc({@required this.profileRepository});
  @override
  ProfileState get initialState => ProfileInitial();

  @override
  Stream<ProfileState> mapEventToState(
    ProfileEvent event,
  ) async* {
    if (event is GetProfile)
      yield* mapEventToStateGetProfile(event);
    else if (event is UpdateProfile) yield* mapEventToStateUpdateProfile(event);
  }

  Stream<ProfileState> mapEventToStateGetProfile(GetProfile event) async* {
    yield ProfileLoading();
    final dynamic response =
        await this.profileRepository.getProfileData(event.param);
    switch (response) {
      case 200:
        break;
      default:
    }
  }

  Stream<ProfileState> mapEventToStateUpdateProfile(
      UpdateProfile event) async* {
    yield ProfileLoading();
    await this.profileRepository.updateProfile(event.profileModel);
  }
}
