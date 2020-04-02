import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:westcardapp/businessLogic/blocs/auth/activateAccountbloc/activateaccount_bloc.dart';
import 'package:westcardapp/businessLogic/blocs/auth/authenticationBloc/authentication_bloc.dart';
import 'package:westcardapp/routes/const_routes.dart';
import 'package:westcardapp/utils/common.dart';
import 'package:westcardapp/views/components/activateAccountForm.dart';
import 'package:westcardapp/views/components/loadingProgress.dart';

class NextRegisterScreen extends StatefulWidget {
  final String email;
  NextRegisterScreen({Key key, this.email}) : super(key: key);
  @override
  _NextRegisterScreenState createState() => _NextRegisterScreenState();
}

class _NextRegisterScreenState extends State<NextRegisterScreen> {
  AuthenticationBloc authenticationBloc;
  @override
  void initState() {
    super.initState();
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
        body: BlocListener<ActivateAccountBloc, ActivateAccountState>(
          listener: (context, state) {
            if (state is ActivateAccountFailed)
              Common().showFlushBar(context: context, message: state.errorText);
            else if (state is ActivateAccountLoaded)
              Navigator.of(context).pushReplacementNamed(loginRoute);
          },
          child: BlocBuilder<ActivateAccountBloc, ActivateAccountState>(
            builder: (context, state) {
              return Stack(
                children: <Widget>[
                  ActivateAccountForm(email: this.widget.email),
                  (state is ActivateAccountLoading)
                      ? Opacity(opacity: 0.5, child: LoadingProgress())
                      : Container()
                ],
              );
            },
          ),
        ));
  }
}
