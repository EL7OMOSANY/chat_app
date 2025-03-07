import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomElevatedPageButton extends StatelessWidget {
  CustomElevatedPageButton({this.onPressed, super.key, required this.title});
  final String title;
  VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.teal,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        minimumSize: const Size(double.infinity, 50),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontFamily: "Pacifico",
        ),
      ),
    );
  }
}
