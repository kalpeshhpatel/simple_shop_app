import 'package:flutter/material.dart';
import '../widget/products_grid.dart';
import '../mock/products.dart';
import '../providers/product.dart';

class ProductsOverview extends StatelessWidget {
  final List<Product> products = dummyProducts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Shop'),
      ),
      body: ProductsGrid(),
    );
  }
}
