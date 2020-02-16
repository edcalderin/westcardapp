
import 'package:flutter/material.dart';
import 'package:westcardapp/views/screens/login/loginScreen.dart';
import 'const_routes.dart';

class Router {
  static Route<dynamic> generateRoutes(RouteSettings routeSettings) {
    final arguments = routeSettings.arguments;
    switch (routeSettings.name) {
            case loginRoute:
        return MaterialPageRoute(builder: (_) => loginScreen());
      // case carouselRoute:
      //   return MaterialPageRoute(builder: (_) => CarouselScreen(arguments));
      //   break;
      default:
        return MaterialPageRoute(
            builder: (_) =>
                Scaffold(body: Text('No se encontró la ruta definida')));
    }
  }
}
