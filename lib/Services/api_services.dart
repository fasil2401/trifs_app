import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:trifs_app/utils/constants/api_constants.dart';

class ApiManager {
  static final client = http.Client();
  static Future fetchData({String? api, var params}) async {
    var responses = await client.post(Uri.parse('${Api.apiUrl}$api'),
        body: json.encode(params),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        });
    if (responses.statusCode == 200) {
      var jsonResponse = jsonDecode(responses.body);
      return jsonResponse;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
