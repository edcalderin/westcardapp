import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:westcardapp/businessLogic/blocs/profileBloc/profile_bloc.dart';
import 'package:westcardapp/businessLogic/repositories/profileRepository.dart';
import 'package:westcardapp/models/profileModel.dart';
import 'package:westcardapp/utils/authUtils.dart';
import 'package:westcardapp/utils/blocMessages.dart';
import 'package:westcardapp/utils/common.dart';
import 'package:westcardapp/views/components/loadingProgress.dart';
import 'package:westcardapp/views/components/navBar.dart';
import 'package:westcardapp/views/components/profileForm.dart';
import 'package:westcardapp/views/screens/profile/enumAction.dart';

class UserProfileScreen extends StatefulWidget {
  UserProfileScreen({Key key}) : super(key: key);

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  ProfileBloc profileBloc;
  ProfileModel profileModel;
  Common common;
  String email;
  ActionProfile actionProfile;
  @override
  void initState() {
    super.initState();
    common = Common();
    getEmail().then((emailValue) => email = emailValue);
    profileBloc = ProfileBloc(profileRepository: ProfileRepository());
  }

  Future<String> getEmail() async {
    final authData = await AuthUtils().readSecureAuthData();
    final String email = authData[0];
    return email;
  }

  @override
  void dispose() {
    super.dispose();
    profileBloc.close();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    profileBloc.add(GetProfile());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(56.0),
          child: Navbar(),
        ),
        body: BlocConsumer<ProfileBloc, ProfileState>(
            bloc: profileBloc,
            listener: (context, state) async {
              if (state is ProfileFailed) {
                if (state.errorText == UNFOUND_PROFILE) {
                  profileModel = ProfileModel(email: email);
                  actionProfile = ActionProfile.CREATE;
                } else
                  common.showFlushBar(
                      context: context, message: state.errorText);
              } else if (state is ProfileLoaded) {
                profileModel = state.profileModel;
                common.showFlushBar(
                    context: context, message: 'Perfil actualizado');
              }
            },
            builder: (context, state) {
              return Stack(children: <Widget>[
                Opacity(
                  opacity: state is ProfileLoading ? 0.5 : 0.0,
                  child: ProfileForm(
                      actionProfile: actionProfile,
                      profileBloc: profileBloc,
                      profileModel: profileModel),
                ),
                state is ProfileLoading
                    ? LoadingProgress()
                    : ProfileForm(
                        actionProfile: actionProfile,
                        profileBloc: profileBloc,
                        profileModel: profileModel)
              ]);
            }));
  }
}
