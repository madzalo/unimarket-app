import 'package:unimarket_app/features/cart/domain/entities/cart_entity.dart';
import 'package:unimarket_app/features/product/data/models/product_model.dart';

class CartModel extends CartEntity {
  const CartModel({final List<ProductModel>? products})
      : super(products: products);

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        products: List<ProductModel>.from(
            json["products"].map((x) => ProductModel.fromJson(x))),
      );

  //     factory CartModel.fromEntity(CartEntity entity) {
  //   return CartModel(
  //       products: entity.products.map((e) => null)
  //       );
  // }
}
