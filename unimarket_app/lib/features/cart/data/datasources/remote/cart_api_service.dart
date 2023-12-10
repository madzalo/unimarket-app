import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:unimarket_app/config/constants/constants.dart';
import 'package:unimarket_app/features/cart/data/model/cart_model.dart';

part 'cart_api_service.g.dart';

@RestApi(baseUrl: BaseUrl)
abstract class CartApiService {
  factory CartApiService(Dio dio) = _CartApiService;

  @GET("/cart")
  Future<HttpResponse<List<CartModel>>> getCartItems(
      @Header("Authorization") String token);

  @GET("/cart")
  Future<HttpResponse<void>> addToCart(
      @Header("Authorization") String token, @Body() CartModel cartModel);
}
