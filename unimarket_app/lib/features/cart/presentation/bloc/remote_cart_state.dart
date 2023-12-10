import 'package:dio/dio.dart';
import 'package:unimarket_app/features/cart/domain/entities/cart_entity.dart';

abstract class RemoteCartState {
  final List<CartEntity>? products;
  final DioException? error;

  const RemoteCartState({this.products, this.error});

  // @override
  // List<Object> get props => [products!, error!];
}

class RemoteCartLoading extends RemoteCartState {
  const RemoteCartLoading();
}

class RemoteCartDone extends RemoteCartState {
  const RemoteCartDone(List<CartEntity> products) : super(products: products);
}

class RemoteCartError extends RemoteCartState {
  const RemoteCartError(DioException error) : super(error: error);
}
