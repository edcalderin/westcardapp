import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:westcardapp/businessLogic/blocs/auth/authenticationBloc/authentication_bloc.dart';
import 'package:westcardapp/businessLogic/blocs/auth/loginBloc/login_bloc.dart';
import 'package:westcardapp/businessLogic/repositories/authRepository.dart';
import 'package:westcardapp/views/components/loginForm.dart';

class LoginScreen extends StatelessWidget {
  final AuthRepository authRepository;
  LoginScreen({Key key, this.authRepository}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      child: BlocProvider(
          create: (context) => LoginBloc(
              authRepository: authRepository,
              authenticationBloc: BlocProvider.of<AuthenticationBloc>(context)),
          child: LoginForm(authRepository: authRepository)),
    );
  }
}
