import 'package:flutter/material.dart';
import '../models/item.dart';

class ItemDetailScreen extends StatelessWidget {
  final Item item;

  ItemDetailScreen({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            item.imagePath,
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  '\$${item.price}',
                  style: TextStyle(fontSize: 20, color: Colors.green),
                ),
                SizedBox(height: 20),
                Text(
                  'Deskripsi item...',
                  style: TextStyle(fontSize: 16),
                ),
                // Add more details if needed
              ],
            ),
          ),
        ],
      ),
    );
  }
}
