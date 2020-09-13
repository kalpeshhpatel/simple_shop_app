import 'package:flutter/material.dart';
import '../mock/products.dart';
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

  void addProduct(Product product) {
    final newProduct = Product(
      title: product.title,
      description: product.description,
      price: product.price,
      imageUrl: product.imageUrl,
      id: DateTime.now().toString(),
    );
    _items.add(newProduct);
    notifyListeners();
  }
}
