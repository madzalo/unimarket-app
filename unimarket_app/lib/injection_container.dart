import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:unimarket_app/features/auth/data/datasources/remote/user_api_service.dart';
import 'package:unimarket_app/features/auth/data/repository/user_repository_impl.dart';
import 'package:unimarket_app/features/auth/domain/repository/user_repository.dart';
import 'package:unimarket_app/features/auth/domain/usecases/signin_usecase.dart';
import 'package:unimarket_app/features/auth/domain/usecases/signup_usecase.dart';
import 'package:unimarket_app/features/auth/presentation/bloc/remote/auth_bloc.dart';
import 'package:unimarket_app/features/cart/data/datasources/remote/cart_api_service.dart';
import 'package:unimarket_app/features/cart/data/repository/cart_repository_impl.dart';
import 'package:unimarket_app/features/cart/domain/repository/cart_repository.dart';
import 'package:unimarket_app/features/cart/domain/usecases/get_cart_items_usecase.dart';
import 'package:unimarket_app/features/cart/presentation/bloc/remote_cart_bloc.dart';
import 'package:unimarket_app/features/product/data/datasources/local/app_database.dart';
import 'package:unimarket_app/features/product/data/datasources/remote/product_api_service.dart';
import 'package:unimarket_app/features/product/data/repository/product_repository_impl.dart';
import 'package:unimarket_app/features/product/domain/repository/product_repository.dart';
import 'package:unimarket_app/features/product/domain/usecases/get_products_usecase.dart';
import 'package:unimarket_app/features/product/domain/usecases/get_saved_product.dart';
import 'package:unimarket_app/features/product/domain/usecases/save_product.dart';
import 'package:unimarket_app/features/product/domain/usecases/sell_product_usecase.dart';
import 'package:unimarket_app/features/product/presentation/bloc/product_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Database
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  sl.registerSingleton<AppDatabase>(database);

  // Dio
  sl.registerSingleton<Dio>(Dio());

  //API
  sl.registerSingleton<UserApiService>(UserApiService(sl()));
  sl.registerSingleton<ProductApiService>(ProductApiService(sl()));
  sl.registerSingleton<CartApiService>(CartApiService(sl()));

  //Repo
  sl.registerSingleton<UserRepository>(UserRepositoryImpl(sl()));
  sl.registerSingleton<ProductRepository>(ProductRepositoryImpl(sl(), sl()));
  sl.registerSingleton<CartRepository>(CartRepositoryImpl(sl()));

  //use cases
  sl.registerSingleton<SignInUseCase>(SignInUseCase(sl()));
  sl.registerSingleton<SignUpUseCase>(SignUpUseCase(sl()));
  sl.registerSingleton<GetProductsUseCase>(GetProductsUseCase(sl()));
  sl.registerSingleton<SellProductUseCase>(SellProductUseCase(sl()));
  sl.registerSingleton<GetCartItemsUseCase>(GetCartItemsUseCase(sl()));
  sl.registerSingleton<GetSavedProductsUseCase>(GetSavedProductsUseCase(sl()));
  sl.registerSingleton<SaveProductUseCase>(SaveProductUseCase(sl()));

  //Blocs
  sl.registerFactory<AuthBloc>(() => AuthBloc(sl(), sl()));
  sl.registerFactory<ProductBloc>(() => ProductBloc(sl(), sl()));
  sl.registerFactory<RemoteCartBloc>(() => RemoteCartBloc(sl()));
}
