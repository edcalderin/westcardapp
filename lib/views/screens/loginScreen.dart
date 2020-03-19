import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:westcardapp/businessLogic/blocs/auth/authenticationBloc/authentication_bloc.dart';
import 'package:westcardapp/businessLogic/blocs/auth/loginBloc/login_bloc.dart';
import 'package:westcardapp/businessLogic/repositories/authRepository.dart';
import 'package:westcardapp/routes/const_routes.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

<<<<<<< HEAD
class _LoginScreenState extends State<LoginScreen> {
  AuthenticationBloc authenticationBloc;
  AuthRepository authRepository;
  String email, plainPassword;
  @override
  void initState() {
    super.initState();
    this.authRepository = AuthRepository();
    this.authenticationBloc =
        AuthenticationBloc(authRepository: authRepository);
=======
class _loginScreenState extends State<LoginScreen> {
  TextEditingController _controller;

  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
>>>>>>> 03e6b5e3f7b6ce2b2a45308c9bdde9cf6c52f81b
  }

  @override
  Widget build(BuildContext context) {
    return Material(
<<<<<<< HEAD
      child: Container(
        color: Color.fromARGB(255, 24, 188, 156),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 5),
                height: 80,
                width: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: ExactAssetImage('lib/assets/main-icon.png'),
                      fit: BoxFit.fitWidth),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5, bottom: 5),
                child: Text('Westercardapp',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.w500)),
              ),
              Container(
                margin: EdgeInsets.only(top: 0, bottom: 10),
                child: Text(
                  'Inicio de sesión',
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 0),
                child: BeautyTextfield(
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: 50,
                  cornerRadius: BorderRadius.circular(5),
                  duration: Duration(milliseconds: 300),
                  inputType: TextInputType.text,
                  prefixIcon: Icon(Icons.assignment_ind, color: Colors.black),
                  placeholder: 'e-mail',
                  textColor: Colors.grey,
                  onTap: () {
                    print('Click');
                  },
                  onChanged: (text) {
                    this.email = text;
                  },
                  onSubmitted: (data) {
                    print(data.length);
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 0, bottom: 10),
                child: BeautyTextfield(
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: 50,
                  cornerRadius: BorderRadius.circular(5),
                  duration: Duration(milliseconds: 300),
                  inputType: TextInputType.text,
                  prefixIcon: Icon(Icons.lock_outline, color: Colors.grey),
                  suffixIcon: Icon(Icons.remove_red_eye, color: Colors.grey),
                  placeholder: 'Contraseña',
                  textColor: Colors.grey,
                  onTap: () {
                    print('Click');
                  },
                  onChanged: (text) {
                    this.plainPassword = text;
                  },
                  onSubmitted: (data) {
                    print(data.length);
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 0, bottom: 10),
                height: 55,
                width: MediaQuery.of(context).size.width * 0.95,
                child: RaisedButton(
                  color: Color.fromARGB(255, 44, 62, 80),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  onPressed: () => this.signInOnPress(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Ingresar',
                          style:
                              TextStyle(fontSize: 20.0, color: Colors.white)),
                      SizedBox(
                        width: 10,
=======
      child: Stack(
        children: <Widget>[
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image(
                  image: AssetImage('lib/assets/fondo_1.jpg'),
                  fit: BoxFit.none),
            ),
          ),
          Center(
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
                      child: TextField(
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
>>>>>>> 03e6b5e3f7b6ce2b2a45308c9bdde9cf6c52f81b
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
                      child: TextField(
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
                      onPressed: () {
                        Navigator.pushNamed(context, homeScreenRoute);
                      },
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
                    onTap: () {
                      Navigator.pushNamed(context, userRegisterRoute);
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    child: Text('¿Olvidaste tu contraseña?',
                        style: TextStyle(color: Colors.white, fontSize: 16.0)),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void signInOnPress() {
    LoginBloc(
            authRepository: this.authRepository,
            authenticationBloc: this.authenticationBloc)
        .add(SignInPressed(email: this.email, password: this.plainPassword));
  }
}
