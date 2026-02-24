import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecommerce_app/domain/domain.dart';
import 'product_page_state.dart';

class ProductPageBloc extends Cubit<ProductPageState> {
  ProductPageBloc({
    required this.productRepository,
    required int productId,
  }) : super(const ProductPageState()) {
    _handleInitialLoad(productId);
  }

  final ProductRepository productRepository;

  Future<void> getProduct(int id) async {
    emit(state.copyWith(status: ProductPageStatus.loading));

    try {
      final product = await productRepository.getProductById(id);

      emit(state.copyWith(
        status: ProductPageStatus.success,
        product: product,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: ProductPageStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  void _handleInitialLoad(int id) => getProduct(id);
}
