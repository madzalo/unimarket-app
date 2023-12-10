import 'dart:io';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unimarket_app/core/resources/data_state.dart';
import 'package:unimarket_app/features/cart/data/datasources/remote/cart_api_service.dart';
import 'package:unimarket_app/features/cart/data/model/cart_model.dart';
import 'package:unimarket_app/features/cart/domain/repository/cart_repository.dart';

class CartRepositoryImpl extends CartRepository {
  final CartApiService _cartApiService;

  CartRepositoryImpl(this._cartApiService);

  @override
  Future<DataState<List<CartModel>>> getCartItems() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    token = "Bearer $token";

    try {
      final httpResponse = await _cartApiService.getCartItems(token);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        print(httpResponse.data);
        return DataSuccess(httpResponse.data);
      } else {
        print("Response \n \n \n ${httpResponse.response.statusMessage}");
        return DataFailed(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (error) {
      print("Error \n \n \n ${error.response!.statusMessage}");
      return DataFailed(error);
    }
  }

  // @override
  // Future<DataState<void>> addToCart(CartEntity cartEntity) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? token = prefs.getString('token');
  //   token = "Bearer $token";

  // }
}
