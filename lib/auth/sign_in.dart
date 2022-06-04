import 'package:flutter/material.dart';

const double margin = 5.0;

void main() => runApp(Sign());

class Sign extends StatefulWidget {
  @override
  _SignState createState() => _SignState();
}

class _SignState extends State<Sign> {
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
                ))
        ),
      )
    );
  }
}

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  @override
  Widget build(BuildContext context) {
    return Container(

        child: Form(
            child: Column(children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left:5, top: margin, bottom: margin),
                child: const Text(
                  'Registrarse',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
              TextDato("DNI"),
              TextDato("Nombre"),
              TextDato("Apellido"),
              TextDato("Telefono"),
              TextDato("Usuario"),
              TextDato2("Correo"),
              TextDato3("Contraseña"),
              MainButton("Registrarse", const Color(0xFF79E070))
            ])));
  }
}

Widget TextDato(String label) {
  return Container(
    margin: EdgeInsets.only(top: margin, bottom: margin),
    child: TextFormField(decoration: InputDecoration(border: OutlineInputBorder(), labelText: label)),
  );
}

Widget TextDato2(String label) {
  return Container(
    margin: EdgeInsets.only(top: margin, bottom: margin),
    child: TextFormField(decoration: InputDecoration(border: OutlineInputBorder(), labelText: label)),
  );
}

Widget TextDato3(String label) {
  return Container(
    margin: EdgeInsets.only(top: margin, bottom: margin),
    child: TextFormField(decoration: InputDecoration(border: OutlineInputBorder(), labelText: label)),
  );
}

Widget MainButton(String label, Color color) {
  return Container(
      margin: EdgeInsets.only(top: margin, bottom: margin),
      child: TextButton(
          child: Text(label),
          onPressed: () {},
          style: TextButton.styleFrom(
            minimumSize: Size(double.infinity, 50),
            padding: EdgeInsets.all(16.0),
            primary: Colors.black,
            backgroundColor: color,
          )));
}
