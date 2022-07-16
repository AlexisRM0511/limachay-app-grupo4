import 'package:flutter/material.dart';
import 'package:limachayapp/limachay/utils/constants.dart';

// 0: Texto | 1: Número | 2:TextoNúmero | 3: Correo | 4: Contraseña | 5: Validar Contraseña
Widget textForm(String label, TextEditingController controller, int type) {
  return Container(
      margin: const EdgeInsets.all(20.0),
      child: TextFormField(
          controller: controller,
          obscureText: type == 4 || type == 5,
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: label,
            contentPadding:
                const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10.0),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          validator: (value) {
            switch (type) {
              case 0:
                if (!isTextValid(value!)) {
                  return 'Ingresa un $label válido';
                }
                break;
              case 1:
                if (!isNumberValid(value!)) {
                  return 'Ingresa un $label válido';
                }
                break;
              case 2:
                if (!isEmailValid(value!)) {
                  return 'Ingresa un $label válido';
                }
                break;
              case 3:
                if (!isPasswordValid(value!)) {
                  return 'Ingresa un $label válido';
                }
                break;
              default:
                return null;
            }
            return null;
          }));
}

Widget buttonForm(String label, var onPressed) {
  return Container(
      margin: const EdgeInsets.all(20.0),
      child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
            padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(vertical: 20.0, horizontal: 80.0),
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
              side: const BorderSide(
                color: Colors.black,
                width: 1.0,
              ),
            )),
          ),
          onPressed: () => onPressed,
          child: Text(label, style: const TextStyle(color: Colors.black))));
}
