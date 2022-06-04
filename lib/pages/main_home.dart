import 'package:flutter/material.dart';
import 'package:limachayapp/components/home.dart';

const double margin = 6.0;

void main() => runApp(MainHome());

class MainHome extends StatefulWidget {
  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  int _paginaActual = 0;
  List<Widget>_paginas = [
    home(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        body: SingleChildScrollView(
          child: _paginas[_paginaActual],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed, // Fixed
          backgroundColor: Colors.white, // <-- This works for fixed
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          onTap: (index){
            setState(() {
              _paginaActual = index;
            });
          },
          currentIndex: _paginaActual,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
            BottomNavigationBarItem(icon: Icon(Icons.article), label: "Registrar"),
            BottomNavigationBarItem(icon: Icon(Icons.assessment), label: "Estadisticas"),
            BottomNavigationBarItem(icon: Icon(Icons.supervised_user_circle), label: "Mi Usuario"),
          ],
        ),
      ),
    );


  }
}

Widget GroupInput(String label, Widget icon) {
  return Container(
    margin: EdgeInsets.all(12),
    //margin: const EdgeInsets.only(top: margin, bottom: margin),
    child: TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          isDense: true,
          labelText: label,
          suffixIcon: icon
      ),
    ),
  );
}