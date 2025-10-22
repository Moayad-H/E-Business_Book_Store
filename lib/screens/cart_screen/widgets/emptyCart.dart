import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

Widget buildEmptyState(ThemeData theme) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Iconsax.shopping_bag, size: 80, color: Colors.grey),
          const SizedBox(height: 20),
          Text(
            'Your cart is empty',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Add items to your cart to see them here.',
            style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  );
}
