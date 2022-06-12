import 'package:flutter/material.dart';
import 'package:limachayapp/components/sue.dart';
import 'package:limachayapp/pages/sue_detail.dart';
import 'package:limachayapp/pages/main_home.dart';
import 'package:limachayapp/pages/log_in.dart';
import 'package:limachayapp/pages/sign_in.dart';

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
            child: SueDetail(),
            // child: Sign(),
          )
        )
      )
    );
  }
}
