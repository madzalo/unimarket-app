import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unimarket_app/core/common/custom_elevated_button.dart';
import 'package:unimarket_app/features/cart/presentation/widgets/cart_widget.dart';
import 'package:unimarket_app/features/product/domain/entities/product_entity.dart';
import 'package:unimarket_app/features/product/presentation/bloc/local/local_product_bloc.dart';
import 'package:unimarket_app/features/product/presentation/bloc/local/local_product_event.dart';

class CartScreen extends StatefulWidget {
  static const String routeName = '/cart-screen';
  final ProductEntity? product;

  const CartScreen({Key? key, this.product}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

int count = 1;

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // actions: const Text("4 Items"),
        centerTitle: true,
        title: const Text("Cart"),
      ),
      body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "K50000",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const CartWidget(),
                  const CartWidget(),
                  const CartWidget(),
                  const CartWidget(),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: CustomElevatedButton(
                          label: "Proceed To Checkout",
                          backgroundColor:
                              const Color.fromARGB(255, 20, 70, 219),
                          color: Colors.white,
                          onTap: () {}))
                ],
              ))),
    );
  }

  void _onAddToCart(BuildContext context, ProductEntity productEntity) {
    BlocProvider.of<LocalProductBloc>(context).add(SaveProduct(productEntity));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.black,
        content: Text('Article saved successfully.'),
      ),
    );
  }
}
