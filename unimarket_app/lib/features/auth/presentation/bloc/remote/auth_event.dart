import 'package:unimarket_app/features/auth/data/models/signin_model.dart';

abstract class AuthEvent {
  final SignInModel? signInModel;
  const AuthEvent({this.signInModel});
}

class SignIn extends AuthEvent {
  SignIn(SignInModel signInModel) : super(signInModel: signInModel);
}

class SignUp extends AuthEvent {}
