import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:westcardapp/businessLogic/blocs/auth/authenticationBloc/authentication_bloc.dart';
import 'package:westcardapp/businessLogic/blocs/auth/registerBloc/register_bloc.dart';
import 'package:westcardapp/businessLogic/repositories/authRepository.dart';
import 'package:westcardapp/views/components/registerForm.dart';

class UserRegisterScreen extends StatefulWidget {
  final AuthRepository authRepository;
  UserRegisterScreen({Key key, @required this.authRepository})
      : super(key: key);

  @override
  _UserRegisterScreenState createState() => _UserRegisterScreenState();
}

bool isSwitched = false;

class _UserRegisterScreenState extends State<UserRegisterScreen> {
  RegisterBloc registerBloc;
  AuthenticationBloc authenticationBloc;
  String email;
  String plainPassword;
  TextEditingController emailTextController;
  TextEditingController plainPasswordController;
  AuthRepository get authRepository => widget.authRepository;
  @override
  void initState() {
    super.initState();
    this.registerBloc = RegisterBloc(authRepository: this.authRepository);
    this.emailTextController = TextEditingController();
    this.plainPasswordController = TextEditingController();
    this.authenticationBloc =
        AuthenticationBloc(authRepository: this.authRepository);
  }

  @override
  void dispose() {
    super.dispose();
    this.registerBloc.close();
    this.authenticationBloc.close();
    this.emailTextController.dispose();
    this.plainPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 5,
          automaticallyImplyLeading: false,
          backgroundColor: Color.fromARGB(255, 45, 62, 80),
          title: Container(
            margin: EdgeInsets.only(left: 10),
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: ExactAssetImage('lib/assets/main-icon.png'),
                  fit: BoxFit.fitWidth),
            ),
          ),
          actions: <Widget>[
            Container(
                margin: EdgeInsets.only(top: 20, right: 20),
                child: Text(
                  'Registro de nuevo usuario',
                  style: TextStyle(fontSize: 18),
                )),
          ],
        ),
        body: RegisterForm(authRepository: authRepository));
  }
}
