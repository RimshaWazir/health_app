import 'package:flutter/foundation.dart';
import 'package:stc_health_app/Application/Services/ApiServices/api_services.dart';
import 'package:stc_health_app/Data/DataSource/Resources/api_constants.dart';

class AuthRepo {
  Future<Map<String, dynamic>> login(body) async {
    try {
      return await Api.post(
        ApiConstants.login,
        body,
      ).then((value) {
        if (kDebugMode) {
          print("P Response $value");
        }

        return value;
      }).catchError((e) {
        throw e;
      });
    } catch (e) {
      rethrow;
    }
  }
}
