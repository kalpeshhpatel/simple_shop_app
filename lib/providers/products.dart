import 'package:flutter/material.dart';
import 'package:my_shop/mock/products.dart';
import '../model/product.dart';

class ProductsProvider with ChangeNotifier {
  List<Product> _items = dummyProducts;

  List<Product> get items {
    return [..._items];
  }
}