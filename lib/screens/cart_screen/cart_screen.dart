import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:sectionweek2/controllers/cartProvider.dart';
import 'package:sectionweek2/screens/cart_screen/widgets/emptyCart.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Consumer<CartProvider>(
      builder: (context, cartProvider, child) => SizedBox(
        height: MediaQuery.of(context).size.height * 0.9,
        width: MediaQuery.of(context).size.width * 0.9,
        child: Column(
          children: [
            Text(
              'My Cart',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            cartProvider.cartItems.isEmpty
                ? buildEmptyState(theme)
                : _buildCartList(theme),
            cartProvider.cartItems.isEmpty
                ? const SizedBox.shrink()
                : Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surfaceVariant.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total: ${cartProvider.totalPrice.toStringAsFixed(2)} EGP',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Iconsax.card),
                          label: const Text('Checkout'),
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildCartList(ThemeData theme) {
    final cartProvider = context
        .watch<CartProvider>(); // 👈 listens for changes

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(16),
        itemCount: cartProvider.cartItems.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final item = cartProvider.cartItems[index];
          return Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceVariant.withOpacity(0.6),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(9),
                  child: Image.asset(
                    item.image,
                    width: 70,
                    height: 90,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${item.price} EGP',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Iconsax.minus),
                            onPressed: () {
                              cartProvider.decreaseQuantity(item);
                            },
                          ),
                          Text(
                            item.quantity.toString(),
                            style: theme.textTheme.bodyLarge,
                          ),
                          IconButton(
                            icon: const Icon(Iconsax.add),
                            onPressed: () {
                              cartProvider.increaseQuantity(item);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Iconsax.trash, color: Colors.redAccent),
                  onPressed: () {
                    cartProvider.removeFromCart(item);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
