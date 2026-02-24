import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecommerce_app/domain/domain.dart';
import 'package:ecommerce_app/widgets/widgets.dart';
import '../bloc/wishlist_bloc.dart';
import '../bloc/wishlist_state.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Wishlist'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          if (state.status == WishlistStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.status == WishlistStatus.failure) {
            return Center(child: Text(state.errorMessage));
          }

          if (state.products.isEmpty) {
            return const _EmptyWishlistView();
          }

          return const _WishlistItemsList();
        },
      ),
    );
  }
}

class _WishlistItemsList extends StatelessWidget {
  const _WishlistItemsList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishlistBloc, WishlistState>(
      builder: (context, state) {
        return ListView.separated(
          padding: const EdgeInsets.all(20),
          itemCount: state.products.length,
          separatorBuilder: (_, __) => const SizedBox(height: 16),
          itemBuilder: (context, index) => _WishlistItemCard(
            product: state.products[index],
          ),
        );
      },
    );
  }
}

class _WishlistItemCard extends StatelessWidget {
  const _WishlistItemCard({required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            _ItemImage(imageUrl: product.image),
            const SizedBox(width: 16),
            Expanded(child: _ItemInfo(product: product)),
            _RemoveFromWishlistButton(productId: product.id),
          ],
        ),
      ),
    );
  }
}

class _ItemImage extends StatelessWidget {
  const _ItemImage({required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      width: 80,
      height: 80,
      fit: BoxFit.contain,
    );
  }
}

class _ItemInfo extends StatelessWidget {
  const _ItemInfo({required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.category.toUpperCase(),
          style: theme.textTheme.labelSmall?.copyWith(
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          product.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          '\$${product.price}',
          style: theme.textTheme.titleMedium?.copyWith(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class _RemoveFromWishlistButton extends StatelessWidget {
  const _RemoveFromWishlistButton({required this.productId});

  final int productId;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.favorite, color: Colors.red),
      onPressed: () => _handleRemove(context),
    );
  }

  void _handleRemove(BuildContext context) =>
      context.read<WishlistBloc>().toggleWishlist(productId);
}

class _EmptyWishlistView extends StatelessWidget {
  const _EmptyWishlistView();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.favorite_border,
            size: 64,
            color: Colors.black.withValues(alpha: 0.1),
          ),
          const SizedBox(height: 16),
          Text(
            'Your wishlist is empty',
            style: theme.textTheme.titleMedium?.copyWith(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
