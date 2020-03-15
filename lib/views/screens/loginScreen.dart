import 'package:flutter/material.dart';
import 'package:westcardapp/businessLogic/blocs/auth/authenticationBloc/authentication_bloc.dart';
import 'package:westcardapp/businessLogic/blocs/auth/loginBloc/login_bloc.dart';
import 'package:westcardapp/businessLogic/repositories/authRepository.dart';
import 'package:westcardapp/routes/const_routes.dart';
import 'package:beauty_textfield/beauty_textfield.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

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
  }

  @override
  Widget build(BuildContext context) {
    return Material(
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
                      ),
                      Icon(Icons.arrow_forward, color: Colors.white)
                    ],
                  ),
                ),
              ),
              InkWell(
                child: Text('Aun no estoy registrado',
                    style: TextStyle(color: Colors.white, fontSize: 16.0)),
              ),
            ],
          ),
        ),
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
