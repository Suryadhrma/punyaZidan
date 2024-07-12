import 'package:flutter/material.dart';
import '../models/item.dart';
import '../models/cart.dart';

class CartProvider with ChangeNotifier {
  List<Cart> _items = [];

  List<Cart> get items => _items;

  double get totalPrice => _items.fold(0, (sum, item) => sum + (item.item.price * item.quantity));

  void addItem(Item item, [int quantity = 1]) {
    for (Cart cartItem in _items) {
      if (cartItem.item == item) {
        cartItem.quantity += quantity;
        notifyListeners();
        return;
      }
    }
    _items.add(Cart(item: item, quantity: quantity));
    notifyListeners();
  }

  void removeItem(Item item) {
    for (Cart cartItem in _items) {
      if (cartItem.item == item) {
        if (cartItem.quantity > 1) {
          cartItem.quantity--;
        } else {
          _items.remove(cartItem);
        }
        notifyListeners();
        return;
      }
    }
  }
}
