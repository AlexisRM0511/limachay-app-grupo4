import 'package:flutter/material.dart';

void main() => runApp(SueDetail());

class SueDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Delito Detalle',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const SueDetailPage(title: 'Flutter Demo Home Page'));
  }
}

class SueDetailPage extends StatefulWidget {
  const SueDetailPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _SueDetailPageState createState() => _SueDetailPageState();
}

class _SueDetailPageState extends State<SueDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: <Widget>[
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 4,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/img.png'),
                    ))),
            Container(
              decoration: const BoxDecoration(color: Colors.white30),
              child: Column(
                children: <Widget>[
                  // GridView.count(
                  //   primary: false,
                  //   crossAxisCount: 2,
                  //   crossAxisSpacing: 10,
                  //   children: [
                  //     Container(
                  //       child: const Text(
                  //         'Delito',
                  //         style: TextStyle(
                  //           fontSize: 20,
                  //           fontWeight: FontWeight.bold,
                  //         )
                  //       )
                  //     ),
                  //     Container(
                  //       child: const Icon(
                  //         Icons.check_circle_outline_sharp,
                  //         color: Colors.green,
                  //         size: 30.0,
                  //       )
                  //     )
                  //   ],
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, top: 30.0, bottom: 20.0, right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Delito',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.check_circle_outline_sharp,
                              color: Colors.green,
                              size: 30.0,
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.create_rounded,
                                color: Colors.blue,
                                size: 30.0,
                              ),
                              onPressed: () {},
                            ),
                          ]
                        ),

                      ],
                    )
                  )
                  ,Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(
                        left: 20.0, top: 30.0, bottom: 20.0, right: 20.0),
                    child: const Text(
                      'Delito',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  texts('Lugar: ', 'Calle falsa 123'),
                  texts('Fecha y Hora: ', '12/12/12 12:12'),
                  texts('Denunciado por: ', 'Juan Perez'),
                  texts('Descripcion: ',
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
                ],
              ),
            ),
          ],
        ));
  }
}

Widget texts(String texto, String valor) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(texto,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ))),
      Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 20.0, bottom: 20.0),
          child: Text(valor))
    ],
  );
}

Widget images(String url, double width, double height) {
  return Image(image: AssetImage(url), height: height, width: width);
}
