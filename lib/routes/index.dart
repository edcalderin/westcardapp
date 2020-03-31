import 'package:flutter/material.dart';
import 'package:westcardapp/views/screens/homeScreen.dart';
import 'package:westcardapp/views/screens/loginScreen.dart';
import 'package:westcardapp/views/screens/myCardsScreen.dart';
import 'package:westcardapp/views/screens/registerScreen/nextRegisterScreen.dart';
import 'package:westcardapp/views/screens/registerScreen/registerConfirmScreen.dart';
import 'package:westcardapp/views/screens/registerScreen/userRegisterScreen.dart';
import 'package:westcardapp/views/screens/sharedCardsScreen.dart';
import 'package:westcardapp/views/screens/userProfileScreen.dart';
import 'const_routes.dart';

class Router {
  static Route<dynamic> generateRoutes(RouteSettings routeSettings) {
    final arguments = routeSettings.arguments;
    switch (routeSettings.name) {
      case loginRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case homeScreenRoute:
        return MaterialPageRoute(builder: (_) => HomeScreen());
        break;
      case userRegisterRoute:
        return MaterialPageRoute(builder: (_) => UserRegisterScreen());
        break;
      case nextRegisterRoute:
        return MaterialPageRoute(
            builder: (_) => NextRegisterScreen(email: arguments));
        break;
      case registerConfirmRoute:
        return MaterialPageRoute(builder: (_) => RegisterConfirmScreen());
        break;
      case userProfileRoute:
        return MaterialPageRoute(builder: (_) => UserProfileScreen());
        break;
      case myCardsRoute:
        return MaterialPageRoute(builder: (_) => MyCardsScreen());
        break;
      case sharedCardsRoute:
        return MaterialPageRoute(builder: (_) => SharerdCardsScreen());
        break;
      default:
        return MaterialPageRoute(
            builder: (_) =>
                Scaffold(body: Text('No se encontró la ruta definida')));
    }
  }
}
