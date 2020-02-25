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
    return Stack(
      children: <Widget>[
        Container(
             width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
          child: Image(image: AssetImage('lib/assets/fondo_2.jpg')),
        ),
        Navbar(),
      ],
    );
  }
}
