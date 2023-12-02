import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unimarket_app/features/product/presentation/bloc/product_bloc.dart';
import 'package:unimarket_app/features/product/presentation/bloc/product_event.dart';
import 'package:unimarket_app/features/seller/seller_home_screen.dart';
import 'package:unimarket_app/features/seller/seller_orders_screen.dart';
import 'package:unimarket_app/injection_container.dart';

class SellerMainScreen extends StatefulWidget {
  static const String routeName = '/seller-main-screen';

  const SellerMainScreen({Key? key}) : super(key: key);

  @override
  _SellerMainScreenState createState() => _SellerMainScreenState();
}

class _SellerMainScreenState extends State<SellerMainScreen> {
  List<Widget> pageList = const [
    SellerHomeScreen(),
    SellerOrdersScreen(),
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
                  icon: Icon(Icons.shopping_cart_checkout_rounded),
                  label: "Orders"),
            ],
            selectedIndex: _selectedIndex,
            onDestinationSelected: _onItemTapped,
          ),
        ));
  }
}
