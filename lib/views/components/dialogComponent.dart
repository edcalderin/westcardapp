import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:westcardapp/models/cardModel.dart';
import 'package:westcardapp/views/components/navBar.dart';
import 'package:qr_flutter/qr_flutter.dart';

class DialogComponent extends StatelessWidget {
  final CardModel cardModel;
  const DialogComponent({@required this.cardModel});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: Navbar(),
        ),
        body: Container(
          margin: EdgeInsets.only(top: 40, right: 20, left: 20),
          child: Column(
            children: <Widget>[QrImage(data: jsonEncode(cardModel))],
          ),
        ));
  }
}
