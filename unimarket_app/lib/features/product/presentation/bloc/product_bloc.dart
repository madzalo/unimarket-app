import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unimarket_app/core/resources/data_state.dart';
import 'package:unimarket_app/features/product/domain/usecases/get_products_usecase.dart';
import 'package:unimarket_app/features/product/domain/usecases/sell_product_usecase.dart';
import 'package:unimarket_app/features/product/presentation/bloc/product_event.dart';
import 'package:unimarket_app/features/product/presentation/bloc/product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProductsUseCase _getGetProductsUseCase;
  final SellProductUseCase _sellSellProductUseCase;

  ProductBloc(this._getGetProductsUseCase, this._sellSellProductUseCase)
      : super(const ProductsLoading()) {
    on<GetProducts>(onGetProducts);
    on<SellProduct>(onSellProduct);
  }

  void onSellProduct(
      SellProduct sellProduct, Emitter<ProductState> emit) async {
    print("Sell Product event triggered");
    await _sellSellProductUseCase(params: sellProduct.sellProductModel);

    final dataState = await _getGetProductsUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(ProductsLoadingDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(ProductsLoadingDoneError(error: dataState.error!));
    }
  }

  void onGetProducts(GetProducts event, Emitter<ProductState> emit) async {
    print("Get Product event triggered");
    final dataState = await _getGetProductsUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(ProductsLoadingDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(ProductsLoadingDoneError(error: dataState.error!));
    }
  }
}
