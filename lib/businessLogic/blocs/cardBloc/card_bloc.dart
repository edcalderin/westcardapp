import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:westcardapp/businessLogic/repositories/cardRepository.dart';
import 'package:westcardapp/models/profileModel.dart';
import 'package:westcardapp/utils/blocMessages.dart';

part 'card_event.dart';
part 'card_state.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  final CardRepository cardRepository = CardRepository();
  @override
  CardState get initialState => CardInitial();

  @override
  Stream<CardState> mapEventToState(
    CardEvent event,
  ) async* {
    if (event is GetAllCards)
      mapEventToStateGetAll(event);
    else if (event is CreateCard)
      mapEventToStateCreateCard(event);
    else if (event is DeleteCard) mapEventToStateDeleteCard(event);
  }

  void mapEventToStateGetAll(GetAllCards event) async* {
    yield LoadingCards();
    final dynamic response = await this.cardRepository.getAllCards(event.uuid);
    final int statusCode = response.statusCode;
    if (statusCode == 200)
      yield LoadedCards(profileModels: event.profileModels);
    else if (statusCode == 500)
      yield CardsFailed(errorText: UNEXPECTED_ERROR);
    else
      yield CardsFailed(errorText: CONNECTION_ERROR);
  }

  void mapEventToStateCreateCard(CreateCard event) async* {
    yield LoadingCards();
    final dynamic response =
        await this.cardRepository.getAllCards(event.profileModel.uuid);
    final int statusCode = response.statusCode;
    if (statusCode == 201)
      yield CreatedCard(profileModel: event.profileModel);
    else if (statusCode == 500)
      yield CardsFailed(errorText: UNEXPECTED_ERROR);
    else
      yield CardsFailed(errorText: CONNECTION_ERROR);
  }

  void mapEventToStateDeleteCard(DeleteCard event) async* {
    yield LoadingCards();
    final dynamic response = await this.cardRepository.deleteCards(event.id);
    final int statusCode = response.statusCode;
    if (statusCode == 200)
      yield DeletedCard();
    else if (statusCode == 500)
      yield CardsFailed(errorText: UNEXPECTED_ERROR);
    else
      yield CardsFailed(errorText: CONNECTION_ERROR);
  }
}
