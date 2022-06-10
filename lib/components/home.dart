import 'package:flutter/material.dart';

class home extends StatelessWidget{
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
        GroupInput("Buscar", const Icon(Icons.search)),
        Container(
          child: Image.network("https://dirandro.policia.gob.pe/footer/4.png?pfdrid_c=true"),
        ),
        Text("¿Has Presenciado Algun Delito?"),
        GroupInput("Si o No", const Icon(Icons.check)),
        Text("Recientes")
      ],
    );
  }
}

Widget GroupInput(String label, Widget icon) {
  return Container(
    margin: EdgeInsets.all(12),
    //height: margin*24.0,
    child:
    TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: label,
          isDense: true,
          suffixIcon: icon
      ),
    ),
  );
}