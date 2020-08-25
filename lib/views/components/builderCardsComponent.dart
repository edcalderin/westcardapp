import 'package:flutter/material.dart';

class BuilderCardsComponent extends StatelessWidget {
  final List<Map<String, dynamic>> mapCards;

  BuilderCardsComponent({@required this.mapCards});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: mapCards.length,
        itemBuilder: (context, index) {
          var cardInfo = mapCards[index];
          List<Row> cardView = getCardsColor(cardInfo);
          return Column(
            children: cardView,
          );
        });
  }

  List<Row> getCardsColor(dynamic cardInfo) {
    List<Row> cards = List<Row>();
    var fieldsMap = cardInfo['fields'];
    var cardName = cardInfo['cardName'];
    for (var element in cardInfo['colors']) {
      cards.add(Row(
        children: [
          Expanded(
            child: Column(
              children: <Widget>[
                Container(
                  child: Text(
                    cardInfo['cardName'],
                    style: TextStyle(
                        color: Color.fromRGBO(50, 75, 99, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child: Stack(
                    children: <Widget>[
                      Image(
                        image: AssetImage(
                            //   'lib/assets/freeCards/card1/blue.png'),
                            'lib/assets/freeCards/$cardName/$element.png'),
                      ),
                      Positioned(
                          child: Row(children: [
                            Text("nombre", style: TextStyle(color: Colors.red)),
                            SizedBox(width: 5),
                            Text("apellido")
                          ]),
                          left: fieldsMap['lastname']['left'],
                          bottom: fieldsMap['lastname']['bottom']),
                      Positioned(
                          child: Text("cargo"),
                          left: fieldsMap['position']['left'],
                          bottom: fieldsMap['position']['bottom']),
                      Positioned(
                          child: Text("telefono"),
                          left: fieldsMap['phone']['left'],
                          bottom: fieldsMap['phone']['bottom']),
                      Positioned(
                          child: Text("direccion"),
                          left: fieldsMap['address']['left'],
                          bottom: fieldsMap['address']['bottom']),
                      Positioned(
                          child: Text("web"),
                          left: fieldsMap['web']['left'],
                          bottom: fieldsMap['web']['bottom']),
                      Positioned(
                          child: Text("Email"),
                          left: fieldsMap['email']['left'],
                          bottom: fieldsMap['email']['bottom']),
                      Positioned(
                          child: Text(
                            "Empresa",
                            style: TextStyle(color: Colors.white),
                          ),
                          left: fieldsMap['company']['left'],
                          bottom: fieldsMap['company']['bottom']),
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
                SizedBox(height: 15.0)
              ],
            ),
          ),
        ],
      ));
    }
    return cards;
  }
}
