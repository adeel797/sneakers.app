import 'package:sneakers_app/models/shoe_model.dart';

class CartItem {
  final ShoeModel shoe;
  final int quantity;

  CartItem({required this.shoe, required this.quantity});

  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
      shoe: ShoeModel(
        name: map['name'],
        price: map['price'],
        description: map['description'],
        imagePath: map['imagePath'],
      ),
      quantity: map['quantity'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': shoe.name,
      'price': shoe.price,
      'description': shoe.description,
      'imagePath': shoe.imagePath,
      'quantity': quantity,
    };
  }
}
