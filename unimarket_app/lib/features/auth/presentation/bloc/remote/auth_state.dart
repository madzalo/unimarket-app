import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  final String? token;
  final DioException? error;

  const AuthState({this.token, this.error});

  @override
  List<Object> get props => [token!, error!];
}

class InitialState extends AuthState {
  const InitialState({String? token, DioException? error})
      : super(token: null, error: null);
}

class SignInLoading extends AuthState {
  const SignInLoading();
}

class SignInLoadingDone extends AuthState {
  const SignInLoadingDone({String? token}) : super(token: token);
}

class SignInLoadingError extends AuthState {
  const SignInLoadingError({DioException? error}) : super(error: error);
}
