import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:westcardapp/businessLogic/repositories/profileRepository.dart';
import 'package:westcardapp/models/profileModel.dart';
import 'package:westcardapp/utils/authUtils.dart';
import 'package:westcardapp/utils/blocMessages.dart';

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
    else if (event is UpdateProfile)
      yield* mapEventToStateUpdateProfile(event);
    else if (event is CreateProfile) yield* mapEventToStateCreateProfile(event);
  }

  Stream<ProfileState> mapEventToStateGetProfile(GetProfile event) async* {
    yield ProfileLoading();
    final dynamic response = await this.profileRepository.getProfileData();
    final int statusCode = response.statusCode;
    if (statusCode == 200) {
      final ProfileModel profileModel =
          ProfileModel.fromJson(jsonDecode(response.body));
      if (event.isUpgrade)
        yield ProfileUpgraded(profileModel: profileModel);
      else
        yield ProfileLoaded(profileModel: profileModel);
    } else if (statusCode == 500) {
      final authData = await AuthUtils().readSecureAuthData();
      final String email = authData[0];
      yield ProfileLoaded(profileModel: ProfileModel(email: email));
    } else
      yield ProfileFailed(errorText: CONNECTION_ERROR);
  }

  Stream<ProfileState> mapEventToStateUpdateProfile(
      UpdateProfile event) async* {
    yield ProfileLoading();
    final dynamic response =
        await this.profileRepository.updateProfile(event.profileModel);
    final int statusCode = response.statusCode;
    if (statusCode == 202)
      yield ProfileUpgraded(profileModel: event.profileModel);
    else if (statusCode == 500)
      yield ProfileFailed(errorText: UNEXPECTED_ERROR);
    else
      yield ProfileFailed(errorText: CONNECTION_ERROR);
  }

  Stream<ProfileState> mapEventToStateCreateProfile(
      CreateProfile event) async* {
    yield ProfileLoading();
    final dynamic response =
        await this.profileRepository.createProfile(event.profileModel);
    final int statusCode = response.statusCode;
    if (statusCode == 201)
      this.add(GetProfile(isUpgrade: true));
    else if (statusCode == 500)
      yield ProfileFailed(errorText: UNEXPECTED_ERROR);
    else
      yield ProfileFailed(errorText: CONNECTION_ERROR);
  }
}
