import 'package:flutter/material.dart';
import 'package:westcardapp/models/cardModel.dart';
import 'package:westcardapp/views/components/navBar.dart';

class PreviewCard extends StatelessWidget {
  final CardModel cardModel;
  const PreviewCard({Key key, @required this.cardModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: Navbar(),
        ),
        body: Stack(children: <Widget>[
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
            child: Text('${cardModel.firstName} - ${cardModel.facebook}'),
          )
        ]));
  }
}
