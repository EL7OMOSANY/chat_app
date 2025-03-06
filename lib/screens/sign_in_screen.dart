import 'package:chat_app/models/custom_checkAcount_row.dart';
import 'package:chat_app/models/custom_elevated_page_button.dart';
import 'package:chat_app/models/custom_password_textField.dart';
import 'package:chat_app/models/custom_textField.dart';
import 'package:chat_app/widgets/app_image_widget.dart';
import 'package:chat_app/widgets/app_titleName_widget.dart';
import 'package:chat_app/models/head_title_of_textFields.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});
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
              SizedBox(height: 120),
              AppImageWidget(),
              const SizedBox(height: 10),
              AppTitlenameWidget(),
              const SizedBox(height: 50),
              HeadTitleOfTextfields(title: " Sign In"),
              const SizedBox(height: 25),
              CustomTextfield(
                hintText: "Email",
                icon: Icons.email,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 10),
              CustomPasswordTextfield(),
              const SizedBox(height: 10),
              const Divider(thickness: 1, color: Colors.grey),
              const SizedBox(height: 10),
              CustomElevatedPageButton(title: "Sign in"),
              const SizedBox(height: 10),
              CustomCheckacountRow(
                question: "Don't have an account?",
                option: "Sign up now",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
