import 'package:flutter/material.dart';
import '../models/item.dart';
import '../widgets/menu_item.dart';
import 'item_detail_screen.dart'; // Import ItemDetailScreen

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  List<Item> menuItems = [
    Item(name: 'Burger', price: 5.0, imagePath: 'assets/images/burger.jpg'),
    Item(name: 'Fries', price: 2.5, imagePath: 'assets/images/fries.jpg'),
    Item(name: 'Soda', price: 1.5, imagePath: 'assets/images/soda.jpg'),
  ];

  List<Item> filteredItems = []; // Inisialisasi filteredItems

  @override
  void initState() {
    super.initState();
    filteredItems = menuItems; // Assign awal
  }

  void _filterItems(String query) {
    final List<Item> filtered = menuItems.where((item) {
      return item.name.toLowerCase().contains(query.toLowerCase());
    }).toList();
    setState(() {
      filteredItems = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: ItemSearchDelegate(menuItems, _filterItems),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: filteredItems.length,
        itemBuilder: (context, index) {
          return MenuItemWidget(item: filteredItems[index]);
        },
      ),
    );
  }
}

class ItemSearchDelegate extends SearchDelegate {
  final List<Item> items;
  final Function(String) onQueryChanged;

  ItemSearchDelegate(this.items, this.onQueryChanged);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
          onQueryChanged(query);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = items.where((item) {
      return item.name.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestions[index].name),
          onTap: () {
            close(context, null);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ItemDetailScreen(item: suggestions[index])),
            );
          },
        );
      },
    );
  }
}
