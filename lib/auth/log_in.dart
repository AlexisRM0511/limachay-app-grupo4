import 'package:flutter/material.dart';

const double margin = 5.0;

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
          backgroundColor: Colors.lightGreen,
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
            child: Center(
                child: Column(children: [
                  Text("\n\n\n"),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(left:5, top: margin, bottom: margin),
                    child: Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/a/aa/Escudo_de_la_Polic%C3%ADa_Nacional_del_Per%C3%BA.png/1200px-Escudo_de_la_Polic%C3%ADa_Nacional_del_Per%C3%BA.png", width: 75),
                  ),
                  TextDato2("Correo Electronico"),
                  TextDato3("Contraseña"),
                  MainButton("Ingresar", Colors.white),
                  Text("¿No posee una Cuenta Aun?"),
                  MainButton("Registrarse", Colors.white),
                  Text("Copyright © Limachay 2022")


                ]))));
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