import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:westcardapp/models/cardModel.dart';
import 'package:westcardapp/routes/const_routes.dart';
import 'package:westcardapp/views/components/dialogComponent.dart';
import 'package:westcardapp/views/components/navBar.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:westcardapp/utils/dialogTypes.dart' as dialogTypes;

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String barcode;
  @override
  void initState() {
    barcode = '';
    super.initState();
  }

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
                          Navigator.pushNamed(context, cardRoute,
                              arguments: 'Mis tarjetas');
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.40,
                          height: MediaQuery.of(context).size.width * 0.40,
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
                              Flexible(
                                flex: 3,
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.width * 0.30,
                                  child: Icon(
                                    Icons.portrait,
                                    size: 80,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.width * 0.10,
                                  width:
                                      MediaQuery.of(context).size.width * 0.40,
                                  color: Color.fromARGB(255, 45, 62, 80),
                                  child: Container(
                                    margin: EdgeInsets.symmetric(vertical: 8),
                                    child: Text(
                                      'Mis Tarjetas',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                      textAlign: TextAlign.center,
                                    ),
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
                          Navigator.pushNamed(context, sharedCardsRoute);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.40,
                          height: MediaQuery.of(context).size.width * 0.40,
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
                              Flexible(
                                flex: 3,
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.width * 0.30,
                                  child: Icon(
                                    Icons.share,
                                    size: 80,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.width * 0.10,
                                  width:
                                      MediaQuery.of(context).size.width * 0.40,
                                  color: Color.fromARGB(255, 45, 62, 80),
                                  child: Container(
                                    margin: EdgeInsets.symmetric(vertical: 8),
                                    child: Text(
                                      'Mi Almacen',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                      textAlign: TextAlign.center,
                                    ),
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
                          Navigator.pushNamed(context, cardRoute,
                              arguments:
                                  'Seleccione una plantilla para la nueva tarjeta.');
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.40,
                          height: MediaQuery.of(context).size.width * 0.40,
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
                              Flexible(
                                flex: 3,
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.width * 0.30,
                                  child: Icon(
                                    Icons.add,
                                    size: 80,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.width * 0.10,
                                  width:
                                      MediaQuery.of(context).size.width * 0.40,
                                  color: Color.fromARGB(255, 45, 62, 80),
                                  child: Container(
                                    margin: EdgeInsets.symmetric(vertical: 8),
                                    child: Text(
                                      'Nueva Tarjeta',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                      textAlign: TextAlign.center,
                                    ),
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
                        onTap: () => scan(),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.40,
                          height: MediaQuery.of(context).size.width * 0.40,
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
                              Flexible(
                                flex: 3,
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.width * 0.30,
                                  child: Icon(
                                    Icons.border_clear,
                                    size: 80,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.width * 0.10,
                                  width:
                                      MediaQuery.of(context).size.width * 0.40,
                                  color: Color.fromARGB(255, 45, 62, 80),
                                  child: Container(
                                    margin: EdgeInsets.symmetric(vertical: 8),
                                    child: Text(
                                      'Escanear QR',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                      textAlign: TextAlign.center,
                                    ),
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

  Future scan() async {
    try {
      final scanResult = await BarcodeScanner.scan(options: ScanOptions());
      final String barcode = scanResult.rawContent;
      final cardDecoded = jsonDecode(barcode);
      final CardModel cardModel = CardModel.fromJson(cardDecoded);
      Navigator.of(context).pushNamed(previewCardRoute, arguments: cardModel);
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.cameraAccessDenied) {
        setState(() {
          this.barcode = 'The user did not grant the camera permission!';
        });
      } else {
        setState(() => this.barcode = 'Unknown error: $e');
      }
    } on FormatException {
      setState(() => this.barcode =
          'null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
      setState(() => this.barcode = 'Unknown error: $e');
    }
  }

  void showQRDialog(BuildContext context) {
    CardModel cm = CardModel(
        cardType: 'tarjeta1',
        color: 'amarillo',
        firstName: 'Erick',
        lastName: 'Calderin',
        facebook: 'edcalderin');

    showGeneralDialog(
        context: context,
        barrierLabel: "Barrier",
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.5),
        transitionDuration: Duration(milliseconds: 100),
        pageBuilder: (_, __, ___) => DialogComponent(
              cardModel: cm,
              dialogType: dialogTypes.QR,
              function: () {},
            ));
  }
}
