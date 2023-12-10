import 'package:equatable/equatable.dart';
import 'package:unimarket_app/features/product/domain/entities/product_entity.dart';

abstract class LocalProductsState extends Equatable {
  final List<ProductEntity>? products;

  const LocalProductsState({this.products});

  @override
  List<Object> get props => [products!];
}

class LocalProductsLoading extends LocalProductsState {
  const LocalProductsLoading();
}

class LocalProductsDone extends LocalProductsState {
  const LocalProductsDone(List<ProductEntity> products)
      : super(products: products);
}
