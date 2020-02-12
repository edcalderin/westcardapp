import 'package:flutter/material.dart';

class loginScreen extends StatefulWidget {
  loginScreen({Key key}) : super(key: key);

  @override
  _loginScreenState createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color.fromARGB(255, 24, 188, 156),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text('icono'),
            ],
          ),
          Row(
            children: <Widget>[
              Text('Inicio de sesion'),
            ],
          ),
          Row(
            children: <Widget>[
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'e-mail',
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'contraseña',
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              RaisedButton(
                onPressed: () {},
                child: const Text('ingresar',
                    style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
          Row(
            children: <Widget>[Text('aun no estoy registrado')],
          ),
        ],
      ),
    );
  }
}
