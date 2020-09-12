import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../mock/products.dart';
import '../screens/cart_screen.dart';
import '../providers/cart.dart';
import '../providers/product.dart';
import '../widget/badge.dart';
import '../widget/products_grid.dart';
import '../widget/app_drawer.dart';

enum FilterOptions { Favorites, All }

class ProductsOverview extends StatefulWidget {
  @override
  _ProductsOverviewState createState() => _ProductsOverviewState();
}

class _ProductsOverviewState extends State<ProductsOverview> {
  final List<Product> products = dummyProducts;
  bool _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Shop'),
        actions: [
          Consumer<Cart>(
            builder: (context, cartData, child) => Badge(
              value: cartData.itemCount.toString(),
              child: child,
            ),
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Text('Only Favorites'),
                  value: FilterOptions.Favorites,
                ),
                PopupMenuItem(
                  child: Text('All'),
                  value: FilterOptions.All,
                ),
              ];
            },
            onSelected: (FilterOptions value) {
              setState(() {
                _showOnlyFavorites = value == FilterOptions.Favorites;
              });
            },
          )
        ],
      ),
      body: ProductsGrid(_showOnlyFavorites),
      drawer: AppDrawer(),
    );
  }
}
