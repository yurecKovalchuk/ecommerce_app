import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecommerce_app/domain/domain.dart';
import 'cart_state.dart';

class CartBloc extends Cubit<CartState> {
  CartBloc({required this.localStorageRepository}) : super(const CartState()) {
    _handleInitialLoad();
  }

  final LocalStorageRepository localStorageRepository;

  Future<void> loadCart() async {
    emit(state.copyWith(status: CartStatus.loading));
    try {
      // Logic for fetching items from local storage or API
      emit(state.copyWith(status: CartStatus.success));
    } catch (e) {
      emit(state.copyWith(
        status: CartStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> removeItem(int productId) async {
    final updatedItems = List<Product>.from(state.items)
      ..removeWhere((item) => item.id == productId);

    emit(state.copyWith(items: updatedItems));
  }

  void _handleInitialLoad() => loadCart();
}
