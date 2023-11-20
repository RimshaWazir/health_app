import 'package:stc_health_app/Domain/Model/Product/product_model.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<ProductModel> productModel;
  ProductLoaded({required this.productModel});
}

class ProductError extends ProductState {
  final String message;
  ProductError({required this.message});
}
