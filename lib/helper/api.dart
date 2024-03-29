import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> api({required String url}) async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          "there is an erro with status code ${response.statusCode} with body ${response.body}");
    }
  }
}
