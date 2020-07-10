part of 'card_bloc.dart';

abstract class CardEvent extends Equatable {
  const CardEvent();
}

class CreateCard extends CardEvent {
  final ProfileModel profileModel;
  const CreateCard({@required this.profileModel});
  @override
  List<Object> get props => [this.profileModel];
}

class GetAllCards extends CardEvent {
  final int uuid;
  final List<ProfileModel> profileModels;
  const GetAllCards({@required this.uuid, @required this.profileModels});

  @override
  List<Object> get props => [this.uuid, this.profileModels];
}

class DeleteCard extends CardEvent {
  final int id;
  const DeleteCard({@required this.id});
  @override
  List<Object> get props => [this.id];
}
