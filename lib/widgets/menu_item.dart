import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/item.dart';
import '../providers/cart_provider.dart';
import '../providers/wishlist_provider.dart';
import '../screens/item_detail_screen.dart';

class MenuItemWidget extends StatelessWidget {
  final Item item;

  MenuItemWidget({required this.item});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final wishlistProvider = Provider.of<WishlistProvider>(context);

    return ListTile(
      leading: Image.asset(
        item.imagePath,
        width: 50,
        height: 50,
        fit: BoxFit.cover,
      ),
      title: Text(item.name),
      subtitle: Text('\$${item.price}'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () {
              wishlistProvider.addItem(item);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${item.name} ditambahkan ke wishlist!')),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  int quantity = 1;
                  return AlertDialog(
                    title: Text('Pilih jumlah'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(item.name),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () {
                                if (quantity > 1) quantity--;
                              },
                            ),
                            Text(quantity.toString()),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                quantity++;
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    actions: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          cartProvider.addItem(item, quantity);
                          Navigator.of(context).pop();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('$quantity ${item.name} berhasil ditambahkan ke keranjang!')),
                          );
                        },
                        child: Text('Tambah ke Keranjang'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ItemDetailScreen(item: item)),
        );
      },
    );
  }
}
