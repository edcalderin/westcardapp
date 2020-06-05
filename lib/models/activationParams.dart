import 'package:flutter/material.dart';
import 'package:westcardapp/businessLogic/repositories/authRepository.dart';

class ActivationParams {
  final String email;
  final String plainPassword;
  final AuthRepository authRepository;
  ActivationParams(
      {this.email, this.plainPassword, @required this.authRepository});
}
