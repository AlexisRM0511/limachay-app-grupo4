import 'package:flutter/material.dart';
import 'package:limachayapp/pages/sue.dart';
import 'package:limachayapp/pages/sue_detail.dart';
import 'package:limachayapp/components/main_home.dart';
import 'package:limachayapp/auth/log_in.dart';
import 'package:limachayapp/auth/sign_in.dart';

void main() {
  runApp(const Limachay());
}

class Limachay extends StatelessWidget {
  const Limachay({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Limachay',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: const Color(0xFFEFEFEF),
      ),
      home: SafeArea(
        child: Scaffold(
          body: Container(
            padding: const EdgeInsets.all(20),
            // child: Sue(),
            // child: SueDetail(),
            // child: MainHome(),
            child: MyLogin(),
            // child: Sign(),
          )
        )
      )
    );
  }
}
