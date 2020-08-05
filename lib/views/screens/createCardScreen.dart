import 'package:flutter/material.dart';
import 'package:westcardapp/views/components/navBar.dart';

class CreateCardScreen extends StatefulWidget {
  CreateCardScreen({Key key}) : super(key: key);

  @override
  _CreateCardScreenState createState() => _CreateCardScreenState();
}

class _CreateCardScreenState extends State<CreateCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.0),
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
            color: Colors.white.withOpacity(0.5),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 26),
            width: MediaQuery.of(context).size.width * 0.90,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Text(
                      'Seleccione una plantilla para la nueva tarjeta.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromARGB(255, 45, 62, 80),
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    child: Text('Tarjeta 1 Azul'),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    child: Stack(
                      children: <Widget>[
                        Image(
                          image: AssetImage(
                              'lib/assets/freeCards/tarjeta_1/azul.png'),
                        ),
                        Positioned.fill(
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Container(
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: <Widget>[
                  //       IconButton(
                  //         icon: Icon(Icons.share),
                  //         tooltip: 'Compartir',
                  //         onPressed: () {},
                  //       ),
                  //       IconButton(
                  //         icon: Icon(Icons.delete, color: Colors.red),
                  //         tooltip: 'Borrar',
                  //         onPressed: () {},
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  SizedBox(height: 15.0),
                  Container(
                    child: Text('tarjeta 1 Verde'),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15.0),
                    child: Stack(
                      children: <Widget>[
                        Image(
                          image: AssetImage(
                              'lib/assets/freeCards/tarjeta_1/verde.png'),
                        ),
                        Positioned.fill(
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Container(
                    child: Text('tarjeta 1 Roja'),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15.0),
                    child: Stack(
                      children: <Widget>[
                        Image(
                          image: AssetImage(
                              'lib/assets/freeCards/tarjeta_1/rojo.png'),
                        ),
                        Positioned.fill(
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Container(
                    child: Text('tarjeta 2 Azul'),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15.0),
                    child: Stack(
                      children: <Widget>[
                        Image(
                          image: AssetImage(
                              'lib/assets/freeCards/tarjeta_2/azul.png'),
                        ),
                        Positioned.fill(
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Container(
                    child: Text('tarjeta 2 Verde'),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15.0),
                    child: Stack(
                      children: <Widget>[
                        Image(
                          image: AssetImage(
                              'lib/assets/freeCards/tarjeta_2/verde.png'),
                        ),
                        Positioned.fill(
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Container(
                    child: Text('tarjeta 2 Roja'),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15.0),
                    child: Stack(
                      children: <Widget>[
                        Image(
                          image: AssetImage(
                              'lib/assets/freeCards/tarjeta_2/rojo.png'),
                        ),
                        Positioned.fill(
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    child: Text('tarjeta 3 Azul'),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15.0),
                    child: Stack(
                      children: <Widget>[
                        Image(
                          image: AssetImage(
                              'lib/assets/freeCards/tarjeta_3/azul.png'),
                        ),
                        Positioned.fill(
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    child: Text('tarjeta 3 Verde'),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15.0),
                    child: Stack(
                      children: <Widget>[
                        Image(
                          image: AssetImage(
                              'lib/assets/freeCards/tarjeta_3/verde.png'),
                        ),
                        Positioned.fill(
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    child: Text('tarjeta 3 Roja'),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15.0),
                    child: Stack(
                      children: <Widget>[
                        Image(
                          image: AssetImage(
                              'lib/assets/freeCards/tarjeta_3/rojo.png'),
                        ),
                        Positioned.fill(
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    child: Text('tarjeta 4 Azul'),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15.0),
                    child: Stack(
                      children: <Widget>[
                        Image(
                          image: AssetImage(
                              'lib/assets/freeCards/tarjeta_4/azul.png'),
                        ),
                        Positioned.fill(
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    child: Text('tarjeta 4 Verde'),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15.0),
                    child: Stack(
                      children: <Widget>[
                        Image(
                          image: AssetImage(
                              'lib/assets/freeCards/tarjeta_4/verde.png'),
                        ),
                        Positioned.fill(
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    child: Text('tarjeta 4 Roja'),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15.0),
                    child: Stack(
                      children: <Widget>[
                        Image(
                          image: AssetImage(
                              'lib/assets/freeCards/tarjeta_4/rojo.png'),
                        ),
                        Positioned.fill(
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    child: Text('tarjeta 5 Azul'),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15.0),
                    child: Stack(
                      children: <Widget>[
                        Image(
                          image: AssetImage(
                              'lib/assets/freeCards/tarjeta_5/azul.png'),
                        ),
                        Positioned.fill(
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    child: Text('tarjeta 5 Verde'),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15.0),
                    child: Stack(
                      children: <Widget>[
                        Image(
                          image: AssetImage(
                              'lib/assets/freeCards/tarjeta_5/verde.png'),
                        ),
                        Positioned.fill(
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    child: Text('tarjeta 5 Roja'),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15.0),
                    child: Stack(
                      children: <Widget>[
                        Image(
                          image: AssetImage(
                              'lib/assets/freeCards/tarjeta_5/rojo.png'),
                        ),
                        Positioned.fill(
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    child: Text('tarjeta 6 Azul'),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15.0),
                    child: Stack(
                      children: <Widget>[
                        Image(
                          image: AssetImage(
                              'lib/assets/freeCards/tarjeta_6/azul.png'),
                        ),
                        Positioned.fill(
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    child: Text('tarjeta 6 Verde'),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15.0),
                    child: Stack(
                      children: <Widget>[
                        Image(
                          image: AssetImage(
                              'lib/assets/freeCards/tarjeta_6/verde.png'),
                        ),
                        Positioned.fill(
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    child: Text('tarjeta 6 Roja'),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15.0),
                    child: Stack(
                      children: <Widget>[
                        Image(
                          image: AssetImage(
                              'lib/assets/freeCards/tarjeta_6/rojo.png'),
                        ),
                        Positioned.fill(
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Text('tarjeta 1'),
                        ),
                        Chip(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          backgroundColor: Colors.red,
                          label: Text('PRO'),
                          labelStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 15.0),
                    child: Stack(
                      children: <Widget>[
                        Image(
                          image: AssetImage('lib/assets/premiumCards/1.jpg'),
                        ),
                        Positioned.fill(
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Text('tarjeta 2'),
                        ),
                        Chip(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          backgroundColor: Colors.red,
                          label: Text('PRO'),
                          labelStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 15.0),
                    child: Stack(
                      children: <Widget>[
                        Image(
                          image: AssetImage('lib/assets/premiumCards/2.jpg'),
                        ),
                        Positioned.fill(
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Text('tarjeta 3'),
                        ),
                        Chip(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          backgroundColor: Colors.red,
                          label: Text('PRO'),
                          labelStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 15.0),
                    child: Stack(
                      children: <Widget>[
                        Image(
                          image: AssetImage('lib/assets/premiumCards/3.jpg'),
                        ),
                        Positioned.fill(
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Text('tarjeta 4'),
                        ),
                        Chip(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          backgroundColor: Colors.red,
                          label: Text('PRO'),
                          labelStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 15.0),
                    child: Stack(
                      children: <Widget>[
                        Image(
                          image: AssetImage('lib/assets/premiumCards/4.jpg'),
                        ),
                        Positioned.fill(
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Text('tarjeta 5'),
                        ),
                        Chip(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          backgroundColor: Colors.red,
                          label: Text('PRO'),
                          labelStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 15.0),
                    child: Stack(
                      children: <Widget>[
                        Image(
                          image: AssetImage('lib/assets/premiumCards/5.jpg'),
                        ),
                        Positioned.fill(
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Text('tarjeta 6'),
                        ),
                        Chip(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          backgroundColor: Colors.red,
                          label: Text('PRO'),
                          labelStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 15.0),
                    child: Stack(
                      children: <Widget>[
                        Image(
                          image: AssetImage('lib/assets/premiumCards/6.jpg'),
                        ),
                        Positioned.fill(
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Text('tarjeta 7'),
                        ),
                        Chip(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          backgroundColor: Colors.red,
                          label: Text('PRO'),
                          labelStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 15.0),
                    child: Stack(
                      children: <Widget>[
                        Image(
                          image: AssetImage('lib/assets/premiumCards/7.jpg'),
                        ),
                        Positioned.fill(
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Text('tarjeta 8'),
                        ),
                        Chip(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          backgroundColor: Colors.red,
                          label: Text('PRO'),
                          labelStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 15.0),
                    child: Stack(
                      children: <Widget>[
                        Image(
                          image: AssetImage('lib/assets/premiumCards/8.jpg'),
                        ),
                        Positioned.fill(
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Text('tarjeta 9'),
                        ),
                        Chip(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          backgroundColor: Colors.red,
                          label: Text('PRO'),
                          labelStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 15.0),
                    child: Stack(
                      children: <Widget>[
                        Image(
                          image: AssetImage('lib/assets/premiumCards/9.jpg'),
                        ),
                        Positioned.fill(
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Text('tarjeta 10'),
                        ),
                        Chip(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          backgroundColor: Colors.red,
                          label: Text('PRO'),
                          labelStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 15.0),
                    child: Stack(
                      children: <Widget>[
                        Image(
                          image: AssetImage('lib/assets/premiumCards/10.jpg'),
                        ),
                        Positioned.fill(
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
