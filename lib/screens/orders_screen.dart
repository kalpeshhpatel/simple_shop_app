import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widget/app_drawer.dart';
import '../providers/orders.dart' show Orders;
import '../widget/order_item.dart';

class OrdersScreen extends StatelessWidget {
  static final routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<Orders>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
      ),
      body: ListView.builder(
        itemCount: orderProvider.orders.length,
        itemBuilder: (ctx, index) {
          return OrderItem(orderProvider.orders[index]);
        },
      ),
      drawer: AppDrawer(),
    );
  }
}
