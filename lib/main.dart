import 'package:flutter/material.dart';
import 'package:limachayapp/pages/Sue.dart';
import 'package:limachayapp/pages/SueDetail.dart';
import 'package:limachayapp/components/MainHome.dart';
import 'package:limachayapp/auth/login.dart';
import 'package:limachayapp/auth/Sigin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
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
