import 'package:flutter/material.dart';
import '../models/item.dart';
import '../models/wishlist.dart';

class WishlistProvider with ChangeNotifier {
  List<Wishlist> _items = [];

  List<Wishlist> get items => _items;

  void addItem(Item item) {
    for (Wishlist wishlistItem in _items) {
      if (wishlistItem.item == item) {
        return; // Item already in wishlist
      }
    }
    _items.add(Wishlist(item: item));
    notifyListeners();
  }

  void removeItem(Item item) {
    _items.removeWhere((wishlistItem) => wishlistItem.item == item);
    notifyListeners();
  }
}
