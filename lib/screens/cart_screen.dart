import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/orders.dart';
import '../providers/cart.dart';
import '../widget/cart_item_view.dart';
import './orders_screen.dart';

class CartScreen extends StatelessWidget {
  static final routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<Cart>(context);
    final orderProvider = Provider.of<Orders>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      '\$${cartProvider.totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: Theme.of(context).primaryTextTheme.title.color,
                      ),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  FlatButton(
                    child: Text('Order Now'),
                    textColor: Theme.of(context).primaryColor,
                    onPressed: () {
                      orderProvider.addOrder(cartProvider.items.values.toList(), cartProvider.totalAmount);
                      cartProvider.clearCart();
                      Navigator.of(context).popAndPushNamed(OrdersScreen.routeName);
                    },
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cartProvider.items.length,
              itemBuilder: (context, index) {
                return CartItemView(
                  cartProvider.items.values.toList()[index],
                  cartProvider.items.keys.toList()[index],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
