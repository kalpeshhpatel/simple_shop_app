import 'package:flutter/material.dart';
import 'package:my_shop/mock/products.dart';
import './product.dart';

class ProductsProvider with ChangeNotifier {
  List<Product> _items = dummyProducts;

  List<Product> get items {
    return [..._items];
  }

  Product findById(String productId) {
    return _items.firstWhere((element) => element.id == productId);
  }

  List<Product> get favoritesProducts {
    return items.where((element) => element.isFavorite == true).toList();
  }
}