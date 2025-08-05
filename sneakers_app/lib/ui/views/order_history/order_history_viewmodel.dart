import 'package:stacked/stacked.dart';
import '../../../app/app.locator.dart';
import '../../../models/order_model.dart';
import '../../../services/auth_service.dart';
import '../../../services/database_service.dart';

class OrderHistoryViewModel extends BaseViewModel {
  final _databaseService = locator<DatabaseService>();
  final _authService = locator<AuthService>();
  List<OrderModel> _orders = [];

  List<OrderModel> get orders => _orders;

  OrderHistoryViewModel() {
    _loadOrders();
  }

  Future<void> _loadOrders() async {
    final userId = _authService.currentUser?.id;
    if (userId != null) {
      _orders = await _databaseService.getOrders(userId);
      notifyListeners();
    }
  }
}