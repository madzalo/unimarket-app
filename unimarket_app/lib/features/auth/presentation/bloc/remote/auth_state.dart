import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  final String? token;
  final DioException? error;
  final String? response;

  const AuthState({this.token, this.error, this.response});

  @override
  List<Object> get props => [token!, error!, response!];
}

class InitialState extends AuthState {
  const InitialState({String? token, DioException? error, String? response})
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

class SignUpLoading extends AuthState {
  const SignUpLoading();
}

class SignUpLoadingDone extends AuthState {
  const SignUpLoadingDone({String? response}) : super(response: response);
}

class SignUpLoadingError extends AuthState {
  const SignUpLoadingError({DioException? error}) : super(error: error);
}
