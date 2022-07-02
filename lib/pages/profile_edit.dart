import 'package:flutter/material.dart';

var validation = {
  'dni': {
    'regex': RegExp(r'^[0-9]{8}$'),
    'message': 'El DNI debe tener 8 dígitos'
  },
  'name': {
    'regex': RegExp(r'^[a-zA-ZÁÉÍÓÚáéíóúñÑ ]$'),
    'message': 'El nombre solo puede contener letras y espacios (Español)'
  },
  'telephone': {
    'regex': RegExp(r'^(9)[0-9]{8}$'),
    'message': 'El teléfono debe tener 9 dígitos y empezar por 9'
  },
  'user': {
    'regex': RegExp(r'^[a-zA-Z0-9_.]{3,}$'),
    'message': 'El usuario debe tener al menos 3 caracteres, puede contener letras, números, guiones y puntos'
  },
  'email': {
    'regex': RegExp(r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$'),
    'message': 'El email debe tener un formato válido'
  },
  'password': {
    'regex': RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,}$'),
    'message': 'La contraseña debe tener al menos 8 caracteres, una mayúscula, una minúscula, un número y un caracter especial'
  },
};

var fieldConfig = {
  'height': 50.0,
  'padding': const EdgeInsets.symmetric(vertical: 16.0),
};


class ProfileEdit extends StatefulWidget {
  const ProfileEdit({Key? key}) : super(key: key);

  @override
  _ProfileEditState createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  final _formKey = GlobalKey<FormState>();
  late Map _passwordVisible;
  Map passwordController = {
    'pastPassword': TextEditingController(),
    'newPassword': TextEditingController(),
    'confirmPassword': TextEditingController(),
  };

  @override
  void dispose() {
    passwordController['pastPassword'].dispose();
    passwordController['newPassword'].dispose();
    passwordController['confirmPassword'].dispose();
    super.dispose();
  }

  @override
  void initState() {
    _passwordVisible = {
      'pastPassword': false,
      'newPassword': false,
      'confirmPassword': false,
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    Widget appBar(String title) {
      return AppBar(
        leading: const BackButton(
          color: Colors.black,
        ),
        title: Text(title),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 27,
          fontWeight: FontWeight.w500,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      );
    }

    Widget textFormField (String label, Map validation) {
      return Padding(
        padding: fieldConfig['padding'] as EdgeInsets,
        child: SizedBox(
            height: fieldConfig['height'] as double,
            child: TextFormField(
              decoration: InputDecoration(
                labelText: label,
              ),
              validator: (String? value) {
                if (value!.isEmpty) {
                  return 'Campo obligatorio: $label no puede estar vacío';
                } else if (!validation['regex'].hasMatch(value)) {
                  return validation['message'];
                }
              },
            )
        ),
      );
    }

    Widget passwordFormField(String label, String key, Map validation, bool isObscure) {
      return  Padding(
        padding: fieldConfig['padding'] as EdgeInsets,
        child: SizedBox(
          height: fieldConfig['height'] as double,
          child: TextFormField(
            controller: passwordController[key],
            obscureText: !isObscure,
            decoration: InputDecoration(
                labelText: label,
                suffixIcon: IconButton(
                  icon: Icon(
                    !isObscure
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.black,
                  ), onPressed: () {
                  setState(() {
                    _passwordVisible = {
                      ..._passwordVisible,
                      key: !isObscure,
                    };
                  });
                },
                )
            ),
            validator: (String? value) {
              if (value!.isEmpty) {
                return 'Introduzca una contraseña';
              } else if (!validation['regex'].hasMatch(value)) {
                return validation['message'];
              }
            },
          ),
        ),
      );
    }

    ScaffoldFeatureController scaffoldMessenger(String content, bool error, BuildContext context) {
      return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(content),
          duration: const Duration(seconds: 2),
          backgroundColor: error ? Colors.red : Colors.green,
        ),
      );
    }

    Widget elevatedButton(String label, BuildContext context) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
        child: ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              if (passwordController['pastPassword'].text != passwordController['newPassword']) {
                if (passwordController['newPassword'].text == passwordController['confirmPassword'].text) {
                  scaffoldMessenger('Actualizado', false, context);
                } else {
                  scaffoldMessenger('Las contraseña nueva no coincide', true, context);
                }
              } else {
                scaffoldMessenger('La contraseña nueva y actual son las mismas', true, context);
              }
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

    return Scaffold(
      appBar: appBar('Editar perfil') as AppBar,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Container(
                margin: const EdgeInsets.all(16),
                child: Column(
                  children: <Widget>[
                    textFormField("DNI", validation['dni'] as Map),
                    textFormField("Nombre", validation['name'] as Map),
                    textFormField("Apellido", validation['name'] as Map),
                    textFormField("Teléfono", validation['telephone'] as Map),
                    textFormField("Usuario", validation['user'] as Map),
                    textFormField("Email", validation['email'] as Map),
                    passwordFormField("Contraseña antigua", 'pastPassword', validation['password'] as Map, _passwordVisible['pastPassword']),
                    passwordFormField("Contraseña nueva", 'newPassword' , validation['password'] as Map, _passwordVisible['newPassword']),
                    passwordFormField("Confirmar contraseña", 'confirmPassword' , validation['password'] as Map, _passwordVisible['confirmPassword']),
                    elevatedButton("Guardar", context)
                  ],
                )
              )
            )
          )
        )
      )
    );
  }
}