import 'package:sneakers_app/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.dialogs.dart';
import '../../../app/app.locator.dart';
import '../../../models/shoe_model.dart';
import '../../../services/auth_service.dart';
import '../../../services/cart_service.dart';

class ShopViewModel extends BaseViewModel {
  final CartService _cartService = locator<CartService>();
  final _navService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
  final _authService = locator<AuthService>();

  final List<ShoeModel> shoeList = [
    ShoeModel(
      name: "Sneakers 1",
      price: "1500",
      description:
          "The Description of shoe.Its quality, size, color, and many more.",
      imagePath: "assets/images/one.png",
    ),
    ShoeModel(
      name: "Sneakers 2",
      price: "1800",
      description:
          "The Description of shoe.Its quality, size, color, and many more.",
      imagePath: "assets/images/two.png",
    ),
    ShoeModel(
      name: "Sneakers 3",
      price: "2200",
      description:
          "The Description of shoe.Its quality, size, color, and many more.",
      imagePath: "assets/images/one.png",
    ),
    ShoeModel(
      name: "Sneakers 4",
      price: "3000",
      description:
          "The Description of shoe.Its quality, size, color, and many more.",
      imagePath: "assets/images/two.png",
    ),
    ShoeModel(
      name: "Sneakers 5",
      price: "3500",
      description:
          "The Description of shoe.Its quality, size, color, and many more.",
      imagePath: "assets/images/one.png",
    ),
    ShoeModel(
      name: "Sneakers 6",
      price: "3500",
      description:
          "The Description of shoe.Its quality, size, color, and many more.",
      imagePath: "assets/images/two.png",
    ),
  ];

  void addToCart(ShoeModel shoe) async {
    final userId = _authService.currentUser?.id;
    if (userId == null) {
      _dialogService.showDialog(
        title: 'Error',
        description: 'Please log in to add items to cart',
      );
      return;
    }
    await _cartService.addItem(userId, shoe);
    notifyListeners();
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Item Added',
      description: '${shoe.name} added to cart successfully!',
      mainButtonTitle: 'OK',
    );
  }

  void seeAllView() {
    _navService.navigateToSeeAllView();
  }
}
