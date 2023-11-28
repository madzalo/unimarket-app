import 'package:unimarket_app/core/resources/data_state.dart';
import 'package:unimarket_app/features/auth/data/models/signin_model.dart';
import 'package:unimarket_app/features/auth/data/models/signup_model.dart';

abstract class UserRepository {
  Future<DataState<String>> signup(SignUpModel signUpModel);

  Future<DataState<String>> signin(SignInModel signInModel);
}
