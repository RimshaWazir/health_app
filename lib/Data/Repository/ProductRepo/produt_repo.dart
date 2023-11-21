import 'dart:developer';

import 'package:stc_health_app/Application/Services/ApiServices/api_services.dart';
import 'package:stc_health_app/Data/DataSource/Resources/api_constants.dart';

class ProductRepo {
  Future getAllProducts() async {
    try {
      return await Api.get(ApiConstants.productAllUrl).then((productApiValue) {
        log('message : $productApiValue');
        return productApiValue;
      }).catchError((e) {
        throw e;
      });
    } catch (e) {
      rethrow;
    }
  }
}
