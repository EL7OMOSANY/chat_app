import 'package:flutter/material.dart';

class BobupChat extends StatelessWidget {
  const BobupChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.teal,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Text("hello world"),
      ),
    );
  }
}
