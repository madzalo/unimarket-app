import 'package:unimarket_app/core/usecase/usecase.dart';
import 'package:unimarket_app/features/product/domain/entities/product_entity.dart';
import 'package:unimarket_app/features/product/domain/repository/product_repository.dart';

class GetSavedProductsUseCase implements UseCase<List<ProductEntity>, void> {
  final ProductRepository productRepository;

  GetSavedProductsUseCase(this.productRepository);

  @override
  Future<List<ProductEntity>> call({void params}) {
    return productRepository.getSavedProducts();
  }
}
