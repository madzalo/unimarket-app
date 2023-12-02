import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:unimarket_app/features/product/domain/entities/product_entity.dart';

abstract class ProductState extends Equatable {
  final List<ProductEntity>? products;
  final DioException? error;

  const ProductState({this.products, this.error});

  @override
  List<Object> get props => [products!, error!];
}

class ProductsLoading extends ProductState {
  const ProductsLoading();
}

class ProductsLoadingDone extends ProductState {
  const ProductsLoadingDone(List<ProductEntity> product)
      : super(products: product);
}

class ProductsLoadingDoneError extends ProductState {
  const ProductsLoadingDoneError({DioException? error}) : super(error: error);
}
