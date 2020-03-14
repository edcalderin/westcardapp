import 'package:flutter/material.dart';
import 'package:westcardapp/routes/const_routes.dart';

class RegisterConfirmScreen extends StatefulWidget {
  RegisterConfirmScreen({Key key}) : super(key: key);

  @override
  _RegisterConfirmScreenState createState() => _RegisterConfirmScreenState();
}

class _RegisterConfirmScreenState extends State<RegisterConfirmScreen> {
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
                  'Confirmacion de registro',
                  style: TextStyle(fontSize: 16),
                )),
          ],
        ),
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/assets/fondo_1.jpg'),
                  fit: BoxFit.none,
                ),
              ),
            ),
            Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 30, bottom: 20),
                  child: Text(
                    '¡Felicitaciones, su registro ha finalizado con éxito!',
                    style: TextStyle(
                        fontSize: 22, color: Color.fromARGB(255, 24, 188, 156)),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15, bottom: 5),
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.30,
                  child: RaisedButton(
                    color: Color.fromARGB(255, 24, 188, 156),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    onPressed: () {
                      Navigator.pushNamed(context, nextRegisterRoute);
                    },
                    child: Text('Ir al inicio',
                        style: TextStyle(fontSize: 20.0, color: Colors.white)),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
