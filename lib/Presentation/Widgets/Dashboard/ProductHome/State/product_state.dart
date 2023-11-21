part of '../Controller/product_cubit.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductSuccess extends ProductState {
  final List<ProductModel> product;
  ProductSuccess({required this.product});
}

class ProductError extends ProductState {
  final String error;
  ProductError({required this.error});
}
