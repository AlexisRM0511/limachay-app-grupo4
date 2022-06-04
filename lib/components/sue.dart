import 'package:flutter/material.dart';

const double margin = 8.0;

class Sue extends StatefulWidget {
  @override
  _SueState createState() => _SueState();
}

class _SueState extends State<Sue> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SueForm(),
            ],
          )
        )
      )
    );
  }
}

class SueForm extends StatefulWidget {
  @override
  _SueFormState createState() => _SueFormState();
}

class _SueFormState extends State<SueForm> {
  @override
  Widget build(BuildContext context) {
    return Container(

      child: Form(
          child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 5, top: margin, bottom: margin),
                  child: const Text(
                    'Denunciar',
                    style: TextStyle(
                      fontSize: 27,

                    ),
                  ),
                ),
                TextInput("Delito"),
                TextArea("Descripción"),
                GroupInput("Lugar", const Icon(Icons.location_on)),
                GroupInput("Fecha y hora", const Icon(Icons.calendar_today)),
                AddButton("Evidencias", const Icon(Icons.add_a_photo, color: Colors.grey)),
                CustomCheckbox("Conozco al denunciado"),
                MainButton("Denunciar", const Color(0xFF79E070)),

              ]
          )
      )
    );

  }
}

Widget TextInput(String label) {
  return Container(
    margin: EdgeInsets.only(top: margin, bottom: margin),
    child: TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: label
      )
    ),
  );
}

Widget TextArea(String label) {
  return Container(
    margin: EdgeInsets.only(top: margin, bottom: margin),
    child: TextFormField(
      keyboardType: TextInputType.multiline,
      maxLines: 5,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: label,
      ),
    )
  );
}

Widget GroupInput(String label, Widget icon) {
  return Container(
    margin: const EdgeInsets.only(top: margin, bottom: margin),
    child: TextField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: label,
        suffixIcon: icon
      ),
    ),
  );
}

Widget AddButton(String label, Widget icon) {
  return Container(
      margin: EdgeInsets.only(top: margin, bottom: margin),
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: margin/2),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(label, style: TextStyle(color: Colors.grey, fontSize: 16)),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Ink(
              decoration: const ShapeDecoration(
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(10.0))
                ),
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
      )
  );
}

Widget CustomCheckbox(String label) {
  return Container(
    margin: EdgeInsets.only(top: margin, bottom: margin),
    child: CheckboxListTile(
      contentPadding: EdgeInsets.all(0),
      title: Text(label, style: TextStyle(color: Colors.grey)),
      value: false,
      onChanged: (bool? value) {},
    )
  );
}

Widget MainButton(String label, Color color) {
  return Container(
    margin: EdgeInsets.only(top: margin, bottom: margin),
    child: TextButton(
        child: Text(label),
        onPressed: () {},
        style: TextButton.styleFrom(
          minimumSize: Size(double.infinity, 50),
          padding: EdgeInsets.all(16.0),
          primary: Colors.black,
          backgroundColor: color,
        )
    )
  );
}