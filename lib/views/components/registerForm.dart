import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:westcardapp/businessLogic/blocs/auth/registerBloc/register_bloc.dart';
import 'package:westcardapp/businessLogic/repositories/authRepository.dart';
import 'package:westcardapp/models/activationParams.dart';
import 'package:westcardapp/routes/const_routes.dart';
import 'package:westcardapp/utils/common.dart';

import 'loadingProgress.dart';

class RegisterForm extends StatefulWidget {
  final AuthRepository authRepository;

  RegisterForm({
    @required this.authRepository,
  });

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  RegisterBloc registerBloc;
  TextEditingController emailTextController;
  TextEditingController plainPasswordController;
  AuthRepository get authRepository => widget.authRepository;
  bool keyboard;
  @override
  void initState() {
    super.initState();
    this.registerBloc = RegisterBloc(authRepository: authRepository);
    this.emailTextController = TextEditingController();
    this.plainPasswordController = TextEditingController();
    keyboard = false;
    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        keyboard = visible;
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    this.registerBloc.close();
    this.emailTextController.dispose();
    this.plainPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      bloc: this.registerBloc,
      listener: (context, state) {
        if (state is RegisterSuccessfull)
          Navigator.of(context).pushNamed(activationRoute,
              arguments: ActivationParams(
                  email: emailTextController.text,
                  plainPassword: plainPasswordController.text,
                  authRepository: authRepository));
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
                child: registerForm(context),
              ),
              (state is RegisterLoading) ? LoadingProgress() : Container()
            ],
          );
        },
      ),
    );
  }

  Widget registerForm(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/assets/fondo_1.jpg'),
              fit: BoxFit.none,
            ),
          ),
        ),
        SingleChildScrollView(
          padding: EdgeInsets.only(bottom: (keyboard) ? 210 : 0),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 30, bottom: 20),
                child: Center(
                  child: Text('Ingrese sus datos para crear su usuario',
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              ),
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
                        Text('Informacion personal',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)),
                        SizedBox(
                          height: 15,
                        ),
                        Text('Email',
                            style:
                                TextStyle(color: Colors.white, fontSize: 16)),
                        Container(
                          margin: EdgeInsets.only(bottom: 15, top: 5),
                          height: 35,
                          child: Theme(
                            data: Theme.of(context)
                                .copyWith(splashColor: Colors.transparent),
                            child: TextField(
                              controller: emailTextController,
                              keyboardType: TextInputType.emailAddress,
                              autofocus: false,
                              style: TextStyle(
                                  fontSize: 22.0, color: Colors.black),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding: const EdgeInsets.only(
                                    left: 14.0, bottom: 8.0, top: 8.0),
                                  
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(18),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Text('Contraseña',
                            style:
                                TextStyle(color: Colors.white, fontSize: 16)),
                        Container(
                          margin: EdgeInsets.only(bottom: 10, top: 5),
                          height: 35,
                          child: Theme(
                            data: Theme.of(context)
                                .copyWith(splashColor: Colors.transparent),
                            child: TextField(
                              obscureText: true,
                              controller: plainPasswordController,
                              autofocus: false,
                              style: TextStyle(
                                  fontSize: 22.0, color: Colors.black),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding: const EdgeInsets.only(
                                    left: 14.0, bottom: 8.0, top: 8.0),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(18),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    )),
              ),
              Container(
                margin: EdgeInsets.only(top: 15, bottom: 5),
                height: 40,
                width: MediaQuery.of(context).size.width * 0.95,
                child: RaisedButton(
                  color: Color.fromARGB(255, 45, 62, 80),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  onPressed: () => this.registerButtonPressed(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Enviar informacion',
                          style:
                              TextStyle(fontSize: 18.0, color: Colors.white)),
                      Icon(Icons.arrow_right, size: 40, color: Colors.white),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5, bottom: 5),
                height: 40,
                width: MediaQuery.of(context).size.width * 0.95,
                child: RaisedButton(
                  color: Colors.grey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.arrow_left, size: 40, color: Colors.white),
                      Text('Cancelar     ',
                          style:
                              TextStyle(fontSize: 18.0, color: Colors.white)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void registerButtonPressed() {
    this.registerBloc.add(RegisterPressed(
        email: this.emailTextController.text.trim().toLowerCase(),
        password: this.plainPasswordController.text.trim().toLowerCase()));
  }
}
