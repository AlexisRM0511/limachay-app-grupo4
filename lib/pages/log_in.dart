import 'package:flutter/material.dart';
import 'package:limachayapp/pages/sign_in.dart';

import 'main_home.dart';

const double margin = 20.0;

final regexEmail = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

final regexPassword = RegExp(
    r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$");

void main() => runApp(MyLogin());

class MyLogin extends StatefulWidget {
  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: SingleChildScrollView(
          child: Center(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SignForm(),
        ],
      ))),
    ));
  }
}

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

bool _isEmailValid(String email) {
  return regexEmail.hasMatch(email.toLowerCase());
}

bool _isPasswordValid(String password) {
  return regexPassword.hasMatch(password);
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF36A32C), Color(0xC248ED39)])),
        child: Form(
            key: _formKey,
            child: Center(
                child: Column(children: [
              const Text("\n\n\n"),
              Container(
                alignment: Alignment.center,
                padding:
                    const EdgeInsets.only(left: 5, top: margin, bottom: margin),
                child: Image.network(
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/a/aa/Escudo_de_la_Polic%C3%ADa_Nacional_del_Per%C3%BA.png/1200px-Escudo_de_la_Polic%C3%ADa_Nacional_del_Per%C3%BA.png",
                    width: 75),
              ),
              TextDatoForm("Correo Electronico", 1),
              TextDatoForm("Contraseña", 2),
              Container(
                  margin: const EdgeInsets.all(margin),
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Processing Data')));
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainHome()));
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 80.0),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          side: const BorderSide(
                            color: Colors.black,
                            width: 1.0,
                          ),
                        )),
                      ),
                      child: const Text("Iniciar Sesión",
                          style: TextStyle(color: Colors.black)))),
              const Text("¿No posee una Cuenta Aun?"),
              Container(
                  margin: const EdgeInsets.all(margin),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Sign()));
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 80.0),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          side: const BorderSide(
                            color: Colors.black,
                            width: 1.0,
                          ),
                        )),
                      ),
                      child: const Text("Registrarse",
                          style: TextStyle(color: Colors.black)))),
              const Text("Copyright © Limachay 2022")
            ]))));
  }
}

Widget TextDatoForm(String label, int type) {
  return Container(
      margin: const EdgeInsets.all(margin),
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
              return 'Porfavor ingresa un $label valido';
            }
            if (!_isEmailValid(value.toString()) && type == 1) {
              return 'Porfavor ingresa $label valido';
            }
            return null;
          }));
}