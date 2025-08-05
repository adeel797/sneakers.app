import 'package:flutter/material.dart';

class MyBottomNav extends StatelessWidget {
  final Function(int) onTabChange;
  final int selectedIndex;

  const MyBottomNav({super.key, required this.onTabChange, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      showSelectedLabels: true,
      selectedItemColor: Theme.of(context).colorScheme.tertiary,
      selectedLabelStyle:
      TextStyle(color: Theme.of(context).colorScheme.tertiary),
      unselectedItemColor: Theme.of(context).colorScheme.secondary,
      unselectedLabelStyle:
      TextStyle(color: Theme.of(context).colorScheme.secondary),
      currentIndex: selectedIndex,
      onTap: onTabChange,
      showUnselectedLabels: true,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag_rounded),
          label: 'Shop',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: 'Orders',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
    );
  }
}
