// ignore: file_names
import 'package:flutter/material.dart';

class CustomCheckacountRow extends StatelessWidget {
  const CustomCheckacountRow({
    super.key,
    required this.question,
    required this.option,
    required this.onpressed,
  });
  final String question;
  final String option;
  final Function() onpressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(question),
        TextButton(
          onPressed: onpressed,
          child: Text(
            option,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.teal,
              fontFamily: "Pacifico",
            ),
          ),
        ),
      ],
    );
  }
}
