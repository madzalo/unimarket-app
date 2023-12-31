import 'package:flutter/material.dart';
import 'package:unimarket_app/features/auth/presentation/screens/register_screen.dart';
import 'package:unimarket_app/features/home/home_screen.dart';
import 'package:unimarket_app/features/seller/add_product_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case HomeScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const HomeScreen());

    case RegisterScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const RegisterScreen());

    case AddProductScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const AddProductScreen());

    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen does not exist!'),
          ),
        ),
      );
  }
}
