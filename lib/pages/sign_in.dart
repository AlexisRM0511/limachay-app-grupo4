import 'package:flutter/material.dart';

import 'main_home.dart';

const double margin = 20.0;

final regexOnlyLetters = RegExp(r'^[A-Za-zÁÉÍÓÚáéíóúñÑ ]+$');

final regexEmail = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

final regexPassword = RegExp(
    r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$");

final regexPhone = RegExp(r"(9)([0-9]){8}$");

bool _isTextValid(String text) {
  print(regexOnlyLetters.hasMatch(text.toLowerCase()));
  return regexOnlyLetters.hasMatch(text.toLowerCase());
}

bool _isEmailValid(String email) {
  return regexEmail.hasMatch(email.toLowerCase());
}

bool _isPasswordValid(String password) {
  return regexPassword.hasMatch(password);
}

bool _isNumberValid(String number) {
  return regexPhone.hasMatch(number);
}

String psw = '';

bool _isComparatePassword(String password) {
  return password == psw;
}

void main() => runApp(const Sign());

class Sign extends StatefulWidget {
  const Sign({Key? key}) : super(key: key);

  @override
  _SignState createState() => _SignState();
}

class _SignState extends State<Sign> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body: SignForm(),
        ));
  }
}

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                    TextDato("DNI", 1),
                    TextDato("Nombre", 2),
                    TextDato("Apellido", 2),
                    TextDato("Telefono", 9),
                    TextDato("Usuario", 3),
                    TextDato("Correo", 4),
                    TextDato("Contraseña", 5),
                    TextDato("Contraseña Nuevamente", 6),
                    Container(
                      margin: const EdgeInsets.only(top: margin),
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
                            backgroundColor: MaterialStateProperty.all(
                                const Color(0xFF79E070)),
                            padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 80.0),
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              side: const BorderSide(
                                color: Colors.black,
                                width: 1.0,
                              ),
                            )),
                          ),
                          child: const Text("Registrarse",
                              style: TextStyle(color: Colors.black))),
                    )
                  ]))
            ]));
  }
}

Widget TextDato(String label, int type) {
  return Column(
    children: [
      Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: const EdgeInsets.only(left: 25.0, bottom: 5.0),
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                decorationStyle: TextDecorationStyle.solid,
              ),
            ),
          )),
      Container(
        margin:
        const EdgeInsets.only(bottom: 30.0, left: margin, right: margin),
        child: TextFormField(
          obscureText: type == 5 || type == 6 ? true : false,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: label,
            contentPadding: const EdgeInsets.only(left: 14.0),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
          keyboardType: type == 1
              ? TextInputType.number
              : type == 2
              ? TextInputType.text
              : type == 3
              ? TextInputType.text
              : type == 4
              ? TextInputType.emailAddress
              : TextInputType.text,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Por favor, ingrese un valor';
            }
            if (type == 1 || type == 9) {
              print(value.toString());
              if (type == 9 && !_isNumberValid(value.toString())) {
                return 'Por favor, ingrese un ${label.toLowerCase()} validooo';
              } else if (type == 1 && value.length != 8) {
                return 'Por favor, ingrese un ${label.toLowerCase()} valido';
              }
            }
            if (type == 2 || type == 3) {
              if (type == 3 && value.toString().length < 3) {
                return 'Por favor, ingrese un ${label.toLowerCase()} valido';
              } else if (type == 2 && !_isTextValid(value.toString())) {
                return 'Por favor, ingrese un ${label.toLowerCase()} valido';
              }
            }
            if (type == 4 && !_isEmailValid(value.toString())) {
              return 'Por favor, ingrese un ${label.toLowerCase()} valido.';
            }
            if (type == 5 || type == 6) {
              if (!_isPasswordValid(value.toString())) {
                return 'Por favor, ingrese una ${label.toLowerCase()} valida';
              } else if (type == 5) {
                psw = value.toString();
              } else if (type == 6 && !_isComparatePassword(value.toString())) {
                return 'Contraseñas no coinciden';
              }
            }
            return null;
          },
        ),
      )
    ],
  );
}