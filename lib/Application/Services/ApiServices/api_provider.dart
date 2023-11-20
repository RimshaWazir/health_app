import 'dart:developer' as developer;

import 'package:dio/dio.dart';
import 'package:stc_health_app/Domain/Model/Product/product_model.dart';

class ApiProvider {
  final Dio _dio = Dio();
  static const shoppingHomeUrl = 'https://fakestoreapi.com/products';

  final List<ProductModel> _shoppingHome = [];

  Future<List<ProductModel>> getShoppingItems() async {
    try {
      Response response = await _dio.get(shoppingHomeUrl);
      _shoppingHome.addAll(
          List.from(response.data).map((e) => ProductModel.fromJson(e)));
      return _shoppingHome;
    } catch (e) {
      developer.log(e.toString());
      return [];
    }
  }
}
