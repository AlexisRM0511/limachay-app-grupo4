import 'package:flutter/material.dart';
import '../sue_case.dart';

class SueCard extends StatefulWidget {
  final SueCase sueCase;
  const SueCard({Key? key, required this.sueCase}) : super(key: key);

  @override
  _SueCardState createState() => _SueCardState();
}

class _SueCardState extends State<SueCard> {


  @override
  Widget build(BuildContext context) {
    return Center(
          child: Card(
              //elevation: 0,
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: Colors.black,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.90,
                  height: 120,
                  child: Row(
                    children: [

                    Container(
                      width: 120,
                      child: Image(
                        image: AssetImage('assets/default_sue.png'),
                      )
                    ),

                      const SizedBox(width: 20),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child:  Text(
                                textAlign: TextAlign.left,
                                widget.sueCase.subject,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                '${widget.sueCase.when.day}/${widget.sueCase.when.month}/${widget.sueCase.when.year}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                widget.sueCase.where,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                widget.sueCase.publisher,
                                style: const TextStyle(
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
    );
  }
}
