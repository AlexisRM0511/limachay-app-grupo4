import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:limachayapp/limachay/presenter/components/home.dart';
import 'package:limachayapp/limachay/utils/styles.dart';
import 'package:limachayapp/limachay/utils/constants.dart';

class LogInForm extends StatefulWidget {
  const LogInForm({Key? key}) : super(key: key);

  @override
  LogInFormState createState() => LogInFormState();
}

class LogInFormState extends State<LogInForm> {
  final formKey = GlobalKey<FormState>();

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
                    key: formKey,
                    child: Column(children: [
                      Image.asset('assets/loginLogo.png',
                          width: MediaQuery.of(context).size.width * 0.5),
                      textForm("Correo Electrónico", emailController, 3),
                      textForm("Contraseña", passwordController, 4),
                      buttonForm("Iniciar Sesión", signIn(context, formKey)),
                      const Text("¿No posee una cuenta aún?"),
                      buttonForm("Registrarse", goSignUp(context)),
                      const Text("Copyright © Limachay 2022")
                    ])))));
  }
}

Future signIn(BuildContext context, GlobalKey<FormState> formKey) async {
  if (formKey.currentState!.validate()) {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim())
          .then((value) => Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Home())))
          .catchError((e) => Fluttertoast.showToast(
              msg: "Error: ${e.toString()}",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.black54,
              timeInSecForIosWeb: 1));
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

goSignUp(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => const Home()));
}
