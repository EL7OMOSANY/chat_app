import 'package:chat_app/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';

class CustomCheckacountRow extends StatelessWidget {
  const CustomCheckacountRow({
    super.key,
    required this.question,
    required this.option,
  });
  final String question;
  final String option;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(question),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignUpScreen()),
            );
          },
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
