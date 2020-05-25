import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:westcardapp/businessLogic/blocs/auth/loginBloc/login_bloc.dart';
import 'package:westcardapp/businessLogic/repositories/authRepository.dart';
import 'package:westcardapp/models/activationParams.dart';
import 'package:westcardapp/routes/const_routes.dart';
import 'package:westcardapp/utils/common.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'loadingProgress.dart';

class LoginForm extends StatefulWidget {
  final AuthRepository authRepository;
  LoginForm({@required this.authRepository});
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  AuthRepository get authRepository => widget.authRepository;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController plainPasswordController = TextEditingController();
  bool keyboard;
  @override
  void initState() {
    super.initState();
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
    this.emailController.dispose();
    this.plainPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(listener: (context, state) {
      if (state is LoginFailed)
        Common().showFlushBar(context: context, message: state.errorText);
    }, child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return Stack(children: <Widget>[
        Opacity(
            opacity: (state is LoginLoading) ? 0.5 : 1,
            child: widgetLogin(context)),
        (state is LoginLoading) ? LoadingProgress() : Container()
      ]);
    }));
  }

  Widget widgetLogin(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image(
                image: AssetImage('lib/assets/fondo_1.jpg'), fit: BoxFit.none),
          ),
        ),
        Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(bottom: (keyboard) ? 210 : 0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.90,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    height: 100,
                    width: 130,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: ExactAssetImage('lib/assets/main-icon.png'),
                          fit: BoxFit.fill),
                    ),
                  ),
                  Text('WestCardApp',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w400)),
                  SizedBox(
                    height: 5,
                  ),
                  Text('Inicio de sesion',
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 40,
                    child: Theme(
                      data: Theme.of(context)
                          .copyWith(splashColor: Colors.transparent),
                      child: TextFormField(
                        validator: (direccion) {
                          if (direccion.isEmpty) {
                            return 'Debe ingresar direccion';
                          }
                        },
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        autofocus: false,
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Correo Electronico',
                          contentPadding: const EdgeInsets.only(
                              left: 20.0, bottom: 10, top: 10),
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
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    height: 35,
                    child: Theme(
                      data: Theme.of(context)
                          .copyWith(splashColor: Colors.transparent),
                      child: TextFormField(
                        controller: plainPasswordController,
                        obscureText: true,
                        autofocus: false,
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Contraseña',
                          contentPadding: const EdgeInsets.only(
                              left: 20.0, bottom: 10.0, top: 10.0),
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
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15, bottom: 5),
                    height: 36,
                    width: MediaQuery.of(context).size.width * 0.95,
                    child: RaisedButton(
                      elevation: 4,
                      color: Color.fromARGB(255, 45, 62, 80),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      onPressed: () => loginButtonPressed(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Ingresar',
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.white)),
                          Icon(Icons.arrow_right,
                              size: 40, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    child: Text('Aun no estoy registrado',
                        style: TextStyle(color: Colors.white, fontSize: 18.0)),
                    onTap: () => Navigator.of(context).pushNamed(
                        userRegisterRoute,
                        arguments: authRepository),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    child: Text('¿Olvidaste tu contraseña?',
                        style: TextStyle(color: Colors.white, fontSize: 16.0)),
                  ),
                  SizedBox(
                    height: 45,
                  ),
                  InkWell(
                    onTap: () => Navigator.of(context).pushNamed(
                        activationRoute,
                        arguments:
                            ActivationParams(authRepository: authRepository)),
                    child: Text('Activar cuenta',
                        style: TextStyle(color: Colors.white, fontSize: 16.0)),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  void loginButtonPressed() {
    BlocProvider.of<LoginBloc>(context).add(SignInPressed(
        email: emailController.text.trim().toLowerCase(),
        plainPassword: plainPasswordController.text));
  }
}
