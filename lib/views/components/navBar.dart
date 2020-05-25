import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:westcardapp/businessLogic/blocs/auth/authenticationBloc/authentication_bloc.dart';
import 'package:westcardapp/routes/const_routes.dart';

// This app is a stateful, it tracks the user's current choice.
class Navbar extends StatefulWidget {
  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  List<Choice> choices;
  Choice _selectedChoice;
  @override
  void initState() {
    super.initState();

    choices = <Choice>[
      Choice(icon: Icons.person, title: 'Mi Perfil', routes: userProfileRoute),
      Choice(
          icon: Icons.portrait,
          title: 'Ver mis Tarjetas',
          routes: myCardsRoute),
      Choice(icon: Icons.add, title: 'Crear nueva Tarjeta', routes: ''),
      Choice(
          icon: Icons.share,
          title: 'Tarjetas compartidas',
          routes: sharedCardsRoute),
      Choice(icon: Icons.border_clear, title: 'Escanear nueva', routes: ''),
      Choice(
          icon: Icons.arrow_right,
          title: 'Salir',
          event: () => BlocProvider.of<AuthenticationBloc>(context)
              .add(SignedOut(email: 'dfdf')))
    ];
    _selectedChoice = choices[0];
  }

  void _select(Choice choice) {
    Navigator.pushNamed(context, choice.routes);

    setState(() {
      _selectedChoice = choice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 45, 62, 80),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: ExactAssetImage('lib/assets/main-icon.png'),
                  fit: BoxFit.fitWidth),
            ),
          ),
        ],
        leading: Container(
          child: PopupMenuButton<Choice>(
              onSelected: _select,
              itemBuilder: (BuildContext context) {
                return choices.skip(0).map((Choice choice) {
                  return PopupMenuItem<Choice>(
                      value: choice,
                      child: GestureDetector(
                          onTap: choice.event,
                          child: Row(children: <Widget>[
                            Icon(choice.icon, color: Colors.black, size: 24),
                            SizedBox(width: 10),
                            Text(
                              choice.title,
                              style: TextStyle(fontSize: 16),
                            )
                          ])));
                }).toList();
              }),
        ),
      ),
    );
  }
}

class Choice {
  const Choice({this.routes, this.title, this.icon, this.event});
  final String title;
  final IconData icon;
  final String routes;
  final Function event;
}

void main() {
  runApp(Navbar());
}
