import 'dart:developer';

import 'package:stc_health_app/Data/DataSource/Resources/imports.dart';
import 'package:stc_health_app/Data/Repository/ProductRepo/produt_repo.dart';
import 'package:stc_health_app/Domain/Models/ProductModels/product_model.dart';

part '../State/product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  getAllProducts() async {
    await Future.delayed(const Duration(milliseconds: 16));
    emit(ProductLoading());
    await ProductRepo().getAllProducts().then((value) async {
      log('value $value');
      if (value.runtimeType != List && value["success"] != null) {
        emit(ProductError(error: value['error']));
        print(value['error']);
      } else {
        //  SharedPrefs.setUserToken(token: value['token']);
        List<ProductModel> allProductData =
            List<ProductModel>.from(value.map((x) => ProductModel.fromMap(x)));
        print(allProductData.length);

        emit(ProductSuccess(product: allProductData));
        // var error= jsonDecode(value["body"]);
        // emit(ErrorEmailSigIn(error: error["error"]));
      }
    }).catchError((error) {
      print(error);
      emit(ProductError(error: error.toString()));
    });
  }
}
