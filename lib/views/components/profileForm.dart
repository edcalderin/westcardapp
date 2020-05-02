import 'package:flutter/material.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:westcardapp/businessLogic/blocs/profileBloc/profile_bloc.dart';
import 'package:westcardapp/models/profileModel.dart';
import 'package:westcardapp/views/screens/profile/controllerManager.dart';
import 'package:westcardapp/views/screens/profile/enumAction.dart';

class ProfileForm extends StatefulWidget {
  final ActionProfile actionProfile;
  final ProfileBloc profileBloc;
  final ProfileModel profileModel;
  const ProfileForm(
      {@required this.actionProfile,
      @required this.profileBloc,
      @required this.profileModel});
  @override
  _ProfileFormState createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  bool keyboard;
  ActionProfile get actionProfile => widget.actionProfile;
  ProfileBloc get profileBloc => widget.profileBloc;
  ProfileModel get profileModel => widget.profileModel;
  ControllerManager controllerManager;
  void initState() {
    super.initState();
    keyboard = false;
    controllerManager = ControllerManager(profileModel: profileModel);
    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        keyboard = visible;
      },
    );
  }

  void dispose() {
    controllerManager.disposeAll();
    super.dispose();
  }

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
                      'Primer nombre',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromARGB(255, 45, 62, 80), fontSize: 16),
                    ),
                  ),
                  Container(
                    height: 36,
                    child: Theme(
                      data: Theme.of(context)
                          .copyWith(splashColor: Colors.transparent),
                      child: TextField(
                        controller: controllerManager.txtFirstNameController,
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
                      'Apellido',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromARGB(255, 45, 62, 80), fontSize: 16),
                    ),
                  ),
                  Container(
                    height: 36,
                    child: Theme(
                      data: Theme.of(context)
                          .copyWith(splashColor: Colors.transparent),
                      child: TextField(
                        controller: controllerManager.txtLastNameController,
                        keyboardType: TextInputType.text,
                        autofocus: false,
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
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
                          color: Color.fromARGB(255, 45, 62, 80), fontSize: 16),
                    ),
                  ),
                  Container(
                    height: 36,
                    child: Theme(
                      data: Theme.of(context)
                          .copyWith(splashColor: Colors.transparent),
                      child: TextField(
                        controller: controllerManager.txtEmailController,
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
                      'Compañía',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromARGB(255, 45, 62, 80), fontSize: 16),
                    ),
                  ),
                  Container(
                    height: 36,
                    child: Theme(
                      data: Theme.of(context)
                          .copyWith(splashColor: Colors.transparent),
                      child: TextField(
                        controller: controllerManager.txtBusinessController,
                        keyboardType: TextInputType.emailAddress,
                        autofocus: false,
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Su compañia',
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
                          color: Color.fromARGB(255, 45, 62, 80), fontSize: 16),
                    ),
                  ),
                  Container(
                    height: 36,
                    child: Theme(
                      data: Theme.of(context)
                          .copyWith(splashColor: Colors.transparent),
                      child: TextField(
                        controller: controllerManager.txtPhoneController,
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
                      'Celular',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromARGB(255, 45, 62, 80), fontSize: 16),
                    ),
                  ),
                  Container(
                    height: 36,
                    child: Theme(
                      data: Theme.of(context)
                          .copyWith(splashColor: Colors.transparent),
                      child: TextField(
                        controller: controllerManager.txtMobileController,
                        keyboardType: TextInputType.number,
                        autofocus: false,
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Celular',
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
                          color: Color.fromARGB(255, 45, 62, 80), fontSize: 16),
                    ),
                  ),
                  Container(
                    height: 36,
                    child: Theme(
                      data: Theme.of(context)
                          .copyWith(splashColor: Colors.transparent),
                      child: TextField(
                        controller: controllerManager.txtAddressController,
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
                      'Facebook',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromARGB(255, 45, 62, 80), fontSize: 16),
                    ),
                  ),
                  Container(
                    height: 36,
                    child: Theme(
                      data: Theme.of(context)
                          .copyWith(splashColor: Colors.transparent),
                      child: TextField(
                        controller: controllerManager.txtFacebookController,
                        keyboardType: TextInputType.text,
                        autofocus: false,
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Facebook',
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
                      'Instagram',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromARGB(255, 45, 62, 80), fontSize: 16),
                    ),
                  ),
                  Container(
                    height: 36,
                    child: Theme(
                      data: Theme.of(context)
                          .copyWith(splashColor: Colors.transparent),
                      child: TextField(
                        controller: controllerManager.txtInstagramController,
                        keyboardType: TextInputType.text,
                        autofocus: false,
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Instagram',
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
                      'Twitter',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromARGB(255, 45, 62, 80), fontSize: 16),
                    ),
                  ),
                  Container(
                    height: 36,
                    child: Theme(
                      data: Theme.of(context)
                          .copyWith(splashColor: Colors.transparent),
                      child: TextField(
                        controller: controllerManager.txtTwitterController,
                        keyboardType: TextInputType.text,
                        autofocus: false,
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Twitter',
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
                      'YouTube',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromARGB(255, 45, 62, 80), fontSize: 16),
                    ),
                  ),
                  Container(
                    height: 36,
                    child: Theme(
                      data: Theme.of(context)
                          .copyWith(splashColor: Colors.transparent),
                      child: TextField(
                        controller: controllerManager.txtYoutubeController,
                        keyboardType: TextInputType.number,
                        autofocus: false,
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'YouTube',
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
                      onPressed: () => this.sendProfilePressed(),
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
    );
  }

  void sendProfilePressed() {
    final ProfileModel profileModel = ProfileModel(
        firstName: controllerManager.txtFirstNameController.text,
        lastName: controllerManager.txtLastNameController.text,
        email: controllerManager.txtEmailController.text,
        business: controllerManager.txtBusinessController.text,
        address: controllerManager.txtAddressController.text,
        phone: controllerManager.txtPhoneController.text,
        mobile: controllerManager.txtMobileController.text,
        facebook: controllerManager.txtFacebookController.text,
        twitter: controllerManager.txtTwitterController.text,
        instagram: controllerManager.txtInstagramController.text,
        youtube: controllerManager.txtYoutubeController.text);
    if (actionProfile == ActionProfile.CREATE)
      profileBloc.add(CreateProfile(profileModel: profileModel));
    else if (actionProfile == ActionProfile.UPDATE)
      profileBloc.add(UpdateProfile(profileModel: profileModel));
  }
}
