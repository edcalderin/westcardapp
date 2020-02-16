import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/box.dart';

class loginScreen extends StatefulWidget {
  loginScreen({Key key}) : super(key: key);

  @override
  _loginScreenState createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Color.fromARGB(255, 24, 188, 156),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: ExactAssetImage('lib/assets/main-icon.png'),
                      fit: BoxFit.cover),
                ),
              ),
              Container(
                child: Text('Westercardapp',
                    style: TextStyle(color: Colors.white, fontSize: 20.0)),
              ),
              Container(
                child: Text(
                  'Inicio de sesión',
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
              ),
              Container(
                child: TextField(
                  //obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'e-mail',
                  ),
                ),
              ),
              Container(
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'contraseña',
                    
                  ),
                ),
              ),
              Container(
                child: RaisedButton(
                  color: Color.fromARGB(255, 44, 62, 80),
                  onPressed: () {},
                  child: Row(
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
}
