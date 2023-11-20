import 'package:flutter/widgets.dart';

@immutable
abstract class ProductEvent {}

class GetShoppingItems extends ProductEvent {}
