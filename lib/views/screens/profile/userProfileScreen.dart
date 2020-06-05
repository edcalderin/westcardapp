import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:westcardapp/businessLogic/blocs/profileBloc/profile_bloc.dart';
import 'package:westcardapp/businessLogic/repositories/profileRepository.dart';
import 'package:westcardapp/models/profileModel.dart';
import 'package:westcardapp/utils/common.dart';
import 'package:westcardapp/views/components/loadingProgress.dart';
import 'package:westcardapp/views/components/navBar.dart';
import 'package:westcardapp/views/screens/profile/enumAction.dart';
import 'controllerManager.dart';

class UserProfileScreen extends StatefulWidget {
  UserProfileScreen({Key key}) : super(key: key);

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  ProfileBloc profileBloc;
  ProfileModel profileModel;
  Common common = Common();
  bool keyboard;
  ActionProfile actionProfile = ActionProfile.CREATE;
  ControllerManager controllerManager;
  @override
  void initState() {
    super.initState();
    keyboard = false;

    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool isVisible) {
        keyboard = isVisible;
      },
    );
    profileBloc = ProfileBloc(profileRepository: ProfileRepository());
    profileBloc.add(GetProfile(isUpgrade: false));
  }

  @override
  void dispose() {
    super.dispose();
    profileBloc.close();
    controllerManager.disposeAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.0),
        child: Navbar(),
      ),
      body: BlocConsumer<ProfileBloc, ProfileState>(
          bloc: profileBloc,
          listener: (context, state) {
            if (state is ProfileFailed)
              common.showFlushBar(context: context, message: state.errorText);
            else if (state is ProfileLoaded) {
              controllerManager =
                  ControllerManager(profileModel: state.profileModel);
              profileModel = state.profileModel;
            } else if (state is ProfileUpgraded) {
              controllerManager =
                  ControllerManager(profileModel: state.profileModel);
              profileModel = state.profileModel;
              common.showFlushBar(
                  context: context, message: 'Perfil actualizado!');
            }
          },
          builder: (context, state) {
            return Stack(
              children: <Widget>[
                Opacity(
                  opacity: state is ProfileLoading ? 0.5 : 1,
                  child: profileForm(),
                ),
                (state is ProfileLoading) ? LoadingProgress() : profileForm()
              ],
            );
          }),
    );
  }

  Widget profileForm() {
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
                      'Nombre',
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
                      child: TextFormField(
                        validator: (String nombre) {
                          if (nombre.isEmpty) {
                            return 'Debe ingresar nombre';
                          }
                        },
                        controller:
                            controllerManager?.txtFirstNameController ?? null,
                        keyboardType: TextInputType.text,
                        autofocus: false,
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Ingresar Nombre/s',
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
                      child: TextFormField(
                        validator: (String apellido) {
                          if (apellido.isEmpty) {
                            return 'Debe ingresar apellido';
                          }
                        },
                        controller:
                            controllerManager?.txtLastNameController ?? null,
                        keyboardType: TextInputType.text,
                        autofocus: false,
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Ingresar Apellido',
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
                        controller:
                            controllerManager?.txtEmailController ?? null,
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
                      child: TextFormField(
                        validator: (String empresa) {
                          if (empresa.isEmpty) {
                            return 'Debe ingresar Compañia';
                          }
                        },
                        controller:
                            controllerManager?.txtBusinessController ?? null,
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
                        controller:
                            controllerManager?.txtPhoneController ?? null,
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
                        controller:
                            controllerManager?.txtMobileController ?? null,
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
                      child: TextFormField(
                        validator: (String direccion) {
                          if (direccion.isEmpty) {
                            return 'Debe ingresar direccion';
                          }
                        },
                        controller:
                            controllerManager?.txtAddressController ?? null,
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
                        controller:
                            controllerManager?.txtFacebookController ?? null,
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
                        controller:
                            controllerManager?.txtInstagramController ?? null,
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
                        controller:
                            controllerManager?.txtTwitterController ?? null,
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
                        controller:
                            controllerManager?.txtYoutubeController ?? null,
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
    profileModel.firstName = controllerManager.txtFirstNameController.text;
    profileModel.lastName = controllerManager.txtLastNameController.text;
    profileModel.email = controllerManager.txtEmailController.text;
    profileModel.business = controllerManager.txtBusinessController.text;
    profileModel.address = controllerManager.txtAddressController.text;
    profileModel.phone = controllerManager.txtPhoneController.text;
    profileModel.mobile = controllerManager.txtMobileController.text;
    profileModel.facebook = controllerManager.txtFacebookController.text;
    profileModel.twitter = controllerManager.txtTwitterController.text;
    profileModel.instagram = controllerManager.txtInstagramController.text;
    profileModel.youtube = controllerManager.txtYoutubeController.text;
    if (profileModel.uuid != null)
      profileBloc.add(UpdateProfile(profileModel: profileModel));
    else
      profileBloc.add(CreateProfile(profileModel: profileModel));
  }
}
