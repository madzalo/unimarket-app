import 'package:equatable/equatable.dart';
import 'package:unimarket_app/features/product/domain/entities/product_entity.dart';

abstract class LocalProductsEvent extends Equatable {
  final ProductEntity? product;

  const LocalProductsEvent({this.product});

  @override
  List<Object> get props => [product!];
}

class GetSavedProducts extends LocalProductsEvent {
  const GetSavedProducts();
}

class RemoveProduct extends LocalProductsEvent {
  const RemoveProduct(ProductEntity product) : super(product: product);
}

class SaveProduct extends LocalProductsEvent {
  const SaveProduct(ProductEntity product) : super(product: product);
}
