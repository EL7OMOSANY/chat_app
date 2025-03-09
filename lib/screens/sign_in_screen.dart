import 'dart:developer';

import 'package:chat_app/models/custom_checkAcount_row.dart';
import 'package:chat_app/models/custom_elevated_page_button.dart';
import 'package:chat_app/models/custom_password_textField.dart';
import 'package:chat_app/models/custom_snack_bar_model.dart';
import 'package:chat_app/models/custom_textField.dart';
import 'package:chat_app/screens/chat_screen.dart';
import 'package:chat_app/screens/sign_up_screen.dart';
import 'package:chat_app/widgets/app_image_widget.dart';
import 'package:chat_app/widgets/app_titleName_widget.dart';
import 'package:chat_app/models/head_title_of_textFields.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String? email, password;

  bool isLoading = false;

  bool isOnline = false;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: const Color(0xFFCDE7E0),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: formKey,
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
                    onChanged: (data) {
                      email = data;
                    },
                    hintText: "Email",
                    icon: Icons.email,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 10),
                  CustomPasswordTextfield(
                    onChanged: (data) {
                      password = data;
                    },
                  ),
                  const SizedBox(height: 10),
                  const Divider(thickness: 1, color: Colors.grey),
                  const SizedBox(height: 10),
                  CustomElevatedPageButton(
                    title: "Sign In",
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        isLoading = true;
                        setState(() {});

                        try {
                          // ignore: unused_local_variable
                          UserCredential userCredential = await FirebaseAuth
                              .instance
                              .signInWithEmailAndPassword(
                                email: email == null ? "" : email!,
                                password: password == null ? "" : password!,
                              );
                          // ignore: use_build_context_synchronously
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ChatScreen(),
                            ),
                          );
                          // ScaffoldMessenger.of(
                          //   // ignore: use_build_context_synchronously
                          //   context,
                          // ).showSnackBar(
                          //   SnackBar(
                          //     backgroundColor: const Color(0xFFCDE7E0),
                          //     content: CustomSnackBarModel(
                          //       message: "Success signing in",
                          //     ),
                          //   ),
                          // );
                          isOnline = true;
                        } on FirebaseAuthException catch (e) {
                          if (e.code == "wrong-password") {
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: const Color(0xFFCDE7E0),
                                content: CustomSnackBarModel(
                                  message: "sorry , Wrong password",
                                ),
                              ),
                            );
                            isOnline = true;
                          } else if (e.code == "user-not-found") {
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: const Color(0xFFCDE7E0),
                                content: CustomSnackBarModel(
                                  message: "sorry , User not found",
                                ),
                              ),
                            );
                            isOnline = true;
                          } else if (e.code == "channel-error" ||
                              e.code == "invalid-credential") {
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: const Color(0xFFCDE7E0),
                                content: CustomSnackBarModel(
                                  message: "Invalid email or password",
                                ),
                              ),
                            );
                            isOnline = true;
                          } else {
                            isOnline = true;

                            log(e.code);
                          }
                        }
                        isLoading = false;
                        // ignore: use_build_context_synchronously
                        if (!isOnline) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: const Color(0xFFCDE7E0),
                              content: CustomSnackBarModel(
                                message: "Check your internet connection",
                              ),
                            ),
                          );
                        }

                        setState(() {});
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomCheckacountRow(
                    question: "Don't have an account?",
                    option: "Sign up now",
                    onpressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
