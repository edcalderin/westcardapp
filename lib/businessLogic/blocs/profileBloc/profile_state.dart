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
  final String email, firstName, lastName, gender;
  const ProfileLoaded(
      {@required this.email,
      @required this.firstName,
      @required this.lastName,
      @required this.gender});
  @override
  List<Object> get props => [email, firstName, lastName, gender];
}

class ProfileFailed extends ProfileState {
  final String errorText;
  const ProfileFailed({@required this.errorText});
  @override
  List<Object> get props => [errorText];
}
