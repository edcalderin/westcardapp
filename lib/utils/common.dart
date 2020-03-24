import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Common {
  void showFlushBar(
      {@required BuildContext context, @required String message}) {
    Flushbar(
        flushbarPosition: FlushbarPosition.BOTTOM,
        duration: Duration(seconds: 2),
        backgroundColor: Colors.white,
        isDismissible: true,
        messageText: Text(message))
      ..show(context);
  }
}
