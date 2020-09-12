import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';

class CartItemView extends StatelessWidget {
  final CartItem cartItem;
  final String productId;

  CartItemView(this.cartItem, this.productId);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<Cart>(context, listen: false);
    return Dismissible(
      key: ValueKey(cartItem.id),
      direction: DismissDirection.endToStart,
      confirmDismiss: (_) {
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('Are you sure...'),
            content: Text('Do you want to remove the item?'),
            actions: [
              FlatButton(
                onPressed: () {
                  return Navigator.of(context).pop(false);
                },
                child: Text('No'),
              ),
              FlatButton(
                onPressed: () {
                  return Navigator.of(context).pop(true);
                },
                child: Text('Yes'),
              )
            ],
          ),
        );
      },
      onDismissed: (DismissDirection _) {
        cartProvider.removeItem(productId);
      },
      background: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 4,
        ),
        alignment: Alignment.centerRight,
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
      ),
      child: Card(
        margin: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 4,
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                padding: EdgeInsets.all(4),
                child: FittedBox(
                  child: Text('\$${cartItem.price}'),
                ),
              ),
            ),
            title: Text(cartItem.title),
            subtitle: Text('Total: ${cartItem.price * cartItem.quantity}'),
            trailing: Text('${cartItem.quantity} x'),
          ),
        ),
      ),
    );
  }
}
