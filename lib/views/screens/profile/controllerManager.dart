import 'package:flutter/material.dart';
import 'package:westcardapp/models/profileModel.dart';

class ControllerManager {
  List<TextEditingController> controllersTxtFields;

  ControllerManager({@required ProfileModel profileModel}) {
    controllersTxtFields = List<TextEditingController>();
    controllersTxtFields
        .add(TextEditingController(text: profileModel?.firstName ?? ''));
    controllersTxtFields
        .add(TextEditingController(text: profileModel?.lastName ?? ''));
    controllersTxtFields
        .add(TextEditingController(text: profileModel.email ?? ''));
    controllersTxtFields
        .add(TextEditingController(text: profileModel?.business ?? ''));
    controllersTxtFields
        .add(TextEditingController(text: profileModel?.phone ?? ''));
    controllersTxtFields
        .add(TextEditingController(text: profileModel?.mobile ?? ''));
    controllersTxtFields
        .add(TextEditingController(text: profileModel?.address ?? ''));
    controllersTxtFields
        .add(TextEditingController(text: profileModel?.facebook ?? ''));
    controllersTxtFields
        .add(TextEditingController(text: profileModel?.instagram ?? ''));
    controllersTxtFields
        .add(TextEditingController(text: profileModel?.twitter ?? ''));
    controllersTxtFields
        .add(TextEditingController(text: profileModel?.youtube ?? ''));
  }

  TextEditingController get txtFirstNameController => controllersTxtFields[0];
  TextEditingController get txtLastNameController => controllersTxtFields[1];
  TextEditingController get txtEmailController => controllersTxtFields[2];
  TextEditingController get txtBusinessController => controllersTxtFields[3];
  TextEditingController get txtPhoneController => controllersTxtFields[4];
  TextEditingController get txtMobileController => controllersTxtFields[5];
  TextEditingController get txtAddressController => controllersTxtFields[6];
  TextEditingController get txtFacebookController => controllersTxtFields[7];
  TextEditingController get txtInstagramController => controllersTxtFields[8];
  TextEditingController get txtTwitterController => controllersTxtFields[9];
  TextEditingController get txtYoutubeController => controllersTxtFields[10];

  void disposeAll() {
    controllersTxtFields.forEach((controller) => controller.dispose());
  }
}
