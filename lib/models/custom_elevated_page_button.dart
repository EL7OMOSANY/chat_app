import 'package:flutter/material.dart';

class CustomElevatedPageButton extends StatelessWidget {
  const CustomElevatedPageButton({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
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