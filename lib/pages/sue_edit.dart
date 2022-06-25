import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Map data = {
  "delito": "",
  "descripcion": "",
  "lugar": "",
  "fecha": "",
  "photos": <String>[],
  "conozco": true,
};

class SueEdit extends StatefulWidget {
  const SueEdit({Key? key}) : super(key: key);

  @override
  _SueEditState createState() => _SueEditState();
}

class _SueEditState extends State<SueEdit> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController dateinput = TextEditingController();
  @override
  void initState() {
    dateinput.text = DateFormat('yyyy-MM-dd').format(DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black,
        ),
        title: const Text('Editar denuncia'),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 27,
          fontWeight: FontWeight.w500,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              margin: const EdgeInsets.all(12),
              child: Column(
                children: <Widget>[
                  _TextFormField("Delito", data["delito"]),
                  _TextFormField("Descripción", data["descripcion"]),
                  _TextFormFieldGroup("Lugar", const Icon(Icons.place), data["lugar"]),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: TextFormField(
                        controller: dateinput,
                        decoration: const InputDecoration(
                          labelText: "Fecha",
                          suffixIcon: Icon(Icons.calendar_today),
                        ),
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2022),
                            lastDate: DateTime.now(),
                          );

                          if (pickedDate != null) {
                            String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
                            setState(() {
                              dateinput.text = formattedDate;
                            });
                          }
                        }
                    ),
                  ),
                  _PhotoListAdd(data["photos"]),
                  customCheckbox("Conozco al denunciado", data["conozco"]),
                  submitBtn("Guardar", const Color(0xFF79E070), _formKey, context)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _TextFormField(String label, String initValue) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 16.0),
    child: TextFormField(
      initialValue: initValue,
      decoration: InputDecoration(
        labelText: label,
      ),
    ),
  );
}

Widget _TextFormArea(String label, String initValue) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 16.0),
    child: TextFormField(
      initialValue: initValue,
      keyboardType: TextInputType.multiline,
      maxLines: 5,
      decoration: InputDecoration(
        labelText: label,
      ),
    )
  );
}

Widget _TextFormFieldGroup(String label, Icon icon, String initValue) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 16.0),
    child: TextFormField(
      initialValue: initValue,
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: icon,
      ),
    ),
  );
}

Widget _PhotoListAdd(List<String> photos) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 16.0),
    child: Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: const Text(
            'Fotos'
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
        height: 100,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: photos.length + 1,
          itemBuilder: (context, index) {
            if (index == photos.length) {
              return _PhotoAdd();
            } else {
              return Container(
                width: 100,
                child: Image.network(
                  photos[index],
                  fit: BoxFit.cover,
                ),
              );
            }
          },
        ),
      ),],
    )

  );
}

Widget _PhotoAdd() {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.grey,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(5),
    ),
    width: 100,
    child: IconButton(
      icon: Icon(Icons.add),
      onPressed: () {},
    ),
  );
}

////
Widget customCheckbox(String label, bool initValue) {
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