import 'package:flutter/material.dart';

class AppImageWidget extends StatelessWidget {
  const AppImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircleAvatar(
        backgroundColor: Colors.teal[700],
        radius: 85,
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 80,
          child: Icon(Icons.school, size: 80, color: Colors.teal[700]),
        ),
      ),
    );
  }
}
