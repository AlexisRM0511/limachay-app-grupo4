import 'package:flutter/material.dart';
import 'package:limachayapp/services/models/response.dart';
import 'package:limachayapp/services/services/status_service.dart';
import './pages/log_in.dart';
import './pages/main_home.dart';

void main() {
  runApp(const Limachay());
}

class Limachay extends StatelessWidget {
  const Limachay({Key? key}) : super(key: key);

  /*@override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Limachay',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Limachay'),
        ),
        body: FutureBuilder<Response?>(
            future: StatusService().statusModel,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              } else {
                final Response? response = snapshot.data;
                return ListView.builder(
                  itemCount: response?.data.length ?? 0,
                  itemBuilder: (context, index) {
                    return ListTile(title: Text(response!.data[index].name));
                  },
                );
              }
            }),
      ),
    );
  }*/

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Limachay', home: const LogInForm(), routes: {
      "/home": (BuildContext context) => const MainHome(),
    });
  }
}
