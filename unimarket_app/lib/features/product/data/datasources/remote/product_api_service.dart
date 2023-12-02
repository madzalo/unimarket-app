import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:unimarket_app/config/constants/constants.dart';
import 'package:unimarket_app/features/product/data/models/add_new_product.dart';
import 'package:unimarket_app/features/product/data/models/product_model.dart';

part 'product_api_service.g.dart';

@RestApi(baseUrl: BaseUrl)
abstract class ProductApiService {
  factory ProductApiService(Dio dio) = _ProductApiService;

  @POST("/products")
  Future<HttpResponse<String>> sellProduct(
    @Body() AddNewProductModel addNewProductModel,
  );

  @GET("/products")
  Future<HttpResponse<List<ProductModel>>> getProducts();
}
