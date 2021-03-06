import 'package:flutter/cupertino.dart';
import 'package:westcardapp/models/profileModel.dart';

class CardModel extends ProfileModel {
  final String cardType;
  final String color;
  CardModel(
      {uuid,
      email,
      firstName,
      lastName,
      business,
      phone,
      mobile,
      address,
      facebook,
      instagram,
      twitter,
      youtube,
      @required this.cardType,
      @required this.color})
      : super(
          uuid: uuid,
          email: email,
          firstName: firstName,
          lastName: lastName,
          business: business,
          phone: phone,
          mobile: mobile,
          address: address,
          facebook: facebook,
          instagram: instagram,
          twitter: twitter,
          youtube: youtube,
        );

  factory CardModel.fromJson(Map<String, dynamic> json) {
    final ProfileModel profileModel = ProfileModel.fromJson(json);
    final String cardType = json['card_type'];
    final String color = json['color'];
    return CardModel(
      cardType: cardType,
      color: color,
      uuid: profileModel.uuid,
      email: profileModel.email,
      firstName: profileModel.firstName ?? '',
      lastName: profileModel.lastName ?? '',
      business: profileModel.business ?? '',
      phone: profileModel.phone ?? '',
      mobile: profileModel.mobile ?? '',
      address: profileModel.address ?? '',
      facebook: profileModel.facebook ?? '',
      instagram: profileModel.instagram ?? '',
      twitter: profileModel.twitter ?? '',
      youtube: profileModel.youtube ?? '',
    );
  }
  Map<String, Object> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['card_type'] = this.cardType;
    data['color'] = this.color;
    data['uuid'] = this.uuid;
    data['email'] = this.email;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['business'] = this.business;
    data['phone'] = this.phone;
    data['mobile'] = this.mobile;
    data['address'] = this.address;
    data['facebook'] = this.facebook;
    data['instagram'] = this.instagram;
    data['twitter'] = this.twitter;
    data['youtube'] = this.youtube;
    return data;
  }
}
