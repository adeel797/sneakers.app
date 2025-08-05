import 'package:flutter/material.dart';

import '../common/ui_helpers.dart';

class MyButton extends StatelessWidget {
  final String title;
  final Function()? onTap;
  final IconData icon;

  const MyButton({
    super.key,
    required this.onTap,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).colorScheme.tertiary,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [

            Icon(icon, color: Theme.of(context).colorScheme.scrim),
            horizontalSpaceTiny,
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).colorScheme.scrim,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),

          ],
        ),
      ),
    );
  }
}

