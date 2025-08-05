import 'package:flutter/material.dart';

import '../../models/shoe_model.dart';

class OrderTile extends StatelessWidget {
  final ShoeModel shoe;
  final int quantity;

  const OrderTile({
    super.key,
    required this.shoe,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      leading: Image.asset(shoe.imagePath, width: 50, height: 50),
      title: Text(shoe.name),
      subtitle: Text("PKR ${shoe.price}"),
      trailing: Text('$quantity', style: const TextStyle(fontSize: 16)),
    );
  }
}

