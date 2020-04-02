import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:westcardapp/businessLogic/blocs/auth/authenticationBloc/authentication_bloc.dart';
import 'package:westcardapp/businessLogic/repositories/authRepository.dart';
import 'package:westcardapp/routes/const_routes.dart';
import 'package:westcardapp/routes/index.dart';
import 'package:westcardapp/views/screens/splashScreen.dart';

import 'views/screens/homeScreen.dart';
import 'views/screens/loginScreen.dart';

void main() => runApp(MyApp(authRepository: AuthRepository()));

class MyApp extends StatefulWidget {
  final AuthRepository authRepository;
  MyApp({@required this.authRepository});
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AuthenticationBloc authenticationBloc;
  AuthRepository get authRepository => widget.authRepository;
  @override
  void initState() {
    super.initState();
    authenticationBloc =
        AuthenticationBloc(authRepository: this.authRepository);
    authenticationBloc.add(AppStarted());
  }

  @override
  void dispose() {
    super.dispose();
    authenticationBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBloc>(
        create: (context) => authenticationBloc,
        child: MaterialApp(
            title: '',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            onGenerateRoute: Router.generateRoutes,
            home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
              bloc: authenticationBloc,
              builder: (context, state) {
                if (state is Uninitialized)
                  return SplashScreen();
                else if (state is Authenticated)
                  return HomeScreen();
                else
                  return LoginScreen();
              },
            )));
  }
}
