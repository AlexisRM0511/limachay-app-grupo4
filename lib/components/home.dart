import 'package:flutter/material.dart';
import 'package:limachayapp/components/home_search.dart';
import '../components/sue_case.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  final sueCases = List<SueCase>.generate(
    10,
    (i) => SueCase(
      subject: 'Sue #1',
      when: DateTime.now(),
      where: 'Here',
      publisher: 'Limachay',
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const SingleChildScrollView(),
        //Text("\n\n\n"),
        Container(
          width: 140.0,
          height: 140.0,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          alignment: Alignment.bottomCenter,
          child: Image.network(
              "https://upload.wikimedia.org/wikipedia/commons/thumb/a/aa/Escudo_de_la_Polic%C3%ADa_Nacional_del_Per%C3%BA.png/1200px-Escudo_de_la_Polic%C3%ADa_Nacional_del_Per%C3%BA.png",
              width: 50),
        ),
        groupInputSearch("Buscar", Icon(Icons.search), context),
        Image.network("https://dirandro.policia.gob.pe/footer/4.png"),
        Container(
          child: const Text(
            "¿Has Presenciado Algún Delito?",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Container(
          child: groupInput("Si o No", const Icon(Icons.check)),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          alignment: Alignment.bottomLeft,
          child: const Text(
            "Recientes",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        //SizedBox(height: 5),
        Expanded(
            child: ListView(
          shrinkWrap: true,
          children:
              sueCases.map((sueCase) => SueCard(sueCase: sueCase)).toList(),
        )),
      ],
    ));
  }
}

Widget groupInput(String label, Widget icon) {
  return Container(
    margin: const EdgeInsets.all(12),
    //height: margin*24.0,
    child: TextField(
      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: label,
          isDense: true,
          suffixIcon: icon),
    ),
  );
}

Widget groupInputSearch(String label, Widget icon, BuildContext context) {
  return Container(
    margin: const EdgeInsets.all(12),
    //height: margin*24.0,
    child: TextField(
      readOnly: true,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeSearchPage()),
        );
      },
      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: label,
          isDense: true,
          suffixIcon: icon),
    ),
  );
}

Widget Cards() {
  return Row(
    children: [
      Container(
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(color: Colors.black26),
        width: 140.0,
        height: 140.0,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        alignment: Alignment.center,
        child: Image.network(
            "https://upload.wikimedia.org/wikipedia/commons/thumb/a/aa/Escudo_de_la_Polic%C3%ADa_Nacional_del_Per%C3%BA.png/1200px-Escudo_de_la_Polic%C3%ADa_Nacional_del_Per%C3%BA.png",
            width: 50),
      ),
      Title()
    ],
  );
}

Widget Title() {
  return Column(
    children: [Text("Data\n"), Text("data")],
  );
}
