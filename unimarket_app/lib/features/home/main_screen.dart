import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unimarket_app/features/cart/presentation/screens/cart_screen.dart';
import 'package:unimarket_app/features/home/home_screen.dart';
import 'package:unimarket_app/features/order/presentation/screens/order_screen.dart';
import 'package:unimarket_app/features/product/presentation/bloc/product_bloc.dart';
import 'package:unimarket_app/features/product/presentation/bloc/product_event.dart';
import 'package:unimarket_app/features/wishlist/presentation/screens/wishlist_screen.dart';
import 'package:unimarket_app/injection_container.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  static const routeName = "/main-screen";

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> pageList = const [
    HomeScreen(),
    WishlistScreen(),
    CartScreen(),
    OrdersScreen(),
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductBloc>(
        create: (_) => sl()..add(GetProducts()),
        child: Scaffold(
          body: pageList[_selectedIndex],
          bottomNavigationBar: NavigationBar(
            destinations: const [
              NavigationDestination(
                  icon: Icon(Icons.home_outlined), label: "Home"),
              NavigationDestination(
                  icon: Icon(Icons.favorite_outline_outlined),
                  label: "Wishlist"),
              NavigationDestination(
                  icon: Icon(Icons.shopping_cart_outlined), label: "Cart"),
              NavigationDestination(
                  icon: Icon(Icons.shopping_cart_checkout_rounded),
                  label: "Orders"),
            ],
            selectedIndex: _selectedIndex,
            onDestinationSelected: _onItemTapped,
          ),
        ));
  }
}
