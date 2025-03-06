import 'package:chat_app/models/custom_checkAcount_row.dart';
import 'package:chat_app/models/custom_elevated_page_button.dart';
import 'package:chat_app/models/custom_password_textField.dart';
import 'package:chat_app/models/custom_textField.dart';
import 'package:chat_app/models/head_title_of_textFields.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCDE7E0),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 120),
              HeadTitleOfTextfields(title: " Sign Up"),
              const SizedBox(height: 25),
              CustomTextfield(
                hintText: "Name",
                icon: Icons.person,
                keyboardType: TextInputType.name,
              ),
              const SizedBox(height: 30),
              CustomTextfield(
                hintText: "Number",
                icon: Icons.phone,
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 30),
              CustomTextfield(
                hintText: "Email",
                icon: Icons.email,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 30),
              CustomPasswordTextfield(),
              const SizedBox(height: 30),
              CustomElevatedPageButton(title: "Sign Up"),
              const SizedBox(height: 10),
              CustomCheckacountRow(
                question: "Already have an account?",
                option: "Sign In now",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
