import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:limachayapp/pages/signin/bloc/signin_bloc.dart';
import 'pages/signup/sign_up.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<SigninBloc>(
        create: (_) => SigninBloc(),
      ),
    ], child: MyApp());
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Limachay App',
        home: MaterialApp(title: 'Limachay', home: LogInForm()));
  }
}
