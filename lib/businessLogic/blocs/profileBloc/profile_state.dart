part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
}

class ProfileInitial extends ProfileState {
  @override
  List<Object> get props => [];
}

class ProfileLoading extends ProfileState {
  @override
  List<Object> get props => null;
}

class ProfileLoaded extends ProfileState {
  final ProfileModel profileModel;
  const ProfileLoaded({@required this.profileModel});
  @override
  List<Object> get props => [profileModel];
}

class ProfileFailed extends ProfileState {
  final String errorText;
  const ProfileFailed({@required this.errorText});
  @override
  List<Object> get props => [errorText];
}
