import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Keranjang'),
      ),
      body: ListView.builder(
        itemCount: cartProvider.items.length,
        itemBuilder: (context, index) {
          return CartItemWidget(item: cartProvider.items[index]);
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total: \$${cartProvider.totalPrice}'),
              ElevatedButton(
                onPressed: () {
                  // Logic to place order
                },
                child: Text('Pesan Sekarang'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
