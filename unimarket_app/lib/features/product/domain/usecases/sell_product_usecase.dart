import 'package:unimarket_app/core/resources/data_state.dart';
import 'package:unimarket_app/core/usecase/usecase.dart';
import 'package:unimarket_app/features/product/domain/repository/product_repository.dart';

class SellProductUseCase implements UseCase {
  final ProductRepository _produProductRepository;

  SellProductUseCase(this._produProductRepository);

  @override
  Future<DataState<String>> call({params}) {
    return _produProductRepository.sellProduct(params!);
  }
}
