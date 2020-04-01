import 'package:flutter/material.dart';
import 'package:westcardapp/routes/const_routes.dart';

class LoginForm extends StatelessWidget {
  String email;
  String plainPassword;
  Function buttonPressed;
  Function changeEmailText;
  Function changePasswordText;
  LoginForm(
      {@required this.changeEmailText,
      @required this.changePasswordText,
      @required this.email,
      @required this.plainPassword,
      @required this.buttonPressed});

  @override
  Widget build(BuildContext context) {
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
                      onChanged: (emailText) => this.changeEmailText(emailText),
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
                    child: TextField(
                      onChanged: (plainPasswordText) =>
                          this.changePasswordText(plainPasswordText),
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
                    onPressed: () => this.buttonPressed(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Ingresar',
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.white)),
                        Icon(Icons.arrow_right, size: 40, color: Colors.white),
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
                  onTap: () =>
                      Navigator.of(context).pushNamed(userRegisterRoute),
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
                  onTap: () =>
                      Navigator.of(context).pushNamed(nextRegisterRoute),
                  child: Text('Activar cuenta',
                      style: TextStyle(color: Colors.white, fontSize: 16.0)),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}