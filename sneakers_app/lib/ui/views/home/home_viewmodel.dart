import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../cart/cart_view.dart';
import '../order_history/order_history_view.dart';
import '../shop/shop_view.dart';
import '../settings/settings_view.dart';

class HomeViewModel extends BaseViewModel {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  final List<Widget> _screens = [
    const ShopView(),
    const CartView(),
    const OrderHistoryView(),
    const SettingsView(),
  ];

  List<Widget> get screens {
    print('Screens length: ${_screens.length}');
    return _screens;
  }

  void navigateBottomBar(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  String getTitle() {
    switch (_selectedIndex) {
      case 0:
        return 'Shop';
      case 1:
        return 'Cart';
      case 2:
        return 'Order History';
      case 3:
        return 'Settings';
      default:
        return 'Home';
    }
  }
}
