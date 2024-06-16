import 'package:flutter/material.dart';

class CustomDrawerButton extends StatelessWidget {
  const CustomDrawerButton(
      {super.key, required this.onPressed, required this.name});

  final VoidCallback onPressed;
  final String name;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: Text(
        name,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
