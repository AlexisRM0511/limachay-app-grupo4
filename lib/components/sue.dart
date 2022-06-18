import 'package:flutter/material.dart';
import 'package:limachayapp/pages/sue_detail.dart';

const double margin = 8.0;

class Sue extends StatefulWidget {
  const Sue({Key? key}) : super(key: key);

  @override
  SueState createState() => SueState();
}

class SueState extends State<Sue> {
  @override
  Widget build(BuildContext context) {
    return /*Scaffold(
        body: SingleChildScrollView(
            child: Center(
                child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [SueForm()],
    ))));*/
    Column(
      children: [
        SueForm()
      ]
    );
  }
}

class SueForm extends StatefulWidget {
  const SueForm({Key? key}) : super(key: key);

  @override
  SueFormState createState() => SueFormState();
}

class SueFormState extends State<SueForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(children: [
          Container(
            margin: const EdgeInsets.all(12),
            alignment: Alignment.centerLeft,
            padding:
                const EdgeInsets.only(left: 5, top: margin, bottom: margin),
            child: const Text(
              'Denunciar',
              style: TextStyle(
                fontSize: 27,
              ),
            ),
          ),
          textInput("Delito"),
          textArea("Descripción"),
          groupInput("Lugar", const Icon(Icons.location_on)),
          groupInput("Fecha y hora", const Icon(Icons.calendar_today)),
          addButton(
              "Evidencias", const Icon(Icons.add_a_photo, color: Colors.grey)),
          customCheckbox("Conozco al denunciado"),
          submitBtn("Denunciar", const Color(0xFF79E070), _formKey, context),
        ]));
  }
}

Widget textInput(String label) {
  return Container(
      margin: const EdgeInsets.all(12),
    //margin: const EdgeInsets.only(top: margin, bottom: margin),
    child: TextFormField(
      decoration:
          InputDecoration(border: const OutlineInputBorder(), labelText: label),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Ingrese algún texto';
        }
        return null;
      },
    ),
  );
}

Widget textArea(String label) {
  return Container(
      //margin: const EdgeInsets.only(top: margin, bottom: margin),
      margin: const EdgeInsets.all(12),
      child: TextFormField(
        keyboardType: TextInputType.multiline,
        maxLines: 5,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: label,
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Ingrese algún texto';
          }
          return null;
        },
      ));
}

Widget groupInput(String label, Widget icon) {
  return Container(
    //margin: const EdgeInsets.only(top: margin, bottom: margin),
      margin: const EdgeInsets.all(12),
    child: TextFormField(
      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: label,
          suffixIcon: icon),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Ingrese algún texto';
        }
        return null;
      },
    ),
  );
}

Widget addButton(String label, Widget icon) {
  return Container(
      //margin: const EdgeInsets.only(top: margin, bottom: margin),
      margin: const EdgeInsets.all(12),
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: margin / 2),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(label,
                  style: const TextStyle(color: Colors.grey, fontSize: 16)),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Ink(
              decoration: const ShapeDecoration(
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                color: Colors.transparent,
              ),
              child: IconButton(
                icon: icon,
                onPressed: () {},
                splashColor: Colors.grey,
                splashRadius: 25,
              ),
            ),
          )
        ],
      ));
}

Widget customCheckbox(String label) {
  return Container(
      //margin: const EdgeInsets.only(top: margin, bottom: margin),
      margin: const EdgeInsets.all(12),
      child: CheckboxListTile(
        contentPadding: const EdgeInsets.all(0),
        title: Text(label, style: const TextStyle(color: Colors.grey)),
        value: false,
        onChanged: (bool? value) {},
      ));
}

Widget submitBtn(
    String label, Color color, GlobalKey<FormState> key, BuildContext context) {
  return Container(
      //margin: const EdgeInsets.only(top: margin, bottom: margin),
      margin: const EdgeInsets.all(12),
      child: TextButton(
          onPressed: () {
            if (key.currentState!.validate()) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processing Data')));
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SueDetail()),
              );
            }
          },
          style: TextButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
            padding: const EdgeInsets.all(16.0),
            primary: Colors.black,
            backgroundColor: color,
          ),
          child: Text(label)));
}
