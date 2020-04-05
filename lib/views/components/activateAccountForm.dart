import 'package:flutter/material.dart';
import 'package:westcardapp/routes/const_routes.dart';

class ActivateAccountForm extends StatelessWidget {
  final String email;
  final Function changeEmail;
  final Function activateOnPressed;
  final Function changeCode;
  ActivateAccountForm(
      {@required this.email,
      @required this.activateOnPressed,
      @required this.changeEmail,
      @required this.changeCode});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/assets/fondo_1.jpg'),
              fit: BoxFit.none,
            ),
          ),
        ),
        Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 30, bottom: 20),
              child: Center(
                child: Text('Ingrese codigo de activacion',
                    style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
            Center(
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  width: MediaQuery.of(context).size.width * 0.95,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      this.email == null
                          ? this.mailWidget(context)
                          : Container(),
                      Text('Codigo de activacion',
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                      Container(
                        margin: EdgeInsets.only(bottom: 15, top: 10),
                        height: 35,
                        child: Theme(
                          data: Theme.of(context)
                              .copyWith(splashColor: Colors.transparent),
                          child: TextField(
                            onChanged: (code) => this.changeCode(code),
                            autofocus: false,
                            style:
                                TextStyle(fontSize: 16.0, color: Colors.black),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              //hintText: 'ingresar codigo',
                              contentPadding: const EdgeInsets.only(
                                  left: 14.0, bottom: 8.0, top: 8.0),
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
                    ],
                  )),
            ),
            Container(
              margin: EdgeInsets.only(top: 15, bottom: 5),
              height: 40,
              width: MediaQuery.of(context).size.width * 0.95,
              child: RaisedButton(
                color: Color.fromARGB(255, 45, 62, 80),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                onPressed: this.activateOnPressed,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Enviar',
                        style: TextStyle(fontSize: 18.0, color: Colors.white)),
                    Icon(Icons.arrow_right, size: 40, color: Colors.white),
                  ],
                ),
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
                    Icon(Icons.arrow_left, size: 40, color: Colors.white),
                    Text('Cancelar     ',
                        style: TextStyle(fontSize: 18.0, color: Colors.white)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Column mailWidget(BuildContext context) {
    return Column(children: <Widget>[
      Text('Correo electrónico',
          style: TextStyle(color: Colors.white, fontSize: 16)),
      Container(
        margin: EdgeInsets.only(bottom: 15, top: 10),
        height: 35,
        child: Theme(
          data: Theme.of(context).copyWith(splashColor: Colors.transparent),
          child: TextField(
            onChanged: (email) => this.changeEmail(email),
            autofocus: false,
            style: TextStyle(fontSize: 16.0, color: Colors.black),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              //hintText: 'ingresar codigo',
              contentPadding:
                  const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
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
    ]);
  }
}
