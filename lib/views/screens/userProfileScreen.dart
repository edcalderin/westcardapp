import 'package:flutter/material.dart';
import 'package:westcardapp/views/components/navBar.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

class UserProfileScreen extends StatefulWidget {
  UserProfileScreen({Key key}) : super(key: key);

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  TextEditingController _controller;
  bool keyboard;

  void initState() {
    super.initState();
    _controller = TextEditingController();
    keyboard = false;

    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        keyboard = visible;
      },
    );
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.0),
        child: Navbar(),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/fondo_1.jpg'),
                fit: BoxFit.none,
              ),
            ),
          ),
          Container(
            color: Colors.white.withOpacity(0.7),
          ),
          Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(bottom: (keyboard) ? 210 : 0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.90,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      child: Text('Modificar datos de Perfil',
                          style: TextStyle(
                              color: Color.fromARGB(255, 45, 62, 80),
                              fontSize: 18)),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        bottom: 5.0,
                      ),
                      width: MediaQuery.of(context).size.width * 0.90,
                      child: Text(
                        'Nombre Completo',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromARGB(255, 45, 62, 80),
                            fontSize: 16),
                      ),
                    ),
                    Container(
                      height: 36,
                      child: Theme(
                        data: Theme.of(context)
                            .copyWith(splashColor: Colors.transparent),
                        child: TextField(
                          keyboardType: TextInputType.text,
                          autofocus: false,
                          style: TextStyle(fontSize: 18.0, color: Colors.black),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Nombre/s y apellido/s',
                            contentPadding: const EdgeInsets.only(
                                left: 20.0, bottom: 10, top: 10),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        bottom: 5.0,
                      ),
                      width: MediaQuery.of(context).size.width * 0.90,
                      child: Text(
                        'Titulo/ tratamiento',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromARGB(255, 45, 62, 80),
                            fontSize: 16),
                      ),
                    ),
                    Container(
                      height: 36,
                      child: Theme(
                        data: Theme.of(context)
                            .copyWith(splashColor: Colors.transparent),
                        child: TextField(
                          keyboardType: TextInputType.text,
                          autofocus: false,
                          style: TextStyle(fontSize: 18.0, color: Colors.black),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'ej: Ingeniero, Doctor,etc',
                            contentPadding: const EdgeInsets.only(
                                left: 20.0, bottom: 10, top: 10),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        bottom: 5.0,
                      ),
                      width: MediaQuery.of(context).size.width * 0.90,
                      child: Text(
                        'Domicilio',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromARGB(255, 45, 62, 80),
                            fontSize: 16),
                      ),
                    ),
                    Container(
                      height: 36,
                      child: Theme(
                        data: Theme.of(context)
                            .copyWith(splashColor: Colors.transparent),
                        child: TextField(
                          keyboardType: TextInputType.text,
                          autofocus: false,
                          style: TextStyle(fontSize: 18.0, color: Colors.black),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Calle, numero, piso, depto',
                            contentPadding: const EdgeInsets.only(
                                left: 20.0, bottom: 10, top: 10),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        bottom: 5.0,
                      ),
                      width: MediaQuery.of(context).size.width * 0.90,
                      child: Text(
                        'Ciudad',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromARGB(255, 45, 62, 80),
                            fontSize: 16),
                      ),
                    ),
                    Container(
                      height: 36,
                      child: Theme(
                        data: Theme.of(context)
                            .copyWith(splashColor: Colors.transparent),
                        child: TextField(
                          keyboardType: TextInputType.text,
                          autofocus: false,
                          style: TextStyle(fontSize: 18.0, color: Colors.black),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Ciudad',
                            contentPadding: const EdgeInsets.only(
                                left: 20.0, bottom: 10, top: 10),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        bottom: 5.0,
                      ),
                      width: MediaQuery.of(context).size.width * 0.90,
                      child: Text(
                        'Provincia/Estado',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromARGB(255, 45, 62, 80),
                            fontSize: 16),
                      ),
                    ),
                    Container(
                      height: 36,
                      child: Theme(
                        data: Theme.of(context)
                            .copyWith(splashColor: Colors.transparent),
                        child: TextField(
                          keyboardType: TextInputType.text,
                          autofocus: false,
                          style: TextStyle(fontSize: 18.0, color: Colors.black),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Provincia',
                            contentPadding: const EdgeInsets.only(
                                left: 20.0, bottom: 10, top: 10),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        bottom: 5.0,
                      ),
                      width: MediaQuery.of(context).size.width * 0.90,
                      child: Text(
                        'Pais',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromARGB(255, 45, 62, 80),
                            fontSize: 16),
                      ),
                    ),
                    Container(
                      height: 36,
                      child: Theme(
                        data: Theme.of(context)
                            .copyWith(splashColor: Colors.transparent),
                        child: TextField(
                          keyboardType: TextInputType.text,
                          autofocus: false,
                          style: TextStyle(fontSize: 18.0, color: Colors.black),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Pais',
                            contentPadding: const EdgeInsets.only(
                                left: 20.0, bottom: 10, top: 10),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        bottom: 5.0,
                      ),
                      width: MediaQuery.of(context).size.width * 0.90,
                      child: Text(
                        'Codigo Postal',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromARGB(255, 45, 62, 80),
                            fontSize: 16),
                      ),
                    ),
                    Container(
                      height: 36,
                      child: Theme(
                        data: Theme.of(context)
                            .copyWith(splashColor: Colors.transparent),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          autofocus: false,
                          style: TextStyle(fontSize: 18.0, color: Colors.black),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Codigo Postal',
                            contentPadding: const EdgeInsets.only(
                                left: 20.0, bottom: 10, top: 10),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        bottom: 5.0,
                      ),
                      width: MediaQuery.of(context).size.width * 0.90,
                      child: Text(
                        'Telefono',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromARGB(255, 45, 62, 80),
                            fontSize: 16),
                      ),
                    ),
                    Container(
                      height: 36,
                      child: Theme(
                        data: Theme.of(context)
                            .copyWith(splashColor: Colors.transparent),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          autofocus: false,
                          style: TextStyle(fontSize: 18.0, color: Colors.black),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Telefono',
                            contentPadding: const EdgeInsets.only(
                                left: 20.0, bottom: 10, top: 10),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        bottom: 5.0,
                      ),
                      width: MediaQuery.of(context).size.width * 0.90,
                      child: Text(
                        'Correo electronico',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromARGB(255, 45, 62, 80),
                            fontSize: 16),
                      ),
                    ),
                    Container(
                      height: 36,
                      child: Theme(
                        data: Theme.of(context)
                            .copyWith(splashColor: Colors.transparent),
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          autofocus: false,
                          style: TextStyle(fontSize: 18.0, color: Colors.black),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'sucorreo@suempresa.com',
                            contentPadding: const EdgeInsets.only(
                                left: 20.0, bottom: 10, top: 10),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        bottom: 5.0,
                      ),
                      width: MediaQuery.of(context).size.width * 0.90,
                      child: Text(
                        'Empresa',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromARGB(255, 45, 62, 80),
                            fontSize: 16),
                      ),
                    ),
                    Container(
                      height: 36,
                      child: Theme(
                        data: Theme.of(context)
                            .copyWith(splashColor: Colors.transparent),
                        child: TextField(
                          keyboardType: TextInputType.text,
                          autofocus: false,
                          style: TextStyle(fontSize: 18.0, color: Colors.black),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Empresa',
                            contentPadding: const EdgeInsets.only(
                                left: 20.0, bottom: 10, top: 10),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15, bottom: 5),
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.95,
                      child: RaisedButton(
                        color: Color.fromARGB(255, 45, 62, 80),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('Enviar',
                                  style: TextStyle(
                                      fontSize: 18.0, color: Colors.white)),
                              Icon(Icons.arrow_right,
                                  size: 40, color: Colors.white),
                            ]),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5, bottom: 5),
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.95,
                      child: RaisedButton(
                        color: Colors.grey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.arrow_left,
                                  size: 40, color: Colors.white),
                              Text('Cancelar     ',
                                  style: TextStyle(
                                      fontSize: 18.0, color: Colors.white)),
                            ]),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
