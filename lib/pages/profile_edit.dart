import 'package:flutter/material.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({Key? key}) : super(key: key);

  @override
  _ProfileEditState createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black,
        ),
        title: const Text('Editar perfil'),
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
                  _TextFormField("DNI", RegExp(r'^[0-9]{8}$')),
                  _TextFormField("Nombre", RegExp(r'^[a-zA-ZÁÉÍÓÚáéíóúñÑ ]$')),
                  _TextFormField("Apellido", RegExp(r'^[a-zA-ZÁÉÍÓÚáéíóúñÑ ]$')),
                  _TextFormField("Teléfono", RegExp(r'^(9)[0-9]{8}$')),
                  _TextFormField("Usuario", RegExp(r'^[a-zA-Z0-9_.]{3,}$')),
                  _TextFormField("Email", RegExp(r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$')),
                  _TextFormField("Contraseña", RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,}$'), isPassword: true),
                  _TextFormField("Confirmar contraseña", RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,}$'), isPassword: true),
                  _ElevatedButton("Guardar", _formKey, context)
                ],
              )
            )
          )
        )
      )
    );
  }
}

Widget _TextFormField (String label, RegExp regex, {bool isPassword = false}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 16.0),
    child: Container(
      height: 50,
      child: TextFormField(
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: label,
        ),
        validator: (String? value) {
          if (value!.isEmpty) {
            return 'Campo obligatorio';
          }
          if (!regex.hasMatch(value)) {
            if (isPassword) {
              return 'Contraseña inválida: debe tener al menos 8 caracteres, una letra mayúscula, una letra minúscula, un número y un caracter especial';
            }
            return '${label} inválido';
          }
          return null;
        },
      )
    ),
  );
}

Widget _ElevatedButton(String label, GlobalKey<FormState> key, BuildContext context) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
    child: ElevatedButton(
      onPressed: () {
        if (key.currentState!.validate()) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Guardado'),
            )
          );
        }
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.green,
        minimumSize: const Size.fromHeight(50),
      ),
      child: Text(label),
    ),
  );
}