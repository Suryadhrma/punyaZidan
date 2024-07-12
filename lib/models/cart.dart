import 'item.dart';

class Cart {
  final Item item;
  int quantity;

  Cart({required this.item, this.quantity = 1});
}
