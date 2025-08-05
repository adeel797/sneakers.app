import 'cart_item.dart';

class OrderModel {
  final int id;
  final int userId;
  final List<CartItem> items;
  final double totalPrice;
  final DateTime orderDate;
  final int displayOrderNumber;

  OrderModel({
    required this.id,
    required this.userId,
    required this.items,
    required this.totalPrice,
    required this.orderDate,
    this.displayOrderNumber = 1, // Default to 1 to prevent null
  });

  factory OrderModel.fromMap(Map<String, dynamic> map, List<CartItem> items, [int? displayOrderNumber]) {
    return OrderModel(
      id: map['id'] as int,
      userId: map['userId'] as int,
      items: items,
      totalPrice: map['totalPrice'] as double,
      orderDate: DateTime.parse(map['orderDate'] as String),
      displayOrderNumber: displayOrderNumber ?? 1, // Fallback to 1 if null
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'totalPrice': totalPrice,
      'orderDate': orderDate.toIso8601String(),
    };
  }
}