import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unimarket_app/features/product/presentation/bloc/product_bloc.dart';
import 'package:unimarket_app/features/product/presentation/bloc/product_state.dart';
import 'package:unimarket_app/features/seller/add_product_screen.dart';

class SellerHomeScreen extends StatefulWidget {
  static const String routeName = '/seller-home-screen';

  const SellerHomeScreen({Key? key}) : super(key: key);

  @override
  _SellerHomeScreenState createState() => _SellerHomeScreenState();
}

class _SellerHomeScreenState extends State<SellerHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
        if (state is ProductsLoading) {
          return const Center(child: CupertinoActivityIndicator());
        }

        if (state is ProductsLoadingDone) {
          return const Center(child: Text("Products Loaded"));
        }

        if (state is ProductsLoadingDoneError) {
          return Text(state.error?.response?.statusMessage as String);
        }
        return const Center(
          child: Text(
            "Seller Home Screen",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
          tooltip: "Add Product",
          onPressed: () {
            Navigator.pushNamed(context, AddProductScreen.routeName);
          },
          child: const Icon(Icons.add)),
    );
  }
}
