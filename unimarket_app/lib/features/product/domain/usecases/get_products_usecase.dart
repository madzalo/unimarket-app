import 'package:unimarket_app/core/resources/data_state.dart';
import 'package:unimarket_app/core/usecase/usecase.dart';
import 'package:unimarket_app/features/product/domain/entities/product_entity.dart';
import 'package:unimarket_app/features/product/domain/repository/product_repository.dart';

class GetProductsUseCase
    implements UseCase<DataState<List<ProductEntity>>, void> {
  final ProductRepository productRepository;

  GetProductsUseCase(this.productRepository);

  @override
  Future<DataState<List<ProductEntity>>> call({void params}) {
    return productRepository.getProducts();
  }
}
