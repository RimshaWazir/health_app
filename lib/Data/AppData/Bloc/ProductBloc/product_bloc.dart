import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stc_health_app/Data/AppData/Bloc/ProductBloc/product_event.dart';
import 'package:stc_health_app/Data/AppData/Bloc/ProductBloc/product_state.dart';
import 'package:stc_health_app/Data/Repository/Product/product_repo.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    final ProductRepository productRepository = ProductRepository();
    on<GetShoppingItems>((event, emit) async {
      try {
        emit(ProductLoading());
        final shoppingItems = await productRepository.getShoppingItems();
        emit(ProductLoaded(productModel: shoppingItems));
      } catch (e) {
        emit(ProductError(message: e.toString()));
      }
    });
  }
}
