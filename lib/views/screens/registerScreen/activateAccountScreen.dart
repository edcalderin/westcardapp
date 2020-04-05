import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:westcardapp/businessLogic/blocs/auth/activateAccountbloc/activateaccount_bloc.dart';
import 'package:westcardapp/businessLogic/blocs/auth/authenticationBloc/authentication_bloc.dart';
import 'package:westcardapp/businessLogic/repositories/authRepository.dart';
import 'package:westcardapp/routes/const_routes.dart';
import 'package:westcardapp/utils/common.dart';
import 'package:westcardapp/views/components/activateAccountForm.dart';
import 'package:westcardapp/views/components/loadingProgress.dart';

class ActivateAccountScreen extends StatefulWidget {
  final String email;
  ActivateAccountScreen({Key key, this.email}) : super(key: key);
  @override
  _ActivateAccountScreenState createState() => _ActivateAccountScreenState();
}

class _ActivateAccountScreenState extends State<ActivateAccountScreen> {
  AuthenticationBloc authenticationBloc;
  ActivateAccountBloc activateAccountBloc;
  AuthRepository authRepository;
  String email;
  String activationCode;
  @override
  void initState() {
    super.initState();
    this.authRepository = AuthRepository();
    this.authenticationBloc =
        AuthenticationBloc(authRepository: this.authRepository);
    this.activateAccountBloc = ActivateAccountBloc(
        authRepository: this.authRepository,
        authenticationBloc: this.authenticationBloc);
  }

  @override
  void dispose() {
    super.dispose();
    this.authenticationBloc.close();
    this.activateAccountBloc.close();
  }

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
                  fit: BoxFit.fitWidth),
            ),
          ),
          actions: <Widget>[
            Container(
                margin: EdgeInsets.only(top: 20, right: 20),
                child: Text(
                  'Registro de nuevo usuario',
                  style: TextStyle(fontSize: 18),
                )),
          ],
        ),
        body: BlocListener<ActivateAccountBloc, ActivateAccountState>(
          bloc: this.activateAccountBloc,
          listener: (context, state) {
            if (state is ActivateAccountFailed)
              Common().showFlushBar(context: context, message: state.errorText);
            else if (state is ActivateAccountLoaded)
              Navigator.of(context).pushReplacementNamed(registerConfirmRoute);
          },
          child: BlocBuilder<ActivateAccountBloc, ActivateAccountState>(
            bloc: this.activateAccountBloc,
            builder: (context, state) {
              return Stack(
                children: <Widget>[
                  Opacity(
                      opacity: (state is ActivateAccountLoading) ? 0.5 : 1,
                      child: ActivateAccountForm(
                          email: widget.email,
                          changeEmail: (email) => this.changeEmailEvent(email),
                          changeCode: (code) => this.changeCodeEvent(code),
                          activateOnPressed: this.activateOnPressed)),
                  (state is ActivateAccountLoading)
                      ? LoadingProgress()
                      : Container()
                ],
              );
            },
          ),
        ));
  }

  void activateOnPressed() {
    final String email = widget.email ?? this.email;
    this.activateAccountBloc.add(ActivateAccountPressed(
        email: email.trim().toLowerCase(),
        activationCode: this.activationCode.trim().toUpperCase()));
  }

  void changeEmailEvent(String email) {
    this.email = email;
  }

  void changeCodeEvent(String code) {
    this.activationCode = code;
  }
}
