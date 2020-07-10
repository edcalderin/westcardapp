part of 'card_bloc.dart';

abstract class CardState extends Equatable {
  const CardState();
}

class CardInitial extends CardState {
  @override
  List<Object> get props => [];
}

class LoadingCards extends CardState {
  @override
  List<Object> get props => null;
}

class LoadedCards extends CardState {
  final List<ProfileModel> profileModels;
  const LoadedCards({@required this.profileModels});
  @override
  List<Object> get props => [this.profileModels];
}

class CreatedCard extends CardState {
  final ProfileModel profileModel;
  const CreatedCard({@required this.profileModel});
  @override
  List<Object> get props => [this.profileModel];
}

class DeletedCard extends CardState {
  @override
  List<Object> get props => [];
}

class CardsFailed extends CardState {
  final String errorText;
  const CardsFailed({@required this.errorText});
  @override
  List<Object> get props => [this.errorText];
}
