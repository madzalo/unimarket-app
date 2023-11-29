import 'package:flutter/material.dart';

class SellerOrdersScreen extends StatefulWidget {
  static const String routeName = '/seller-orders-screen';

  const SellerOrdersScreen({Key? key}) : super(key: key);

  @override
  _SellerOrdersScreenState createState() => _SellerOrdersScreenState();
}

class _SellerOrdersScreenState extends State<SellerOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Seller Orders Screen"),
      ),
    );
  }
}
