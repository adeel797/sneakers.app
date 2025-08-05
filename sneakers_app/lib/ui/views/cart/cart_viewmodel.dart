import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../app/app.locator.dart';
import '../../../models/cart_item.dart';
import '../../../models/shoe_model.dart';
import '../../../services/auth_service.dart';
import '../../../services/cart_service.dart';

class CartViewModel extends BaseViewModel {
  final CartService _cartService = locator<CartService>();
  final AuthService _authService = locator<AuthService>();

  List<CartItem> _cartItems = [];
  List<CartItem> get cartItems => _cartItems;

  CartViewModel() {
    _loadCart();
  }

  Future<void> _loadCart() async {
    final userId = _authService.currentUser?.id;
    if (userId != null) {
      _cartItems = await _cartService.getCartItems(userId);
      notifyListeners();
    }
  }

  int getQuantity(ShoeModel shoe) {
    return _cartItems.firstWhere((item) => item.shoe == shoe, orElse: () => CartItem(shoe: shoe, quantity: 0)).quantity;
  }

  Future<void> addToCart(ShoeModel shoe) async {
    final userId = _authService.currentUser?.id;
    if (userId != null) {
      await _cartService.addItem(userId, shoe);
      await _loadCart();
    }
  }

  Future<void> removeFromCart(ShoeModel shoe) async {
    final userId = _authService.currentUser?.id;
    if (userId != null) {
      await _cartService.removeItem(userId, shoe);
      await _loadCart();
    }
  }

  Future<void> decrementQuantity(ShoeModel shoe) async {
    final userId = _authService.currentUser?.id;
    if (userId != null) {
      await _cartService.decrementItem(userId, shoe);
      await _loadCart();
    }
  }

  double getTotalPrice() {
    double total = 0;
    for (var item in _cartItems) {
      total += (double.tryParse(item.shoe.price) ?? 0) * item.quantity;
    }
    return total;
  }

  Future<void> checkout(BuildContext context) async {
    final userId = _authService.currentUser?.id;
    if (userId != null) {
      await _cartService.checkout(userId);
      await _loadCart();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Checkout successful!")),
      );
    }
  }
}