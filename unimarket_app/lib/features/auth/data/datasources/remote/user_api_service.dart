import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:unimarket_app/config/constants/constants.dart';
import 'package:unimarket_app/features/auth/data/models/signin_model.dart';
import 'package:unimarket_app/features/auth/data/models/signup_model.dart';

part 'user_api_service.g.dart';

@RestApi(baseUrl: BaseUrl)
abstract class UserApiService {
  factory UserApiService(Dio dio) = _UserApiService;

  @POST("/auth/register")
  Future<HttpResponse<String>> signup(@Body() SignUpModel signUpModel);

  @POST("/auth/login")
  Future<HttpResponse<String>> signin(@Body() SignInModel signInModel);
}
