import 'package:flutter/material.dart';
import 'package:westcardapp/views/screens/homeScreen.dart';
import 'package:westcardapp/views/screens/loginScreen.dart';
import 'package:westcardapp/views/screens/myCardsScreen.dart';
import 'package:westcardapp/views/screens/previewCard.dart';
import 'package:westcardapp/views/screens/profile/userProfileScreen.dart';
import 'package:westcardapp/views/screens/registerScreen/activateAccountScreen.dart';
import 'package:westcardapp/views/screens/registerScreen/userRegisterScreen.dart';
import 'package:westcardapp/views/screens/sharedCardsScreen.dart';
import 'const_routes.dart';

class Router {
  static Route<dynamic> generateRoutes(RouteSettings routeSettings) {
    final arguments = routeSettings.arguments;
    switch (routeSettings.name) {
      case loginRoute:
        return MaterialPageRoute(
            builder: (_) => LoginScreen(authRepository: arguments));
        break;
      case homeScreenRoute:
        return MaterialPageRoute(builder: (_) => HomeScreen());
        break;
      case userRegisterRoute:
        return MaterialPageRoute(
            builder: (context) =>
                UserRegisterScreen(authRepository: arguments));
        break;
      case activationRoute:
        return MaterialPageRoute(
            builder: (context) =>
                ActivateAccountScreen(activationParams: arguments));
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
      case previewCardRoute:
        return MaterialPageRoute(
            builder: (_) => PreviewCard(cardModel: arguments));
        break;
      default:
        return MaterialPageRoute(
            builder: (_) =>
                Scaffold(body: Text('No se encontró la ruta definida')));
    }
  }
}
