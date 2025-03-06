import 'package:flutter/material.dart';

class AppTitlenameWidget extends StatelessWidget {
  const AppTitlenameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
                child: Text(
                  'Scolar Chat',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal[700],
                    fontFamily: "Pacifico",
                  ),
                ),
              );
  }
}