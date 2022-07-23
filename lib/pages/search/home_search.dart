import 'package:flutter/material.dart';
import '../sue/sue_card.dart';
import '../../components/sue_case.dart';

void main() => runApp(HomeSearchPage());

class HomeSearchPage extends StatefulWidget {
  const HomeSearchPage({Key? key}) : super(key: key);

  @override
  HomeSearchPageState createState() => HomeSearchPageState();
}

class HomeSearchPageState extends State<HomeSearchPage> {

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          leading: const BackButton(
            color: Colors.black,
          ),
          title: const Text('Buscar Delito'),
          titleTextStyle: const TextStyle(
            color: Colors.black,
            fontSize: 27,
            fontWeight: FontWeight.w500,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body:Column(
          children: [
            const SingleChildScrollView(),
            groupInput("Buscar", const Icon(Icons.search))
          ],
        )
    );
  }
}
// TODO: Arreglar cards
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