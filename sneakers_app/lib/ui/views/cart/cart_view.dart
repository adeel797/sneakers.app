import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../common/ui_helpers.dart';
import '../../components/cart_tile.dart';
import 'cart_viewmodel.dart';

class CartView extends StackedView<CartViewModel> {
  const CartView({super.key});

  @override
  Widget builder(
      BuildContext context,
      CartViewModel viewModel,
      Widget? child,
      ) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Expanded(
            child: viewModel.cartItems.isEmpty
                ? const Center(child: Text("Cart is empty."))
                : ListView.builder(
              itemCount: viewModel.cartItems.length,
              itemBuilder: (context, index) {
                final cartItem = viewModel.cartItems[index];
                return TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0, end: 1),
                  duration: const Duration(milliseconds: 300),
                  builder: (context, value, child) {
                    return Opacity(
                      opacity: value,
                      child: Transform.translate(
                        offset: Offset(50 * (1 - value), 0),
                        child: child,
                      ),
                    );
                  },
                  child: CartTile(
                    shoe: cartItem.shoe,
                    quantity: cartItem.quantity,
                    onDelete: () => viewModel.removeFromCart(cartItem.shoe),
                    onIncrement: () => viewModel.addToCart(cartItem.shoe),
                    onDecrement: () => viewModel.decrementQuantity(cartItem.shoe),
                  ),
                );
              },
            ),
          ),
          if (viewModel.cartItems.isNotEmpty)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Total",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                      Text(
                        "PKR ${viewModel.getTotalPrice().toStringAsFixed(0)}",
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: () => viewModel.checkout(context),
                    icon: const Icon(Icons.shopping_cart_checkout),
                    label: const Text("Checkout"),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ],
              ),
            ),
          verticalSpaceSmall,
        ],
      ),
    );
  }

  @override
  CartViewModel viewModelBuilder(BuildContext context) => CartViewModel();
}