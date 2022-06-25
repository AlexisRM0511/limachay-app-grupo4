import 'package:flutter/material.dart';

const double margin = 20.0;

final regexOnlyLetters = RegExp(r'^[A-Za-zÁÉÍÓÚáéíóúñÑ ]+$');

final regexEmail = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

final regexPassword = RegExp(
    r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$");

final regexPhone = RegExp(r"(9)([0-9]){8}$");

bool _isTextValid(String text) {
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

bool _isComparePassword(String password) {
  return password == psw;
}

class SignForm extends StatefulWidget {
  const SignForm({Key? key}) : super(key: key);

  @override
  SignFormState createState() => SignFormState();
}

class SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();

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
                        textForm("DNI", 1),
                        textForm("Nombre", 2),
                        textForm("Apellido", 2),
                        textForm("Teléfono", 9),
                        textForm("Usuario", 3),
                        textForm("Correo", 4),
                        textForm("Contraseña", 5),
                        textForm("Contraseña Nuevamente", 6),
                        buttonForm("Registrarse", _formKey, context),
                      ]))
                ])));
  }
}

Widget textForm(String label, int type) {
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
              : type == 4
                  ? TextInputType.emailAddress
                  : TextInputType.text,
          validator: (value) {
            return validarDato(value!, type, label);
          },
        ),
      )
    ],
  );
}

Widget buttonForm(
    String label, GlobalKey<FormState> formKey, BuildContext context) {
  return Container(
      margin: const EdgeInsets.only(top: margin),
      child: ElevatedButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              Navigator.of(context).pushReplacementNamed('/home');
            }
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(const Color(0xFF79E070)),
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
          child: const Text("Registrarse",
              style: TextStyle(color: Colors.black))));
}

String? validarDato(String value, int type, String label) {
  if (value.isEmpty) {
    return 'Por favor, ingrese un valor';
  }
  if (type == 1 || type == 9) {
    if (type == 9 && !_isNumberValid(value.toString())) {
      return 'Por favor, ingrese un ${label.toLowerCase()} valido';
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
    } else if (type == 6 && !_isComparePassword(value.toString())) {
      return 'Contraseñas no coinciden';
    }
  }
  return null;
}
