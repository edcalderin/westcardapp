part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
}

class GetProfile extends ProfileEvent {
  final String param;
  const GetProfile({@required this.param});
  @override
  List<Object> get props => [param];
}

class UpdateProfile extends ProfileEvent {
  final ProfileModel profileModel;
  const UpdateProfile({@required this.profileModel});
  @override
  List<Object> get props => [profileModel];
}
