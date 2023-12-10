// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unimarket_app/core/resources/data_state.dart';
import 'package:unimarket_app/features/product/data/datasources/local/app_database.dart';
import 'package:unimarket_app/features/product/data/datasources/remote/product_api_service.dart';
import 'package:unimarket_app/features/product/data/models/add_new_product.dart';
import 'package:unimarket_app/features/product/data/models/product_model.dart';
import 'package:unimarket_app/features/product/data/models/sell_product_model.dart';
import 'package:unimarket_app/features/product/domain/entities/product_entity.dart';
import 'package:unimarket_app/features/product/domain/repository/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository {
  final ProductApiService _producProductApiService;
  final AppDatabase _appDatabase;

  ProductRepositoryImpl(this._producProductApiService, this._appDatabase);

  @override
  Future<DataState<String>> sellProduct(
      SellProductModel sellProductModel) async {
    final cloudinary = CloudinaryPublic("dnycfh2tg", "sjvo1hvy");
    List<String> imageUrls = [];
    print(sellProductModel.category);
    print(sellProductModel.images);

    String? name = sellProductModel.name;
    String? description = sellProductModel.description;
    double? price = sellProductModel.price;
    double? quantity = sellProductModel.quantity;
    String? category = sellProductModel.category;

    try {
      for (int i = 0; i < sellProductModel.images.length; i++) {
        CloudinaryResponse res = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(sellProductModel.images[i].path,
              resourceType: CloudinaryResourceType.Image,
              folder: sellProductModel.name),
        );
        print(res.secureUrl);
        imageUrls.add(res.secureUrl);
      }
    } on CloudinaryException catch (e) {
      print(e.message);
      print(e.request);
    }
    try {
      final httpResponse = await _producProductApiService.sellProduct(
          AddNewProductModel(
              name: name,
              description: description,
              price: price,
              quantity: quantity,
              category: category,
              imageUrls: imageUrls));
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
      // print("Error \n \n \n ${error.response!.statusMessage}");
      return DataFailed(error);
    }
  }

  @override
  Future<DataState<List<ProductModel>>> getProducts() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    token = "Bearer $token";
    print("Repository: $token");

    try {
      final httpResponse = await _producProductApiService.getProducts();
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

  @override
  Future<List<ProductModel>> getSavedProducts() async {
    return _appDatabase.productDao.getProducts();
  }

  @override
  Future<void> saveProduct(ProductEntity product) {
    return _appDatabase.productDao
        .insertProduct(ProductModel.fromEntity(product));
  }
}
