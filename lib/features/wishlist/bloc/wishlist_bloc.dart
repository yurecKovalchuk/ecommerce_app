import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecommerce_app/domain/domain.dart';
import 'wishlist_state.dart';

class WishlistBloc extends Cubit<WishlistState> {
  WishlistBloc({
    required this.localStorageRepository,
    required this.productRepository,
  }) : super(const WishlistState()) {
    _handleInitialLoad();
  }

  final LocalStorageRepository localStorageRepository;
  final ProductRepository productRepository;

  Future<void> loadWishlist() async {
    emit(state.copyWith(status: WishlistStatus.loading));
    try {
      final favoriteIds = await localStorageRepository.getFavoriteProductIds();
      final products = await _fetchFavoriteProducts(favoriteIds);

      emit(state.copyWith(
        status: WishlistStatus.success,
        products: products,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: WishlistStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> toggleWishlist(int productId) async {
    await localStorageRepository.toggleFavoriteProductId(productId);
    await loadWishlist();
  }

  Future<List<Product>> _fetchFavoriteProducts(List<int> ids) async {
    final products = <Product>[];
    for (final id in ids) {
      final product = await productRepository.getProductById(id);
      products.add(product);
    }
    return products;
  }

  void _handleInitialLoad() => loadWishlist();
}
