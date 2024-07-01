import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final int currentIndex;
  final Function(int) onPressed;

  const CustomIconButton({
    super.key,
    required this.icon,
    required this.currentIndex,
    required this.onPressed,
  });


  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {},
        icon: Icon(icon),
    );
  }
}
