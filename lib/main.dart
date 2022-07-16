import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:limachayapp/limachay/presenter/pages/log_in.dart';
import 'package:limachayapp/limachay/presenter/pages/main_home.dart';
import 'package:limachayapp/limachay/presenter/pages/sign_in.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Limachay());
}

class Limachay extends StatelessWidget {
  const Limachay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) =>  const LogInForm(),
      '/home': (context) =>  const MainHome(),
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
            return const MainHome();
          } else {
            return const LogInForm();
          }
        }
      },
    ),
  );
}