import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:westcardapp/businessLogic/blocs/auth/activateAccountbloc/activateaccount_bloc.dart';
import 'package:westcardapp/businessLogic/blocs/auth/authenticationBloc/authentication_bloc.dart';
import 'package:westcardapp/businessLogic/repositories/authRepository.dart';
import 'package:westcardapp/routes/const_routes.dart';
import 'package:westcardapp/utils/common.dart';

import 'loadingProgress.dart';

class ActivateAccountForm extends StatefulWidget {
  final String email;
  final String plainPassword;
  final AuthRepository authRepository;
  ActivateAccountForm(
      {@required this.email,
      @required this.plainPassword,
      this.authRepository});

  @override
  _ActivateAccountFormState createState() => _ActivateAccountFormState();
}

class _ActivateAccountFormState extends State<ActivateAccountForm> {
  TextEditingController textCodeController;
  TextEditingController textEmailController;
  ActivateAccountBloc activateAccountBloc;
  AuthRepository get authRepository => widget.authRepository;
  @override
  void initState() {
    super.initState();

    this.activateAccountBloc = ActivateAccountBloc(
        authRepository: authRepository,
        authenticationBloc: AuthenticationBloc(authRepository: authRepository));
    this.textCodeController = TextEditingController();
    this.textEmailController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    this.textEmailController.dispose();
    this.textCodeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ActivateAccountBloc, ActivateAccountState>(
        bloc: activateAccountBloc,
        listener: (context, state) {
          if (state is ActivateAccountFailed)
            Common().showFlushBar(context: context, message: state.errorText);
          else if (state is ActivateAccountLoaded)
            Navigator.of(context).pushNamedAndRemoveUntil(
                homeScreenRoute, ModalRoute.withName(homeScreenRoute));
        },
        child: BlocBuilder<ActivateAccountBloc, ActivateAccountState>(
            bloc: activateAccountBloc,
            builder: (context, state) {
              return Stack(children: <Widget>[
                Opacity(
                    opacity: (state is ActivateAccountLoading) ? 0.5 : 1,
                    child: activateAccountForm()),
                (state is ActivateAccountLoading)
                    ? LoadingProgress()
                    : Container()
              ]);
            }));
  }

  Widget activateAccountForm() {
    return Stack(children: <Widget>[
      Container(
          decoration: BoxDecoration(
              image: DecorationImage(
        image: AssetImage('lib/assets/fondo_1.jpg'),
        fit: BoxFit.none,
      ))),
      Column(children: <Widget>[
        Container(
            margin: EdgeInsets.only(top: 30, bottom: 20),
            child: Center(
              child: Text('Ingrese codigo de activacion',
                  style: TextStyle(fontSize: 18, color: Colors.white)),
            )),
        Center(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              width: MediaQuery.of(context).size.width * 0.95,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.all(Radius.circular(5.0))),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    this.widget.email == null
                        ? this.mailWidget(context)
                        : Container(),
                    Text('Codigo de activacion',
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                    Container(
                        margin: EdgeInsets.only(bottom: 15, top: 10),
                        height: 35,
                        child: Theme(
                            data: Theme.of(context)
                                .copyWith(splashColor: Colors.transparent),
                            child: TextField(
                                controller: textCodeController,
                                autofocus: false,
                                style: TextStyle(
                                    fontSize: 16.0, color: Colors.black),
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    //hintText: 'ingresar codigo',
                                    contentPadding: const EdgeInsets.only(
                                        left: 14.0, bottom: 8.0, top: 8.0),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(18),
                                    )))))
                  ])),
        ),
        Container(
            margin: EdgeInsets.only(top: 15, bottom: 5),
            height: 40,
            width: MediaQuery.of(context).size.width * 0.95,
            child: RaisedButton(
                color: Color.fromARGB(255, 45, 62, 80),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                onPressed: this.activateOnPressed,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Enviar',
                          style:
                              TextStyle(fontSize: 18.0, color: Colors.white)),
                      Icon(Icons.arrow_right, size: 40, color: Colors.white),
                    ]))),
        Container(
            margin: EdgeInsets.only(top: 5, bottom: 5),
            height: 40,
            width: MediaQuery.of(context).size.width * 0.95,
            child: RaisedButton(
                color: Colors.grey,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.arrow_left, size: 40, color: Colors.white),
                      Text('Cancelar     ',
                          style:
                              TextStyle(fontSize: 18.0, color: Colors.white)),
                    ])))
      ])
    ]);
  }

  Column mailWidget(BuildContext context) {
    return Column(children: <Widget>[
      Text('Correo electrónico',
          style: TextStyle(color: Colors.white, fontSize: 16)),
      Container(
          margin: EdgeInsets.only(bottom: 15, top: 10),
          height: 35,
          child: Theme(
              data: Theme.of(context).copyWith(splashColor: Colors.transparent),
              child: TextField(
                  controller: textEmailController,
                  autofocus: false,
                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      //hintText: 'ingresar codigo',
                      contentPadding: const EdgeInsets.only(
                          left: 14.0, bottom: 8.0, top: 8.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(18),
                      )))))
    ]);
  }

  void activateOnPressed() {
    final String email = this.widget.email ?? this.textEmailController.text;
    activateAccountBloc.add(ActivateAccountPressed(
        email: email.trim().toLowerCase(),
        plainPassword: this.widget.plainPassword,
        activationCode: this.textCodeController.text.trim().toUpperCase()));
  }
}
