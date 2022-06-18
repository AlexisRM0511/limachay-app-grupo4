import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/status_model.dart';

Future<List> fetchGet() async {
  const String url = 'https://limachay.herokuapp.com';
  var statusList = [];
  final response = await http.get(Uri.parse('$url/status/all'));
  return jsonDecode(response.body) as List<dynamic>;

}
