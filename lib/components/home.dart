import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        //Text("\n\n\n"),
        Container(
          width: 140.0,
          height: 140.0,
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
          alignment: Alignment.bottomCenter,
          child: Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/a/aa/Escudo_de_la_Polic%C3%ADa_Nacional_del_Per%C3%BA.png/1200px-Escudo_de_la_Polic%C3%ADa_Nacional_del_Per%C3%BA.png", width: 50),
        ),
        groupInput("Buscar", const Icon(Icons.search)),
        Image.network("https://dirandro.policia.gob.pe/footer/4.png?pfdrid_c=true"),
        const Text("¿Has Presenciado Algún Delito?"),
        groupInput("Si o No", const Icon(Icons.check)),
        const Text("Recientes"),
        Cards(),
        Cards(),
        Cards()
      ],
    );
  }
}

Widget groupInput(String label, Widget icon) {
  return Container(
    margin: const EdgeInsets.all(12),
    //height: margin*24.0,
    child:
    TextField(
      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: label,
          isDense: true,
          suffixIcon: icon
      ),
    ),
  );
}

Widget Cards() {
  return Row(
    children: [

      Container(
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.black26
        ),
        width: 140.0,
        height: 140.0,
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        alignment: Alignment.center,
        child: Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/a/aa/Escudo_de_la_Polic%C3%ADa_Nacional_del_Per%C3%BA.png/1200px-Escudo_de_la_Polic%C3%ADa_Nacional_del_Per%C3%BA.png", width: 50),
      ),
      Title()
    ],

  );
}

Widget Title(){
  return Column(
    children: [
      Text("Data\n"),
      Text("data")
    ],
  );

}