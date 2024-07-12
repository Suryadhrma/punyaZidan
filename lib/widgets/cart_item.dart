import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';
import '../providers/cart_provider.dart';

class CartItemWidget extends StatelessWidget {
  final Cart item;

  CartItemWidget({required this.item});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return ListTile(
      title: Text(item.item.name),
      subtitle: Text('\$${item.item.price} x ${item.quantity}'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.remove),
            onPressed: () {
              cartProvider.removeItem(item.item);
            },
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              cartProvider.addItem(item.item);
            },
          ),
        ],
      ),
    );
  }
}
