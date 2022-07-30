import 'package:flutter/material.dart';

Widget SueBalance(Map balance) {
  return Padding(
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
          child: Row(
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
          ),
        )
    ),
  );
}
