import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:westcardapp/routes/const_routes.dart';

class loginScreen extends StatefulWidget {
  loginScreen({Key key}) : super(key: key);

  @override
  _loginScreenState createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  TextEditingController _controller;

  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image(
                  image: AssetImage('lib/assets/fondo_1.jpg'),
                  fit: BoxFit.fill),
            ),
          ),
          SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 150),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 5),
                      height: 100,
                      width: 130,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: ExactAssetImage('lib/assets/main-icon.png'),
                            fit: BoxFit.fill),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5, bottom: 20),
                      child: Text('WesterCardApp',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                              fontWeight: FontWeight.w500)),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.70,
                      margin: EdgeInsets.only(top: 10, bottom: 0),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        strutStyle: StrutStyle(
                          fontSize: 30,
                        ),
                        decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            labelStyle:
                                TextStyle(color: Colors.white, fontSize: 20.0),
                            labelText: 'Nombre de Usuario',
                            // alignLabelWithHint:false ,
                            // hintText: 'Ingrese su e-mail',
                            hintStyle: TextStyle(
                                fontSize: 20.0, color: Colors.grey[200]),
                            fillColor: Colors.white,
                            prefixIcon: Icon(Icons.perm_identity,
                                color: Colors.white, size: 35)),
                        cursorColor: Colors.white,
                        controller: _controller,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.70,
                      margin: EdgeInsets.only(top: 10, bottom: 0),
                      child: TextFormField(
                        obscureText: true,
                        strutStyle: StrutStyle(
                          fontSize: 30,
                        ),
                        decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            labelStyle:
                                TextStyle(color: Colors.white, fontSize: 20.0),
                            labelText: 'Contraseña',
                            // alignLabelWithHint:false ,
                            // hintText: 'Ingrese su Contraseña',
                            hintStyle: TextStyle(
                                fontSize: 20.0, color: Colors.grey[200]),
                            fillColor: Colors.white,
                            prefixIcon: Icon(Icons.lock_outline,
                                color: Colors.white, size: 35)),
                        cursorColor: Colors.white,
                        controller: _controller,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30, bottom: 10),
                      height: 55,
                      width: MediaQuery.of(context).size.width * 0.60,
                      child: RaisedButton(
                        color: Colors.white,
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
                                    fontSize: 20.0,
                                    color: Color.fromARGB(255, 45, 62, 80))),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.arrow_forward,
                                color: Color.fromARGB(255, 45, 62, 80))
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      child: Text('Aun no estoy registrado',
                          style:
                              TextStyle(color: Colors.white, fontSize: 16.0)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
