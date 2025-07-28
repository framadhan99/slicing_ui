import 'package:flutter/material.dart';
import 'package:slicing_ui/app/config/asset_styles.dart';

import '../../app/models/produk.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final bool? isSelected;
  const ProductCard({super.key, required this.product, this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Product Image with Favorite Icon
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: AspectRatio(
                aspectRatio: 3 / 4,
                child: Image.asset(product.imageUrl, fit: BoxFit.cover),
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.black.withAlpha(90),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        // Title
        Text(product.title, style: AssetStyles.textBodyLarge),
        const SizedBox(height: 2),
        // Category
        Text(product.category, style: AssetStyles.textRegular),
        const SizedBox(height: 12),
        // Price & Rating
        Row(
          children: [
            Text(
              '\$${product.price.toStringAsFixed(2)}',
              style: AssetStyles.textBodyLarge,
            ),
            const SizedBox(width: 16),
            const Icon(Icons.star, size: 16, color: Colors.amber),
            Text(
              product.rating.toStringAsFixed(1),
              style: const TextStyle(fontSize: 13),
            ),
          ],
        ),
      ],
    );
  }
}
