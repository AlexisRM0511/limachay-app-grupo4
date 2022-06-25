import 'package:flutter/material.dart';
import 'package:limachayapp/pages/sue_detail.dart';

class SueCase {
  final String subject;
  final Image image;
  final DateTime when;
  final String where;
  final String publisher;

  SueCase({
    required this.subject,
    this.image = const Image(
      image: AssetImage('assets/default_sue.png'),
    ),
    required this.when,
    required this.where,
    required this.publisher,
  });
}

class SueCard extends StatelessWidget {
  final SueCase sueCase;
  const SueCard({Key? key, required this.sueCase}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SueDetail())
            );
          },
          child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.black,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: 120,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Image(
                            height: 120,
                            image: sueCase.image.image,
                          ),
                        ],
                      ),
                      SizedBox(width: 20),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        width: 150,
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child:  Text(
                                textAlign: TextAlign.left,
                                sueCase.subject,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                '${sueCase.when.day}/${sueCase.when.month}/${sueCase.when.year}',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                '${sueCase.where}',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                '${sueCase.publisher}',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
              )
          )
      ),
    );
  }
}
