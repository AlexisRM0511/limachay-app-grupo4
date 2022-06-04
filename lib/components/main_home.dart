import 'package:flutter/material.dart';

const double margin = 6.0;

void main() => runApp(MainHome());

class MainHome extends StatefulWidget {
  @override
  _MainHomeState createState() => _MainHomeState();

}

class _MainHomeState extends State<MainHome> {
  int _paginaActual = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        body: Column(
          children: [
            Text("\n\n\n"),
            Container(
              alignment: Alignment.center,
              child: Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/a/aa/Escudo_de_la_Polic%C3%ADa_Nacional_del_Per%C3%BA.png/1200px-Escudo_de_la_Polic%C3%ADa_Nacional_del_Per%C3%BA.png", width: 75),
            ),
            GroupInput("Buscar", const Icon(Icons.search)),
            Container(
              child: Image.network("https://dirandro.policia.gob.pe/footer/4.png?pfdrid_c=true"),
            ),
            Text("\n¿Has Presenciado Algun Delito?\n"),
            GroupInput("Si o No", const Icon(Icons.check)),
            Text("\nRecientes")
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index){
            setState(() {
              _paginaActual = index;
            });
          },
          currentIndex: _paginaActual,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio", backgroundColor: Colors.green),
            BottomNavigationBarItem(icon: Icon(Icons.article), label: "Registrar", backgroundColor: Colors.red),
            BottomNavigationBarItem(icon: Icon(Icons.assessment), label: "Estadisticas", backgroundColor: Colors.yellow),
            BottomNavigationBarItem(icon: Icon(Icons.supervised_user_circle), label: "Mi Usuario", backgroundColor: Colors.blue),
          ],
        ),
      ),
    );


  }
}

Widget GroupInput(String label, Widget icon) {
  return Container(
    margin: const EdgeInsets.only(top: margin, bottom: margin),
    child: TextField(
      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: label,
          suffixIcon: icon
      ),
    ),
  );
}