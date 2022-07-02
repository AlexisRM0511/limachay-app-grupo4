import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:limachayapp/pages/sign_in.dart';

final regexEmail = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

final regexPassword = RegExp(
    r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$");

bool _isEmailValid(String email) {
  return true;
  //return regexEmail.hasMatch(email.toLowerCase());
}

bool _isPasswordValid(String password) {
  //return regexPassword.hasMatch(password);
  return true;
}

class LogInForm extends StatefulWidget {
  const LogInForm({Key? key}) : super(key: key);

  @override
  LogInFormState createState() => LogInFormState();
}

class LogInFormState extends State<LogInForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.only(top: 50),
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFF36A32C), Color(0xC248ED39)])),
                child: Form(
                    key: _formKey,
                    child: Column(children: [
                      Image.asset('assets/loginLogo.png',
                          width: MediaQuery.of(context).size.width * 0.5),
                      textForm("Correo Electrónico", 1),
                      textForm("Contraseña", 2),
                      buttonForm("Iniciar Sesión", _formKey, context, 1),
                      const Text("¿No posee una Cuenta aún?"),
                      buttonForm("Registrarse", _formKey, context, 2),
                      const Text("Copyright © Limachay 2022")
                    ])))));
  }
}

Widget textForm(String label, int type) {
  return Container(
      margin: const EdgeInsets.all(20.0),
      child: TextFormField(
          obscureText: type == 2 ? true : false,
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: label,
            contentPadding:
                const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10.0),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          validator: (value) {
            if (!_isPasswordValid(value.toString()) && type == 2) {
              return 'Por favor ingresa un $label valido';
            }
            if (!_isEmailValid(value.toString()) && type == 1) {
              return 'Por favor ingresa $label valido';
            }
            return null;
          }));
}

Widget buttonForm(String label, GlobalKey<FormState> formKey,
    BuildContext context, int type) {
  return Container(
      margin: const EdgeInsets.all(20.0),
      child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
            padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(vertical: 20.0, horizontal: 80.0),
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
              side: const BorderSide(
                color: Colors.black,
                width: 1.0,
              ),
            )),
          ),
          onPressed: () {
            if (type == 1) {
              if (formKey.currentState!.validate()) {
                Navigator.of(context).pushReplacementNamed('/home');
              }
            } else {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SignForm()));
            }
          },
          child: Text(label, style: const TextStyle(color: Colors.black))));
}
