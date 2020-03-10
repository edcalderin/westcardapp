import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            'lib/assets/SplashScreen.png',
            fit: BoxFit.fill,
          ),
          Center(
              child: Padding(
            padding: EdgeInsets.only(top: 400.0),
            child: Text(
              'Espere...',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ))
        ],
      ),
    );
  }
}
