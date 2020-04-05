import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:westcardapp/businessLogic/blocs/auth/authenticationBloc/authentication_bloc.dart';
import 'package:westcardapp/businessLogic/repositories/authRepository.dart';
import 'package:westcardapp/routes/index.dart';
import 'package:westcardapp/views/screens/splashScreen.dart';
import 'views/screens/homeScreen.dart';
import 'views/screens/loginScreen.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print(error);
  }
}

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final AuthRepository authRepository = AuthRepository();
  runApp(BlocProvider<AuthenticationBloc>(
    create: (context) =>
        AuthenticationBloc(authRepository: authRepository)..add(AppStarted()),
    child: MyApp(authRepository: AuthRepository()),
  ));
}

class MyApp extends StatelessWidget {
  final AuthRepository authRepository;
  MyApp({@required this.authRepository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: Router.generateRoutes,
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
          if (state is Uninitialized)
            return SplashScreen();
          else if (state is AuthenticationLoading)
            return CircularProgressIndicator();
          else if (state is Authenticated)
            return HomeScreen();
          else
            return LoginScreen(authRepository: authRepository);
        }));
  }
}
