import 'package:flutter/material.dart';
import 'package:westcardapp/routes/const_routes.dart';
import 'package:westcardapp/routes/index.dart';
import 'package:westcardapp/views/components/navBar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '',
        theme: ThemeData(
        primarySwatch: Colors.blue,
        ),
        onGenerateRoute: Router.generateRoutes,
        initialRoute: loginRoute);
       
  }
}
