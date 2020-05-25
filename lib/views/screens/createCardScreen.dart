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
                          image: AssetImage('lib/assets/freeCards/1.png'),
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
                          image: AssetImage('lib/assets/freeCards/2.png'),
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
                          image: AssetImage('lib/assets/freeCards/3.png'),
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
                          image: AssetImage('lib/assets/freeCards/4.png'),
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
                          image: AssetImage('lib/assets/freeCards/5.png'),
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
                          image: AssetImage('lib/assets/freeCards/6.png'),
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
                          image: AssetImage('lib/assets/freeCards/7.png'),
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
                          image: AssetImage('lib/assets/freeCards/8.png'),
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
                          image: AssetImage('lib/assets/freeCards/9.png'),
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
                          image: AssetImage('lib/assets/freeCards/10.png'),
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
                          image: AssetImage('lib/assets/freeCards/11.png'),
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
                          image: AssetImage('lib/assets/freeCards/12.png'),
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
                          image: AssetImage('lib/assets/freeCards/13.png'),
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
                          image: AssetImage('lib/assets/freeCards/14.png'),
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
                          image: AssetImage('lib/assets/freeCards/15.png'),
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
                          image: AssetImage('lib/assets/freeCards/16.png'),
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
                          image: AssetImage('lib/assets/freeCards/17.png'),
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
                          image: AssetImage('lib/assets/freeCards/18.png'),
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
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
