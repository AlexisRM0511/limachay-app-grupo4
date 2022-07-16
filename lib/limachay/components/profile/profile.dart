import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const ProfileEdit())
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),

                      ),
                      child: const Text("Editar perfil"),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),

                      ),
                      child: const Text("Cerrar Sesión"),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Denuncias realizadas",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  // TODO: Add SueCardList
                  Expanded(
                      child: ListView.builder(
                        itemCount: SueCase.samples.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return SueDetail(sueCase: SueCase.samples[index]);
                                })
                              );
                            },
                            child: SueCard(sueCase: SueCase.samples[index]),
                          );
                        },
                      )
                  ),
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
            SizedBox(
              width: 90,
              child: Text(
                textAlign: TextAlign.left,
                value[1].toString(),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              width: 90,
              child: Text(
                textAlign: TextAlign.left,
                value[0].toString(),
                style: const TextStyle(
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
