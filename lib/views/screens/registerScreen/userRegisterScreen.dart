import 'package:flutter/material.dart';
import 'package:westcardapp/routes/const_routes.dart';
import 'package:westcardapp/views/screens/loginScreen.dart';

class UserRegisterScreen extends StatefulWidget {
  UserRegisterScreen({Key key}) : super(key: key);

  @override
  _UserRegisterScreenState createState() => _UserRegisterScreenState();
}

bool isSwitched = false;

class _UserRegisterScreenState extends State<UserRegisterScreen> {
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
                  'Registro de nuevo usuario',
                  style: TextStyle(fontSize: 18),
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
              //  mainAxisAlignment: MainAxisAlignment.center,
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      width: MediaQuery.of(context).size.width * 0.95,
                      //height: MediaQuery.of(context).size.height * 0.40,
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
                          // Row(
                          //   children: <Widget>[
                          //     Switch(
                          //       value: isSwitched,
                          //       onChanged: (value) {
                          //         setState(() {
                          //           isSwitched = value;
                          //           print(isSwitched);
                          //         });
                          //       },
                          //     ),
                          //     Text('¿Soy una persona?')
                          //   ],
                          // )
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
                    onPressed: () {
                      Navigator.pushNamed(context, nextRegisterRoute);
                    },
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
                      Navigator.pushNamed(context,loginRoute);
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
          ],
        ));
  }
}
