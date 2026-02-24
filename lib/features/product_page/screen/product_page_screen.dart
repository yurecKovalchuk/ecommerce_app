import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecommerce_app/domain/domain.dart';
import '../bloc/product_page_bloc.dart';
import '../bloc/product_page_state.dart';

class ProductPageScreen extends StatelessWidget {
  const ProductPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
      ),
      body: BlocBuilder<ProductPageBloc, ProductPageState>(
        builder: (context, state) {
          if (state.status == ProductPageStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.status == ProductPageStatus.failure) {
            return Center(child: Text(state.errorMessage));
          }

          final product = state.product;
          if (product == null) return const SizedBox.shrink();

          return _ProductDetails(product: product);
        },
      ),
    );
  }
}

class _ProductDetails extends StatelessWidget {
  const _ProductDetails({required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ProductImage(imageUrl: product.image),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ProductHeader(
                  title: product.title,
                  category: product.category,
                ),
                const SizedBox(height: 16),
                _ProductPrice(price: product.price),
                const SizedBox(height: 24),
                _ProductDescription(description: product.description),
                const SizedBox(height: 40),
                const _AddToCartButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductImage extends StatelessWidget {
  const _ProductImage({required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.network(
        imageUrl,
        height: 300,
        fit: BoxFit.contain,
      ),
    );
  }
}

class _ProductHeader extends StatelessWidget {
  const _ProductHeader({
    required this.title,
    required this.category,
  });

  final String title;
  final String category;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          category.toUpperCase(),
          style: theme.textTheme.labelLarge?.copyWith(
            color: Colors.grey,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class _ProductPrice extends StatelessWidget {
  const _ProductPrice({required this.price});

  final double price;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      '\$$price',
      style: theme.textTheme.headlineMedium?.copyWith(
        color: Colors.blue,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class _ProductDescription extends StatelessWidget {
  const _ProductDescription({required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: theme.textTheme.bodyLarge?.copyWith(
            color: Colors.black.withValues(alpha: 0.6),
            height: 1.5,
          ),
        ),
      ],
    );
  }
}

class _AddToCartButton extends StatelessWidget {
  const _AddToCartButton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: () => _handleAddToCart(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text('Add to Cart'),
      ),
    );
  }

  void _handleAddToCart(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Added to cart')),
    );
  }
}