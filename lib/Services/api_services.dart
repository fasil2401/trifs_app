import 'package:http/http.dart' as http;
import 'package:trifs_app/utils/constants/api_constants.dart';

class ApiManager {
  static final client = http.Client();

  static Future fetchData({String? api}) async {
    var responses = await client.post(
        Uri.parse('${Api.apiUrl}$api')) ;
        if (responses.statusCode == 200) {
          var jsonResponse = responses.body;
          return jsonResponse;
        } else {
          throw Exception('Failed to load data');
        }
  }
}