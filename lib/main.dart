import 'package:flutter/material.dart';
import 'package:limachayapp/pages/log_in.dart';
import 'package:limachayapp/pages/main_home.dart';

void main() {
  runApp(const Limachay());
}

class Limachay extends StatelessWidget {
  const Limachay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Limachay', home: const LogInForm(), routes: {
      "/home": (BuildContext context) => const MainHome(),
    });
  }
}
