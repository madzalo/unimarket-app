import 'package:unimarket_app/core/resources/data_state.dart';
import 'package:unimarket_app/core/usecase/usecase.dart';
import 'package:unimarket_app/features/cart/domain/entities/cart_entity.dart';
import 'package:unimarket_app/features/cart/domain/repository/cart_repository.dart';

class GetCartItemsUseCase
    implements UseCase<DataState<List<CartEntity>>, void> {
  final CartRepository _cartRepository;

  GetCartItemsUseCase(this._cartRepository);

  @override
  Future<DataState<List<CartEntity>>> call({void params}) {
    return _cartRepository.getCartItems();
  }
}
