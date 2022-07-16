import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:limachayapp/services/model/model_response.dart';

class StatusService {
  static const String url = 'https://limachay.herokuapp.com';

  Future<Response> get statusModel async {
    final http.Response response = await http.get(Uri.parse('$url/status/all'));
    if (response.statusCode == 200) {
      print(response.body);
      return Response.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load status');
    }
  }
}