import 'package:flutter/material.dart';
import '../model/product.dart';

class ProductDetail extends StatelessWidget {

  static final routeName = '/product-detail';

  Product product;

  @override
  Widget build(BuildContext context) {
    final Product product = ModalRoute.of(context).settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: Center(child: Text('Product detail'),),
    );
  }
}