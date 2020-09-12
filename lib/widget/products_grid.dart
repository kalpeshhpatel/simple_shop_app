
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
import '../widget/product_item.dart';

class ProductsGrid extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductsProvider>(context);
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: productProvider.items.length,
      itemBuilder: (ctx, i) {
        return ProductItem(product: productProvider.items[i]);
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}