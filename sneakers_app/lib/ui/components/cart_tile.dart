import 'package:flutter/material.dart';

import '../../models/shoe_model.dart';

class CartTile extends StatelessWidget {
  final ShoeModel shoe;
  final int quantity;
  final VoidCallback onDelete;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const CartTile({
    super.key,
    required this.shoe,
    required this.quantity,
    required this.onDelete,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 3,
      child: ListTile(
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        leading: Image.asset(shoe.imagePath, width: 50, height: 50),
        title: Text(shoe.name),
        subtitle: Text("PKR ${shoe.price}"),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            quantity > 1
                ? IconButton(
              icon: const Icon(Icons.remove_circle_outline),
              onPressed: onDecrement,
            )
                : IconButton(
              icon: const Icon(Icons.delete),
              onPressed: onDelete,
            ),
            Text('$quantity', style: const TextStyle(fontSize: 16)),
            IconButton(
              icon: const Icon(Icons.add_circle_outline),
              onPressed: onIncrement,
            ),
          ],
        ),
      ),
    );
  }
}

