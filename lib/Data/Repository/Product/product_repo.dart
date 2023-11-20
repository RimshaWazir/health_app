import 'package:stc_health_app/Application/Services/ApiServices/api_provider.dart';

import '../../../Domain/Model/Product/product_model.dart';

class ProductRepository {
  final _apiProvider = ApiProvider();

  Future<List<ProductModel>> getShoppingItems() async {
    return _apiProvider.getShoppingItems();
  }
}
