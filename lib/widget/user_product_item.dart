import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
import '../screens/edit_product_screen.dart';
import '../providers/product.dart';

class UserProductItem extends StatelessWidget {
  final Product product;

  UserProductItem(this.product);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.title),
      subtitle: Text(
        '\$${product.price}',
      ),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(product.imageUrl),
      ),
      trailing: Container(
        width: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              icon: Icon(
                Icons.edit,
                color: Theme.of(context).primaryColor,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(EditProductScreen.routeName,
                    arguments: product.id);
              },
            ),
            IconButton(
              icon: Icon(
                Icons.delete,
                color: Theme.of(context).errorColor,
              ),
              onPressed: () {
                AlertDialog alertDialog = AlertDialog(
                  title: Text('Are you sure?'),
                  content: Text('Do you really want to delete this product?'),
                  actions: [
                    FlatButton(
                      onPressed: () {
                        Provider.of<ProductsProvider>(context, listen: false).removeProduct(product.id);
                        Navigator.of(context).pop();
                      },
                      child: Text('Yes Proceed'),
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Cancel'),
                    ),
                  ],
                );
                showDialog(
                  context: context,
                  builder: (context) {
                    return alertDialog;
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
