import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:westcardapp/businessLogic/blocs/auth/authenticationBloc/authentication_bloc.dart';
import 'package:westcardapp/businessLogic/blocs/auth/registerBloc/register_bloc.dart';
import 'package:westcardapp/businessLogic/repositories/authRepository.dart';
import 'package:westcardapp/routes/const_routes.dart';
import 'package:westcardapp/utils/authUtils.dart';
import 'package:westcardapp/utils/common.dart';
import 'package:westcardapp/views/components/loadingProgress.dart';
import 'package:westcardapp/views/components/registerForm.dart';

class UserRegisterScreen extends StatefulWidget {
  UserRegisterScreen({Key key}) : super(key: key);

  @override
  _UserRegisterScreenState createState() => _UserRegisterScreenState();
}

bool isSwitched = false;

class _UserRegisterScreenState extends State<UserRegisterScreen> {
  RegisterBloc registerBloc;
  AuthenticationBloc authenticationBloc;
  AuthRepository authRepository;
  String email;
  String plainPassword;
  @override
  void initState() {
    super.initState();
    this.authRepository = AuthRepository();
    this.registerBloc = RegisterBloc(authRepository: this.authRepository);
    this.authenticationBloc =
        AuthenticationBloc(authRepository: this.authRepository);
  }

  @override
  void dispose() {
    super.dispose();
    this.registerBloc.close();
    this.authenticationBloc.close();
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
        body: BlocListener<RegisterBloc, RegisterState>(
          bloc: this.registerBloc,
          listener: (context, state) {
            if (state is RegisterSuccessfull)
              Navigator.of(context)
                  .pushNamed(nextRegisterRoute, arguments: this.email);
            else if (state is RegisterFailed)
              Common().showFlushBar(context: context, message: state.errorText);
          },
          child: BlocBuilder<RegisterBloc, RegisterState>(
            bloc: this.registerBloc,
            builder: (context, state) {
              return Stack(
                children: <Widget>[
                  Opacity(
                    opacity: (state is RegisterLoading) ? 0.5 : 1,
                    child: RegisterForm(
                        changeEmailText: (emailText) =>
                            this.changeEmailText(emailText),
                        changePasswordText: (passwordText) =>
                            this.changePasswordText(passwordText),
                        registerButtonPressed: () =>
                            this.registerButtonPressed()),
                  ),
                  (state is RegisterLoading) ? LoadingProgress() : Container()
                ],
              );
            },
          ),
        ));
  }

  void changeEmailText(String email) {
    this.email = email;
  }

  void changePasswordText(String plainPassword) {
    this.plainPassword = plainPassword;
  }

  void registerButtonPressed() {
    this.registerBloc.add(RegisterPressed(
        email: this.email.trim(), password: this.plainPassword.trim()));
  }
}
