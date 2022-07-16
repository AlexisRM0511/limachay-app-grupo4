import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:limachayapp/limachay/limachay.dart';
import 'package:limachayapp/signin/utils/constants.dart';
import 'package:limachayapp/signin/utils/styles.dart';

bool _passVisibility = false;
bool _passVisibility2 = false;

class SignForm extends StatefulWidget {
  const SignForm({Key? key}) : super(key: key);

  @override
  SignFormState createState() => SignFormState();
}

class SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();

  void _togglePassword1() {
    setState(() {
      _passVisibility = !_passVisibility;
    });
  }

  void _togglePassword2() {
    setState(() {
      _passVisibility2 = !_passVisibility2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            padding: const EdgeInsets.only(top: 50.0, bottom: 50.0),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Form(
                      key: _formKey,
                      child: Column(children: [
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(bottom: 30.0),
                          child: const Text(
                            'R e g i s t r a t e',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                        textForm("DNI", dniController, 1),
                        textForm("Nombre", nameController, 0),
                        textForm("Apellido", lastnameController, 0),
                        textForm("Teléfono", phoneController, 0),
                        textForm("Usuario", userController, 0),
                        textForm("Correo", emailController, 3),
                        textForm("Contraseña", passwordController, 4),
                        textForm("Contraseña Nuevamente",
                            passwordValidateController, 5),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: const EdgeInsets.only(
                              bottom: 10.0, left: 20.0, right: 20.0),
                          child: const Text(
                            ' * La contraseña debe ser algúno de los siguientes caracteres: @!%*?&',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                        buttonForm("Registrarse", signUp),
                      ]))
                ])));
  }
}

Future signUp(BuildContext context, GlobalKey<FormState> formKey) async {
  if (formKey.currentState!.validate()) {
    formKey.currentState!.save();
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim())
          .then((value) => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Limachay())))
          .catchError((e) => {
                Fluttertoast.showToast(
                    msg: "Error: ${e.toString()}",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    backgroundColor: Colors.black54,
                    timeInSecForIosWeb: 1)
              });
    } catch (e) {
      Fluttertoast.showToast(
          msg: "Error: ${e.toString()}",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}
