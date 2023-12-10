import 'package:unimarket_app/core/usecase/usecase.dart';
import 'package:unimarket_app/features/product/domain/entities/product_entity.dart';
import 'package:unimarket_app/features/product/domain/repository/product_repository.dart';

class SaveProductUseCase implements UseCase<void, ProductEntity> {
  final ProductRepository _productRepository;

  SaveProductUseCase(this._productRepository);

  @override
  Future<void> call({ProductEntity? params}) {
    return _productRepository.saveProduct(params!);
  }
}
