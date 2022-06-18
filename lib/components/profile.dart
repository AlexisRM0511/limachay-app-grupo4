import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  ProfileState createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return /*Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              headerPage("Perfil"),
              balance(12, 6)
            ],
          )
        )
      )
    );*/
    Container(
      child: Center(
        child: Column(
            children: [
              balance(12, 6)
            ]
        )

      )

    );
  }
}

Widget headerPage(String title) {
  return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 30, left: 17),
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 27,
            ),
          )
        ],
      ));
}

Widget balance(int made, int approved) {
  var myArr = [{'title': 'Realizadas', 'value': made}, {'title': 'Aprobadas', 'value': approved}];
  return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      child: GridView.count(crossAxisCount: 2, children: 
        List.generate(
          myArr.length,
          (index) {
            return Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(
                    myArr[index]['title'].toString(),
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    myArr[index]['value'].toString(),
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  )
                ],
              ),
            );
          }
          
        )
    )
  );
}

Widget balanceItem(int quantity, String label) {
  return Column(
    children: [
      Text(
        quantity.toString(),
        style: const TextStyle(
          fontSize: 20,
        ),
      ),
      Text(
        label,
        style: const TextStyle(
          fontSize: 12,
        ),
      ),
    ],
  );
}
