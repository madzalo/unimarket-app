// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:unimarket_app/features/product/domain/entities/product_entity.dart';

class CartEntity extends Equatable {
  final List<ProductEntity>? products;

  const CartEntity({
    this.products,
  });

  @override
  List<Object?> get props => [products!];
}
