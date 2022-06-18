import 'package:flutter/material.dart';
import 'sue_case.dart';

final sueCases = List<SueCase>.generate(
  10,
      (i) => SueCase(
    subject: 'Sue #1',
    when: DateTime.now(),
    where: 'Here',
    publisher: 'Limachay',
  ),
);

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var balance = {
    "made": ["Hechos", 0],
    "approved": ["Aprobados", 0],
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          title: const Text("Perfil"),
          titleTextStyle: const TextStyle(
            color: Colors.black,
            fontSize: 27,
            fontWeight: FontWeight.w500,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SafeArea(

            child: Column(
                children: <Widget>[
                  const SingleChildScrollView(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                    child: Container(
                        height: 100,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                        child: Container(
                          height: 50,
                          child: Balance(balance),
                        )
                    ),
                  ),
                  const SizedBox(height: 40),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),

                      ),
                      child: Text("Editar perfil"),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Denuncias realizadas",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  // TODO: Add SueCardList
                  Expanded(
                      child: ListView(
                        shrinkWrap: true,
                        children: sueCases.map((sueCase) => SueCard(sueCase: sueCase)).toList(),
                      )
                  ),
                  SizedBox(height: 40),
                ]
            )
        )
    );
  }
}

Widget Balance(Map balance) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: balance.values.map((value) =>
        Column(
          children: <Widget>[
            Container(
              width: 90,
              child: Text(
                textAlign: TextAlign.left,
                value[1].toString(),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              width: 90,
              child: Text(
                textAlign: TextAlign.left,
                value[0].toString(),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ],
        )
    ).toList(),
  );
}
