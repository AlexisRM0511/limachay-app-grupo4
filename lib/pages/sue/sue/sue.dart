import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:limachayapp/pages/sue/sue_case.dart';
import 'package:limachayapp/pages/sue/sue_detail/sue_detail.dart';

const double margin = 8.0;

class Sue extends StatefulWidget {
  const Sue({Key? key}) : super(key: key);

  @override
  _SueState createState() => _SueState();
}

class _SueState extends State<Sue> {
  final _formKey = GlobalKey<FormState>();
  late Map _formDataController;
  Map data = {
    'subject': '',
    'description': '',
    'when': DateTime.now(),
    'where': '',
    'publisher': '',
    'iKnow': false,
    'images': <String>[],
  };

  @override
  void initState() {
    _formDataController = {
      'subject': TextEditingController(text: data['subject']),
      'description': TextEditingController(text: data['description']),
      'when': TextEditingController(text: DateFormat('dd/MM/yyyy').format(data['when'])),
      'where': TextEditingController(text: data['where']),
      'publisher': TextEditingController(text: data['publisher']),
    };
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Widget textFormField(String label, String controller) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: TextFormField(
          controller: _formDataController[controller],
          decoration: InputDecoration(
            labelText: label,
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Es un campo obligatorio';
            }
            return null;
          },
        ),
      );
    }

    Widget textFormArea(String label, String controller) {
      return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: TextFormField(
            controller: _formDataController[controller],
            keyboardType: TextInputType.multiline,
            maxLines: 5,
            decoration: InputDecoration(
              labelText: label,
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Es un campo obligatorio';
              }
              return null;
            },
          )
      );
    }

    Widget textFormFieldGroup(String label, String controller, Icon icon) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: TextFormField(
          controller: _formDataController[controller],
          decoration: InputDecoration(
            labelText: label,
            suffixIcon: icon,
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Es un campo obligatorio';
            }
            return null;
          },
        ),
      );
    }

    Widget photoAdd() {
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
          icon: const Icon(Icons.add),
          onPressed: () {},
        ),
      );
    }

    Widget photoListAdd(List<String> photos) {
      return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                    'Fotos'
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: photos.length + 1,
                  itemBuilder: (context, index) {
                    if (index == photos.length) {
                      return photoAdd();
                    } else {
                      return SizedBox(
                        width: 100,
                        height: 100,
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

////
    DateTime toISODate(String date) {
      List <String> dateList = date.split("/");
      String isoDate = "${dateList[2]}-${dateList[1]}-${dateList[0]}";
      return DateTime.parse(isoDate);
    }

    Widget submitBtn(
        String label, Color color, GlobalKey<FormState> key) {
      return Container(
        //margin: const EdgeInsets.only(top: margin, bottom: margin),
          margin: const EdgeInsets.all(12),
          child: TextButton(
              onPressed: () {
                if (key.currentState!.validate()) {
                  data = {
                    ...data,
                    'subject': _formDataController['subject'].text,
                    'description': _formDataController['description'].text,
                    'when': toISODate(_formDataController['when'].text),
                    'where': _formDataController['where'].text,
                    'publisher': _formDataController['publisher'].text,
                  };
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data'))
                  );
                  SueCase.samples.add(data as SueCase);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SueDetail(sueCase: data as SueCase),
                    ),
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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Denunciar'),
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
                  textFormField("Delito", 'subject'),
                  textFormArea("Descripción", 'description'),
                  textFormFieldGroup("Lugar", 'where', const Icon(Icons.place)),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: TextFormField(
                        controller: _formDataController['when'],
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
                              _formDataController['when'].text = formattedDate;
                            });
                          }
                        }
                    ),
                  ),
                  photoListAdd(data['images']),
                  Row(
                    children: [
                      const Text('Conozco al denunciado'),
                      Checkbox(value: data['iKnow'],
                          onChanged: (bool? value) {
                            if (value != null) {
                              setState(() {
                                data['iKnow'] = value;
                              });
                            }
                          })
                    ],
                  ),
                  submitBtn("Guardar", const Color(0xFF79E070), _formKey)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
