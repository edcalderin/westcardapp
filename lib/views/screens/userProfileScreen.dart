import 'package:flutter/material.dart';
import 'package:westcardapp/views/components/navBar.dart';

class UserProfileScreen extends StatefulWidget {
  UserProfileScreen({Key key}) : super(key: key);

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
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
            color: Colors.white.withOpacity(0.3),
          )
        ],
      ),
    );
  }
}
