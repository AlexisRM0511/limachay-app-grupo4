import 'package:flutter/material.dart';
import '../sue_edit/sue_edit.dart';
import '../../../components/sue_case.dart';

class SueDetail extends StatefulWidget {
  final SueCase sueCase;
  const SueDetail({Key? key, required this.sueCase}) : super(key: key);

  @override
  _SueDetailState createState() => _SueDetailState();
}

class _SueDetailState extends State<SueDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle'),
        leading: const BackButton(
          color: Colors.black,
        ),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 27,
          fontWeight: FontWeight.w500,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
        body: SafeArea(
          child:
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: Image(
                          image: AssetImage('assets/default_sue.png')
                        )
                    ),
                    Container(
                      decoration: const BoxDecoration(color: Colors.white30),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0, top: 30.0, bottom: 20.0, right: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  widget.sueCase.subject,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: <Widget>[
                                    const Icon(
                                      Icons.check_circle_outline_sharp,
                                      color: Colors.green,
                                      size: 30.0,
                                    ),
                                    const SizedBox(
                                      width: 15.0,
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.create_rounded,
                                        color: Colors.blue,
                                        size: 30.0,
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => SueEdit(sueCase: widget.sueCase)
                                          )
                                        );
                                      },
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
                  texts('Lugar: ', widget.sueCase.where),
                  texts('Fecha y Hora: ', '${widget.sueCase.when.day}/${widget.sueCase.when.month}/${widget.sueCase.when.year}'),
                  texts('Denunciado por: ', widget.sueCase.publisher),
                  texts('Descripcion: ', widget.sueCase.description),],
              ),
            )

          ],
        )
      )
      )
    );
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
