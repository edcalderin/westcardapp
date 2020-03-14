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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 45, 62, 80),
          actions: <Widget>[
            // overflow menu
            PopupMenuButton<Choice>(
              onSelected: _select,
              itemBuilder: (BuildContext context) {
                return choices.skip(0).map((Choice choice) {
                  return PopupMenuItem<Choice>(
                    value: choice,
                    child: Text(
                      choice.title,
                    ),
                  );
                }).toList();
              },
            ),
          ],
          title: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: ExactAssetImage('lib/assets/main-icon.png'),
                  fit: BoxFit.fitWidth),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          // child: ChoiceCard(choice: _selectedChoice),
        ),
      ),
    );
  }
}

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Action'),
  const Choice(title: 'Another action'),
  const Choice(title: 'something else here'),
  const Choice(title: 'Salir'), //icon: Icons.arrow_left,
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
