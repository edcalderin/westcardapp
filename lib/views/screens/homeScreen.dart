import 'package:flutter/material.dart';
import 'package:westcardapp/views/components/navBar.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: Navbar(),
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
          Container(
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.3)),
          ),
          Container(
            margin: EdgeInsets.only(top: 40, right: 20, left: 20),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: Colors.white,
                        onTap: () {
                          print("");
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border(
                                top: BorderSide(
                                    width: 3.0,
                                    color: Color.fromARGB(255, 45, 62, 80)),
                                left: BorderSide(
                                    width: 3.0,
                                    color: Color.fromARGB(255, 45, 62, 80)),
                                right: BorderSide(
                                    width: 3.0,
                                    color: Color.fromARGB(255, 45, 62, 80)),
                                bottom: BorderSide(
                                    width: 3.0,
                                    color: Color.fromARGB(255, 45, 62, 80)),
                              )),
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(top: 14, bottom: 14),
                                child: Icon(
                                  Icons.portrait,
                                  size: 100,
                                  color: Colors.white,
                                ),
                              ),
                              Container(
                                height: 40,
                                width: 160,
                                color: Color.fromARGB(255, 45, 62, 80),
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 8),
                                  child: Text(
                                    'Mis Tarjetas',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: Colors.white,
                        onTap: () {
                          print("tapped");
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border(
                                top: BorderSide(
                                    width: 3.0,
                                    color: Color.fromARGB(255, 45, 62, 80)),
                                left: BorderSide(
                                    width: 3.0,
                                    color: Color.fromARGB(255, 45, 62, 80)),
                                right: BorderSide(
                                    width: 3.0,
                                    color: Color.fromARGB(255, 45, 62, 80)),
                                bottom: BorderSide(
                                    width: 3.0,
                                    color: Color.fromARGB(255, 45, 62, 80)),
                              )),
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(top: 14, bottom: 14),
                                child: Icon(
                                  Icons.share,
                                  size: 100,
                                  color: Colors.white,
                                ),
                              ),
                              Container(
                                height: 40,
                                width: 160,
                                color: Color.fromARGB(255, 45, 62, 80),
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 8),
                                  child: Text(
                                    'Mis Almacen',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: Colors.white,
                        onTap: () {
                          print("tapped");
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border(
                                top: BorderSide(
                                    width: 3.0,
                                    color: Color.fromARGB(255, 45, 62, 80)),
                                left: BorderSide(
                                    width: 3.0,
                                    color: Color.fromARGB(255, 45, 62, 80)),
                                right: BorderSide(
                                    width: 3.0,
                                    color: Color.fromARGB(255, 45, 62, 80)),
                                bottom: BorderSide(
                                    width: 3.0,
                                    color: Color.fromARGB(255, 45, 62, 80)),
                              )),
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(top: 14, bottom: 14),
                                child: Icon(
                                  Icons.add,
                                  size: 100,
                                  color: Colors.white,
                                ),
                              ),
                              Container(
                                height: 40,
                                width: 160,
                                color: Color.fromARGB(255, 45, 62, 80),
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 8),
                                  child: Text(
                                    'Nueva Tarjeta',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: Colors.white,
                        onTap: () {
                          print("tapped");
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border(
                                top: BorderSide(
                                    width: 3.0,
                                    color: Color.fromARGB(255, 45, 62, 80)),
                                left: BorderSide(
                                    width: 3.0,
                                    color: Color.fromARGB(255, 45, 62, 80)),
                                right: BorderSide(
                                    width: 3.0,
                                    color: Color.fromARGB(255, 45, 62, 80)),
                                bottom: BorderSide(
                                    width: 3.0,
                                    color: Color.fromARGB(255, 45, 62, 80)),
                              )),
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(top: 14, bottom: 14),
                                child: Icon(
                                  Icons.border_clear,
                                  size: 100,
                                  color: Colors.white,
                                ),
                              ),
                              Container(
                                height: 40,
                                width: 160,
                                color: Color.fromARGB(255, 45, 62, 80),
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 8),
                                  child: Text(
                                    'Escanear QR',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
