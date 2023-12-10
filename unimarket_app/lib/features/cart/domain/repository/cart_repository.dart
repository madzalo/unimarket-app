import 'package:unimarket_app/core/resources/data_state.dart';
import 'package:unimarket_app/features/cart/domain/entities/cart_entity.dart';

abstract class CartRepository {
  Future<DataState<List<CartEntity>>> getCartItems();
  // Future<DataState<void>> addToCart(CartEntity cartEntity);
}
