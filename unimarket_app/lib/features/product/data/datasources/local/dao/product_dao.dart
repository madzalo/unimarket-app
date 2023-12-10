import 'package:floor/floor.dart';
import 'package:unimarket_app/features/product/data/models/product_model.dart';

@dao
abstract class ProductDao {
  @Insert()
  Future<void> insertProduct(ProductModel product);

  @Query('SELECT * FROM product')
  Future<List<ProductModel>> getProducts();
}
