import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:westcardapp/businessLogic/blocs/auth/activateAccountbloc/activateaccount_bloc.dart';
import 'package:westcardapp/businessLogic/blocs/auth/authenticationBloc/authentication_bloc.dart';
import 'package:westcardapp/businessLogic/repositories/authRepository.dart';
import 'package:westcardapp/models/activationParams.dart';
import 'package:westcardapp/views/components/activateAccountForm.dart';

class ActivateAccountScreen extends StatelessWidget {
  final ActivationParams activationParams;
  ActivateAccountScreen({Key key, @required this.activationParams})
      : super(key: key);

  ActivateAccountBloc activateAccountBloc;
  String email;
  AuthRepository get authRepository => activationParams.authRepository;
  String get widgetEmail => activationParams.email;
  String get plainPassword => activationParams.plainPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 5,
            automaticallyImplyLeading: false,
            backgroundColor: Color.fromARGB(255, 45, 62, 80),
            title: Container(
                margin: EdgeInsets.only(left: 10),
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: ExactAssetImage('lib/assets/main-icon.png'),
                        fit: BoxFit.fitWidth))),
            actions: <Widget>[
              Container(
                  margin: EdgeInsets.only(top: 20, right: 20),
                  child: Text(
                    'Registro de nuevo usuario',
                    style: TextStyle(fontSize: 18),
                  ))
            ]),
        body: ActivateAccountForm(
            email: widgetEmail, plainPassword: plainPassword, authRepository:authRepository));
  }
}
