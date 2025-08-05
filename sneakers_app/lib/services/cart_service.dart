import '../../app/app.locator.dart';
import '../models/cart_item.dart';
import '../models/shoe_model.dart';
import 'database_service.dart';

class CartService {
  final _databaseService = locator<DatabaseService>();

  Future<void> addItem(int userId, ShoeModel shoe) async {
    await _databaseService.addToCart(userId, shoe);
  }

  Future<void> removeItem(int userId, ShoeModel shoe) async {
    await _databaseService.removeFromCart(userId, shoe);
  }

  Future<void> decrementItem(int userId, ShoeModel shoe) async {
    await _databaseService.decrementCartItem(userId, shoe);
  }

  Future<List<CartItem>> getCartItems(int userId) async {
    return await _databaseService.getCartItems(userId);
  }

  Future<void> checkout(int userId) async {
    final cartItems = await getCartItems(userId);
    if (cartItems.isNotEmpty) {
      await _databaseService.saveOrder(userId, cartItems);
      await _databaseService.clearCart(userId);
    }
  }
}