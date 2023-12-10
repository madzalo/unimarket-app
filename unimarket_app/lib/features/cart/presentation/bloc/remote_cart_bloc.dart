import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unimarket_app/core/resources/data_state.dart';
import 'package:unimarket_app/features/cart/domain/usecases/get_cart_items_usecase.dart';
import 'package:unimarket_app/features/cart/presentation/bloc/remote_cart_event.dart';
import 'package:unimarket_app/features/cart/presentation/bloc/remote_cart_state.dart';

class RemoteCartBloc extends Bloc<RemoteCartEvent, RemoteCartState> {
  final GetCartItemsUseCase _getCartItemsUseCase;

  RemoteCartBloc(this._getCartItemsUseCase) : super(const RemoteCartLoading()) {
    on<GetCart>(onGetCart);
  }

  void onGetCart(GetCart event, Emitter<RemoteCartState> emit) async {
    print("get Cart Event");
    final dataState = await _getCartItemsUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteCartDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(RemoteCartError(dataState.error!));
    }
  }
}
