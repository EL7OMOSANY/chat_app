import 'package:flutter/material.dart';

class CustomSnackBarModel extends StatelessWidget {
  const CustomSnackBarModel({super.key, required this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.teal,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(child: Text(message)),
    );
  }
}
