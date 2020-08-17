import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:westcardapp/views/components/builderCardsComponent.dart';
import 'package:westcardapp/views/components/navBar.dart';

class CreateCardScreen extends StatefulWidget {
  CreateCardScreen({Key key}) : super(key: key);

  @override
  _CreateCardScreenState createState() => _CreateCardScreenState();
}

class _CreateCardScreenState extends State<CreateCardScreen> {
  Future<List<Map<String, dynamic>>> getCardItems() async {
    var assetItems =
        await DefaultAssetBundle.of(context).loadString('lib/views/cards.json');
    var cardsDecoded = json.decode(assetItems).cast<Map<String, dynamic>>();
    return cardsDecoded;
  }

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
            child:
                //Column(
                //   children: <Widget>[
                // Padding(
                //   padding: const EdgeInsets.only(top: 30.0),
                //   child: Text(
                //     'Seleccione una plantilla para la nueva tarjeta.',
                //     textAlign: TextAlign.center,
                //     style: TextStyle(
                //         color: Color.fromARGB(255, 45, 62, 80),
                //         fontSize: 18,
                //         fontWeight: FontWeight.w500),
                //   ),
                // ),
                FutureBuilder(
                    future: getCardItems(),
                    builder: (context, snapshot) {
                      return BuilderCardsComponent(mapCards: snapshot.data);
                    }),
            // ],
            // ),
          )
        ],
      ),
    );
  }
}
