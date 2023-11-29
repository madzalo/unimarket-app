import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:unimarket_app/features/auth/data/datasources/remote/user_api_service.dart';
import 'package:unimarket_app/features/auth/data/repository/user_repository_impl.dart';
import 'package:unimarket_app/features/auth/domain/repository/user_repository.dart';
import 'package:unimarket_app/features/auth/domain/usecases/signin_usecase.dart';
import 'package:unimarket_app/features/auth/domain/usecases/signup_usecase.dart';
import 'package:unimarket_app/features/auth/presentation/bloc/remote/auth_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio
  sl.registerSingleton<Dio>(Dio());

// API
  sl.registerSingleton<UserApiService>(UserApiService(sl()));

//Repo
  sl.registerSingleton<UserRepository>(UserRepositoryImpl(sl()));

//use cases
  sl.registerSingleton<SignUpUseCase>(SignUpUseCase(sl()));

  // sl.registerSingleton<SignInUseCase>(SignInUseCase(sl()));

  sl.registerFactory<SignInUseCase>(() => SignInUseCase(sl()));
//Blocs

  sl.registerFactory<AuthBloc>(() => AuthBloc(sl(), sl()));
}
