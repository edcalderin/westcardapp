import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: SvgPicture.asset(
      'lib/assets/SplashScreen.svg',
    ));
  }
}
