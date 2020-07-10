import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:westcardapp/models/cardModel.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:westcardapp/utils/dialogTypes.dart' as dialogTypes;

class DialogComponent extends StatelessWidget {
  final CardModel cardModel;
  final String dialogType;
  final Function function;
  const DialogComponent(
      {this.cardModel, @required this.dialogType, @required this.function});

  String getBody() {
    switch (dialogType) {
      case dialogTypes.CONFIRM:
        return 'Has seleccionado la plantilla City Buildings';
        break;
      case dialogTypes.DELETE:
        return '¿Está seguro que desea eliminar ésta tarjeta?';
        break;
      case dialogTypes.DONE:
        return 'La nueva tarjeta ha sido agregada';
        break;
      default:
        break;
    }
  }

  Widget getButton(
      BuildContext context, String text, String color, Function function) {
    return RaisedButton(
      color: color == 'classic'
          ? Color.fromARGB(255, 45, 62, 80)
          : Color.fromARGB(255, 232, 77, 59),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      onPressed: function,
      child: Text(text, style: TextStyle(fontSize: 15.0, color: Colors.white)),
    );
  }

  List<Widget> getFooter(BuildContext context, Function function) {
    final double WIDTH_SIZE_BOX = 8;
    switch (dialogType) {
      case dialogTypes.QR:
        return [
          getButton(
              context, 'Listo!', 'classic', () => Navigator.of(context).pop())
        ];
        break;
      case dialogTypes.DONE:
        return [
          getButton(context, 'Entendido!', 'classic',
              () => Navigator.of(context).pop())
        ];
        break;
      case dialogTypes.DELETE:
        return [
          getButton(context, 'Si', 'orange', function),
          SizedBox(width: WIDTH_SIZE_BOX),
          getButton(context, 'No', 'classic', () => Navigator.of(context).pop())
        ];
        break;
      case dialogTypes.CONFIRM:
        return [
          getButton(context, 'Si!, es correcto', 'classic', function),
          SizedBox(width: WIDTH_SIZE_BOX),
          getButton(context, 'No!, quiero ver más', 'orange',
              () => Navigator.of(context).pop())
        ];
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    final cardModelJson = jsonEncode(cardModel.toJson());
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: MediaQuery.of(context).size.height *
            (dialogType == dialogTypes.QR ? 0.61 : 0.3),
        margin: EdgeInsets.only(top: 30, left: 10, right: 10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.0)),
        child: SizedBox.expand(
          child: Material(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        dialogType,
                        style: TextStyle(
                            fontSize: dialogType == dialogTypes.QR ? 18 : 20,
                            color: dialogType == dialogTypes.DONE
                                ? Color.fromRGBO(19, 189, 157, 1)
                                : Colors.grey[800]),
                        textAlign: TextAlign.left,
                      ),
                      IconButton(
                          icon: Icon(Icons.close),
                          color: Colors.grey[600],
                          onPressed: () => Navigator.of(context).pop(context),
                          iconSize: 17)
                    ],
                  ),
                ),
                Divider(),
                dialogType == dialogTypes.QR
                    ? QrImage(data: cardModelJson, size: 220)
                    : Padding(
                        padding: const EdgeInsets.symmetric(vertical: 9.0),
                        child: Text(
                          getBody(),
                          style: TextStyle(fontSize: 15.0),
                        ),
                      ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: getFooter(context, function)),
                )
              ])),
        ),
      ),
    );
  }
}
