// ignore: file_names
import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({super.key, required this.hintText, required this.icon, required this.keyboardType});
  final String hintText;
  final IconData icon;
  final TextInputType keyboardType;
  
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.grey),

        hintText:hintText,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 16,
          fontFamily: "Pacifico",
        ),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: Colors.blueGrey, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: Colors.teal, width: 4),
        ),
      ),
    );
  }
}
