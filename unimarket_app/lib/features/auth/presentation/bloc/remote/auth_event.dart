import 'package:unimarket_app/features/auth/data/models/signin_model.dart';
import 'package:unimarket_app/features/auth/data/models/signup_model.dart';

abstract class AuthEvent {
  final SignInModel? signInModel;
  final SignUpModel? signUpModel;
  const AuthEvent({this.signInModel, this.signUpModel});
}

class SignIn extends AuthEvent {
  SignIn(SignInModel signInModel) : super(signInModel: signInModel);
}

class SignUp extends AuthEvent {
  SignUp(SignUpModel signUpModel) : super(signUpModel: signUpModel);
}
