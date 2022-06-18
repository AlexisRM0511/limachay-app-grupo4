import 'package:flutter/material.dart';

class ProfileEdit extends StatefulWidget{
  const ProfileEdit({Key? key}) : super(key: key);
  @override
  ProfileEditState createState() => ProfileEditState();
}

class ProfileEditState extends State<ProfileEdit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Center(
              child: Column(
                children: [
                  Text('Editar Perfil',
                style: TextStyle(
                  fontSize: 27,)
                  ),
                ],
              )
          )
      ),
    );
  }
}
