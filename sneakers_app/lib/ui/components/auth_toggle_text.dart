import 'package:flutter/material.dart';

class AuthToggleText extends StatelessWidget {
  final String msg;
  final String title;
  final void Function() onPressed;
  const AuthToggleText(
      {super.key,
        required this.msg,
        required this.title,
        required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          msg,
          style: TextStyle(color: Theme.of(context).colorScheme.tertiary),
        ),
        TextButton(
            onPressed: onPressed,
            child: Text(
              title,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.tertiary,
                  fontWeight: FontWeight.bold),
            )),
      ],
    );
  }
}

