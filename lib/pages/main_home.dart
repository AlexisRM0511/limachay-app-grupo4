import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../components/home.dart';
import '../components/profile.dart';
import '../components/sue.dart';
import '../components/statistics.dart';

const double margin = 6.0;


class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  MainHomeState createState() => MainHomeState();
}

class MainHomeState extends State<MainHome> {
  int _currentPage = 0;
  final List<Widget> _page = [
    const Home(),
    const Sue(),
    const Statistics(),
    const Profile()
  ];

  @override
  Widget build(BuildContext context) {
    DateTime lastPopTime = DateTime.now();
    return Scaffold(
        body: WillPopScope(
            child: _page[_currentPage],
            onWillPop: () async {
              if (DateTime.now().difference(lastPopTime) >
                  const Duration(seconds: 1)) {
                lastPopTime = DateTime.now();
                Fluttertoast.showToast(
                    msg: "Presione de nuevo para salir",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    backgroundColor: Colors.black54,
                    timeInSecForIosWeb: 1
                );
              } else {
                lastPopTime = DateTime.now();
                await SystemChannels.platform
                    .invokeMethod('SystemNavigator.pop');
              }
              return false;
            }),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          // Fixed
          backgroundColor: Colors.white,
          // <-- This works for fixed
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          onTap: (index) {
            setState(() {
              _currentPage = index;
            });
          },
          currentIndex: _currentPage,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
            BottomNavigationBarItem(
                icon: Icon(Icons.article), label: "Registrar"),
            BottomNavigationBarItem(
                icon: Icon(Icons.assessment), label: "Estadísticas"),
            BottomNavigationBarItem(
                icon: Icon(Icons.supervised_user_circle), label: "Mi Usuario"),
          ],
        )
    );
  }
}

Widget groupInput(String label, Widget icon) {
  return Container(
    margin: const EdgeInsets.all(12),
    //margin: const EdgeInsets.only(top: margin, bottom: margin),
    child: TextField(
      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          isDense: true,
          labelText: label,
          suffixIcon: icon),
    ),
  );
}
