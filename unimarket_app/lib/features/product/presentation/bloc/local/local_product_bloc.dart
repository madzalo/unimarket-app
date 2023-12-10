import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unimarket_app/features/product/domain/usecases/get_saved_product.dart';
import 'package:unimarket_app/features/product/domain/usecases/save_product.dart';
import 'package:unimarket_app/features/product/presentation/bloc/local/local_product_event.dart';
import 'package:unimarket_app/features/product/presentation/bloc/local/local_product_state.dart';

class LocalProductBloc extends Bloc<LocalProductsEvent, LocalProductsState> {
  final GetSavedProductsUseCase _getSavedProductUseCase;
  final SaveProductUseCase _saveProductUseCase;

  LocalProductBloc(this._getSavedProductUseCase, this._saveProductUseCase)
      : super(const LocalProductsLoading()) {
    on<GetSavedProducts>(onGetSavedProducts);
    on<SaveProduct>(onSaveProduct);
  }

  void onGetSavedProducts(
      GetSavedProducts event, Emitter<LocalProductsState> emit) async {
    print("Getting saved Products");

    final products = await _getSavedProductUseCase();
    emit(LocalProductsDone(products));
  }

  void onSaveProduct(
      SaveProduct saveProduct, Emitter<LocalProductsState> emit) async {
    print("Saving Product");
    await _saveProductUseCase(params: saveProduct.product);
    final products = await _getSavedProductUseCase();
    emit(LocalProductsDone(products));
  }
}
