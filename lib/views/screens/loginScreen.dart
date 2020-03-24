import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:westcardapp/businessLogic/blocs/auth/authenticationBloc/authentication_bloc.dart';
import 'package:westcardapp/businessLogic/blocs/auth/loginBloc/login_bloc.dart';
import 'package:westcardapp/businessLogic/repositories/authRepository.dart';
import 'package:westcardapp/views/components/loginForm.dart';
import 'package:flushbar/flushbar.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _controller;
  AuthenticationBloc authenticationBloc;
  LoginBloc loginBloc;
  AuthRepository authRepository;
  String email, plainPassword;
  @override
  void initState() {
    super.initState();
    this.authRepository = AuthRepository();
    _controller = TextEditingController();
    this.authenticationBloc =
        AuthenticationBloc(authRepository: authRepository);
    this.loginBloc = LoginBloc(
        authRepository: this.authRepository,
        authenticationBloc: this.authenticationBloc);
  }

  void dispose() {
    _controller.dispose();
    this.loginBloc.close();
    this.authenticationBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: BlocListener<LoginBloc, LoginState>(
          bloc: this.loginBloc,
          listener: (context, state) {
            if (state is LoginFailed)
              Flushbar(
                duration: Duration(seconds: 2),
                messageText: Text(state.errorText,
                    style: TextStyle(color: Colors.black)),
                flushbarPosition: FlushbarPosition.BOTTOM,
                backgroundColor: Colors.white,
                isDismissible: true,
              )..show(context);
          },
          child: BlocBuilder<LoginBloc, LoginState>(
              bloc: this.loginBloc,
              builder: (context, state) {
                return Stack(children: <Widget>[
                  Opacity(
                      opacity: (state is LoginLoading) ? 0.5 : 1,
                      child: LoginForm(
                          changeEmailText: (email) =>
                              this.changeEmailText(email),
                          changePasswordText: (plainPassword) =>
                              this.changePasswordText(plainPassword),
                          email: this.email,
                          plainPassword: this.plainPassword,
                          buttonPressed: () => this.signInOnPress(context))),
                  (state is LoginLoading)
                      ? Center(child: CircularProgressIndicator())
                      : Container()
                ]);
              })),
    );
  }

  void changeEmailText(String email) {
    this.email = email;
    setState(() {});
  }

  void changePasswordText(String plainPassword) {
    this.plainPassword = plainPassword;
    setState(() {});
  }

  void signInOnPress(BuildContext context) {
    this.loginBloc.add(SignInPressed(
        email: this.email.trim(), password: this.plainPassword.trim()));
  }
}
