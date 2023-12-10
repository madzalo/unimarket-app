import 'package:flutter/material.dart';
import 'package:unimarket_app/features/order/presentation/widgets/order_widget.dart';

class OrdersScreen extends StatefulWidget {
  static const String routeName = '/orders-screen';

  const OrdersScreen({Key? key}) : super(key: key);

  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

int count = 1;

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // actions: const Text("4 Items"),
        centerTitle: true,
        title: const Text("Orders"),
      ),
      body: const SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                OrderWidget(),
                OrderWidget(),
                OrderWidget(),
                OrderWidget(),
              ],
            )),
      ),
    );
  }
}
