import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:stc_health_app/Data/AppData/app_preferences.dart';

class Api {
  static Map<String, String> _authMiddleWare() {
    SharedPrefs.getUserToken();

    return {'Content-Type': 'application/json'};
  }

  static Future<dynamic> get(String url, {Map<String, String>? headers}) async {
    try {
      http.Response res = await http.get(
        Uri.parse(url),
        headers: headers ?? _authMiddleWare(),
      );
      if (res.statusCode == 200) {
        var decode = jsonDecode(res.body);
        return decode;
      }
      return {"success": false, "error": res.body, "body": null};
    } on SocketException {
      return {
        "success": false,
        "error": 'No Internet Please Connect To Internet',
      };
    } on HttpException catch (e) {
      return {
        "success": false,
        "error": e.message,
      };
    } catch (e) {
      return Future.error(e);
    }
  }

  static Future<Map<String, dynamic>> post(
      String url, Map<String, dynamic> body,
      {Map<String, String>? header}) async {
    try {
      http.Response res = await http.post(
        Uri.parse(url),
        headers: header ?? _authMiddleWare(),
        body: jsonEncode(body),
      );

      if (res.statusCode == 200 || res.statusCode == 201) {
        Map<String, dynamic> decode = jsonDecode(res.body);
        return decode;
      }

      return {"success": false, "error": res.body, "body": res.body};
    } on SocketException {
      return {
        "success": false,
        "error": 'No Internet Please Connect To Internet',
      };
    } on HttpException catch (e) {
      return {
        "success": false,
        "error": e.message,
      };
    } catch (e) {
      return Future.error(e);
    }
  }

  static Future post1(
    Map<String, dynamic> body, {
    required String url,
  }) async {
    try {
      final response = await http.post(Uri.parse(url),
          headers: _authMiddleWare(), body: jsonEncode(body));

      if (response.statusCode == 200) {
        return 200;
      } else {
        throw Exception('Failed to sign up user');
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  static Future<Map<String, dynamic>> put(
      String url, Map<String, dynamic>? body,
      {Map<String, String>? headers}) async {
    try {
      http.Response res = await http.put(
        Uri.parse(url),
        headers: headers ?? _authMiddleWare(),
        body: jsonEncode(body),
      );

      if (res.statusCode == 200 || res.statusCode == 201) {
        Map<String, dynamic> decode = jsonDecode(res.body);
        return decode;
      }

      return {
        "success": false,
        "error": "${res.statusCode} ${res.reasonPhrase}",
        "body": null
      };
    } catch (e) {
      return Future.error(e);
    }
  }

  static Future<Map<String, dynamic>> delete(String url, String id,
      {Map<String, String>? headers}) async {
    try {
      http.Response res = await http.delete(
        Uri.parse("$url/$id"),
        headers: headers ?? _authMiddleWare(),
      );
      if (res.statusCode == 200 || res.statusCode == 201) {
        Map<String, dynamic> decode = jsonDecode(res.body);
        return decode;
      }
      return {
        "success": false,
        "error": "${res.statusCode} ${res.reasonPhrase}",
        "body": null
      };
    } catch (e) {
      return Future.error(e);
    }
  }
}
