import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecommerce_app/app/app.dart';
import 'package:ecommerce_app/domain/domain.dart';

import '../../../domain/models/product.dart';
import 'home_state.dart';

class HomeBloc extends Cubit<HomeState> {
  HomeBloc({required this.productRepository}) : super(const HomeState()) {
    _handleInitialFetch();
  }

  final ProductRepository productRepository;

  Future<void> getProducts() async {
    emit(state.copyWith(status: HomeStatus.loading));

    try {
      final products = await productRepository.getProducts(
        limit: paginationLimit,
        offset: state.offset,
      );

      final newOffset = state.offset + paginationLimit;
      final hasMore = products.length == paginationLimit;

      emit(state.copyWith(
        status: HomeStatus.success,
        products: products,
        hasMore: hasMore,
        offset: newOffset,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: HomeStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> loadMore() async {
    if (_shouldStopLoadingMore) return;

    emit(state.copyWith(isLoadingMore: true));

    try {
      final moreProducts = await productRepository.getProducts(
        limit: paginationLimit,
        offset: state.offset,
      );

      _handleLoadMoreResult(moreProducts);
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    } finally {
      emit(state.copyWith(isLoadingMore: false));
    }
  }

  bool get _shouldStopLoadingMore => state.isLoadingMore || !state.hasMore || state.status == HomeStatus.loading;

  void _handleLoadMoreResult(List<Product> moreProducts) {
    if (moreProducts.isEmpty) {
      emit(state.copyWith(hasMore: false));
      return;
    }

    final updated = List<Product>.from(state.products)..addAll(moreProducts);
    final newOffset = state.offset + paginationLimit;
    final hasMore = moreProducts.length == paginationLimit;

    emit(state.copyWith(
      products: updated,
      offset: newOffset,
      hasMore: hasMore,
    ));
  }

  void _handleInitialFetch() => getProducts();
}
