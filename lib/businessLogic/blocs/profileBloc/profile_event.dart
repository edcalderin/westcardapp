part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
}

class GetProfile extends ProfileEvent {
  @override
  List<Object> get props => [];
}

class CreateProfile extends ProfileEvent {
  final ProfileModel profileModel;
  const CreateProfile({@required this.profileModel});
  @override
  List<Object> get props => [profileModel];
}

class UpdateProfile extends ProfileEvent {
  final ProfileModel profileModel;
  const UpdateProfile({@required this.profileModel});
  @override
  List<Object> get props => [profileModel];
}
