import 'dart:io';

import 'package:dio/dio.dart';
import 'package:unimarket_app/core/resources/data_state.dart';
import 'package:unimarket_app/features/auth/data/datasources/remote/user_api_service.dart';
import 'package:unimarket_app/features/auth/data/models/signin_model.dart';
import 'package:unimarket_app/features/auth/data/models/signup_model.dart';
import 'package:unimarket_app/features/auth/domain/repository/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final UserApiService _userApiService;

  UserRepositoryImpl(this._userApiService);

  @override
  Future<DataState<String>> signin(SignInModel signInModel) async {
    try {
      final httpResponse = await _userApiService.signin(signInModel);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        // print(httpResponse.data);
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
  Future<DataState<String>> signup(SignUpModel signUpModel) async {
    try {
      final httpResponse = await _userApiService.signup(signUpModel);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (error) {
      return DataFailed(error);
    }
  }
}
