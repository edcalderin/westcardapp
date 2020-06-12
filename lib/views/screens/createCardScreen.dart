import 'package:flutter/material.dart';
import 'package:westcardapp/routes/const_routes.dart';
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
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20.0),
                    child: Stack(
                      children: <Widget>[
                        Image(
                          image: AssetImage('lib/assets/freeCards/tarjeta_1/verde.png'),
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
                  SizedBox(height: 40.0),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20.0),
                    child: Stack(
                      children: <Widget>[
                        Image(
                          image: AssetImage('lib/assets/freeCards/tarjeta_2/verde.png'),
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
                  SizedBox(height: 40.0),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20.0),
                    child: Stack(
                      children: <Widget>[
                        Image(
                          image: AssetImage('lib/assets/freeCards/tarjeta_3/verde.png'),
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
                  SizedBox(height: 40.0),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20.0),
                    child: Stack(
                      children: <Widget>[
                        Image(
                          image: AssetImage('lib/assets/freeCards/tarjeta_4/verde.png'),
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
                  SizedBox(height: 40.0),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20.0),
                    child: Stack(
                      children: <Widget>[
                        Image(
                          image: AssetImage('lib/assets/freeCards/tarjeta_5/verde.png'),
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
                  SizedBox(height: 40.0),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20.0),
                    child: Stack(
                      children: <Widget>[
                        Image(
                          image: AssetImage('lib/assets/freeCards/tarjeta_6/verde.png'),
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
