import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'screens/menu_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/wishlist_screen.dart';
import 'providers/cart_provider.dart';
import 'providers/wishlist_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => WishlistProvider()),
      ],
      child: MaterialApp(
        title: 'Restoran Cepat Saji',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),
          '/menu': (context) => MenuScreen(),
          '/cart': (context) => CartScreen(),
          '/profile': (context) => ProfileScreen(),
          '/wishlist': (context) => WishlistScreen(),
        },
      ),
    );
  }
}
