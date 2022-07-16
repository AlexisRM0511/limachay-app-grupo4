import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:limachayapp/limachay/limachay.dart';
import 'package:limachayapp/signin/signin.dart';
import 'package:limachayapp/signup/signup.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) =>  const LogInForm(),
      '/limachay': (context) =>  const Limachay(),
      '/signup': (context) =>  const SignForm(),
    },
    home: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else {
          if (snapshot.hasData) {
            return const Limachay();
          } else {
            return const LogInForm();
          }
        }
      },
    ),
  );
}