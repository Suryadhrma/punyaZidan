import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/wishlist_provider.dart';

class WishlistScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist'),
      ),
      body: ListView.builder(
        itemCount: wishlistProvider.items.length,
        itemBuilder: (context, index) {
          final wishlistItem = wishlistProvider.items[index];
          return ListTile(
            leading: Image.asset(
              wishlistItem.item.imagePath,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: Text(wishlistItem.item.name),
            subtitle: Text('\$${wishlistItem.item.price}'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                wishlistProvider.removeItem(wishlistItem.item);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${wishlistItem.item.name} dihapus dari wishlist!')),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
