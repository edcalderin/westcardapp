import 'package:flutter/material.dart';

// This app is a stateful, it tracks the user's current choice.
class Navbar extends StatefulWidget {
  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  Choice _selectedChoice = choices[0];

  void _select(Choice choice) {
    // Causes the app to rebuild with the new _selectedChoice.
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
          title: Text('               WestCardApp'),
          leading: Container(
            child: PopupMenuButton<Choice>(
              onSelected: _select,
              itemBuilder: (BuildContext context) {
                return choices.skip(0).map((Choice choice) {
                  return PopupMenuItem<Choice>(
                    value: choice,
                    child: Row(
                      children: <Widget>[
                        Icon(choice.icon,color:Colors.black,size:28),
                        SizedBox(width: 10),
                        Text(choice.title,style: TextStyle(fontSize:18),),
                      ],
                    ),
                  );
                }).toList();
              },
            ),
          )),
      // child: ChoiceCard(choice: _selectedChoice),
    );
  }
}

class Choice {
  const Choice({this.title, this.icon});
  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(icon: Icons.person, title: 'Mi Perfil'),
  const Choice(icon: Icons.portrait,title: 'Ver mis Tarjetas'),
  const Choice(icon: Icons.add,title: 'Crear nueva Tarjeta'),
  const Choice(icon: Icons.share,title: 'Tarjetas compartidas'),
  const Choice(icon: Icons.border_clear,title: 'Escanear nueva'),
  const Choice(icon: Icons.arrow_right,title: 'Salir'), //icon: Icons.arrow_left,
];

// class ChoiceCard extends StatelessWidget {
//   const ChoiceCard({Key key, this.choice}) : super(key: key);

//   final Choice choice;

//   @override
//   Widget build(BuildContext context) {
//     final TextStyle textStyle = Theme.of(context).textTheme.display1;
//     return Card(
//       color: Colors.white,
//       child: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             Text(choice.title, style: textStyle),
//           ],
//         ),
//       ),
//     );
//   }
// }

void main() {
  runApp(Navbar());
}
