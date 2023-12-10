import 'package:unimarket_app/core/resources/data_state.dart';
import 'package:unimarket_app/features/product/data/models/sell_product_model.dart';
import 'package:unimarket_app/features/product/domain/entities/product_entity.dart';

abstract class ProductRepository {
  Future<DataState<List<ProductEntity>>> getProducts();

  Future<List<ProductEntity>> getSavedProducts();

  Future<void> saveProduct(ProductEntity product);

  Future<DataState<String>> sellProduct(
    SellProductModel sellProductModel,
  );
}
