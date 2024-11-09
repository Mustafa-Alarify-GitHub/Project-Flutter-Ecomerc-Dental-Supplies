import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  static Future<dynamic> get(String url) async {
    return _sendRequest(() => http.get(Uri.parse(url)));
  }

  static Future<dynamic> post(String url, Map<String, dynamic> data) async {
    return _sendRequest(() => http.post(Uri.parse(url), body: data));
  }

  static Future<dynamic> put(String url, Map<String, dynamic> data) async {
    return _sendRequest(() => http.put(Uri.parse(url), body: data));
  }

  static Future<dynamic> delete(String url) async {
    return _sendRequest(() => http.delete(Uri.parse(url)));
  }

  static Future<dynamic> _sendRequest(Future<http.Response> Function() request) async {
    try {
      final response = await request();

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print("Error: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Exception: $e");
      return null;
    }
  }
}
