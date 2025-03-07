import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomPasswordTextfield extends StatefulWidget {
   CustomPasswordTextfield({  this.onChanged, super.key});
  Function(String)? onChanged;

  @override
  State<CustomPasswordTextfield> createState() =>
      _CustomPasswordTextfieldState();
}

class _CustomPasswordTextfieldState extends State<CustomPasswordTextfield> {
  IconData icon = Icons.visibility_off;

  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: widget.onChanged,
      keyboardType: TextInputType.visiblePassword,
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock, color: Colors.grey),
        suffixIcon: IconButton(
          icon: Icon(icon),
          color: Colors.grey,
          onPressed: () {
            setState(() {
              if (icon == Icons.visibility_off) {
                icon = Icons.visibility;
                obscureText = false;
              } else {
                icon = Icons.visibility_off;
                obscureText = true;
              }
            });
          },
        ),
        hintText: "Password",
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
