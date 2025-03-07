import 'package:chat_app/models/custom_checkAcount_row.dart';
import 'package:chat_app/models/custom_elevated_page_button.dart';
import 'package:chat_app/models/custom_password_textField.dart';
import 'package:chat_app/models/custom_snack_bar_model.dart';
import 'package:chat_app/models/custom_textField.dart';
import 'package:chat_app/models/head_title_of_textFields.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String? email;

  String? password;

  String? name;

  String? number;

  bool isLoading = false;

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
                  const SizedBox(height: 120),
                  HeadTitleOfTextfields(title: " Sign Up"),
                  const SizedBox(height: 25),
                  CustomTextfield(
                    onChanged: (data) {
                      name = data;
                    },
                    hintText: "Name",
                    icon: Icons.person,
                    keyboardType: TextInputType.name,
                  ),
                  const SizedBox(height: 30),
                  CustomTextfield(
                    onChanged: (data) {
                      number = data;
                    },
                    hintText: "Number",
                    icon: Icons.phone,
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 30),
                  CustomTextfield(
                    onChanged: (data) {
                      email = data;
                    },
                    hintText: "Email",
                    icon: Icons.email,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 30),
                  CustomPasswordTextfield(
                    onChanged: (data) {
                      password = data;
                    },
                  ),
                  const SizedBox(height: 30),
                  CustomElevatedPageButton(
                    title: "Sign Up",
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        isLoading = true;
                        setState(() {});

                        try {
                          // ignore: unused_local_variable
                          UserCredential userCredential = await FirebaseAuth
                              .instance
                              .createUserWithEmailAndPassword(
                                email: email == null ? "" : email!,
                                password: password == null ? "" : password!,
                              );
                          ScaffoldMessenger.of(
                            // ignore: use_build_context_synchronously
                            context,
                          ).showSnackBar(
                            SnackBar(
                              backgroundColor: const Color(0xFFCDE7E0),
                              content: CustomSnackBarModel(
                                message: "Success , now Sign In",
                              ),
                            ),
                          );
                        } on FirebaseAuthException catch (e) {
                          if (e.code == "email-already-in-use") {
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: const Color(0xFFCDE7E0),
                                content: CustomSnackBarModel(
                                  message: "sorry ,Email already in use",
                                ),
                              ),
                            );
                          } else if (e.code == "invalid-email") {
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: const Color(0xFFCDE7E0),
                                content: CustomSnackBarModel(
                                  message: "sorry ,Invalid email",
                                ),
                              ),
                            );
                          } else if (e.code == "weak-password") {
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: const Color(0xFFCDE7E0),
                                content: CustomSnackBarModel(
                                  message: "sorry ,Your paasword is weak",
                                ),
                              ),
                            );
                          } else if (e.code == "channel-error") {
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: const Color(0xFFCDE7E0),
                                content: CustomSnackBarModel(
                                  message: "sorry ,Try write again",
                                ),
                              ),
                            );
                          }
                        }
                        isLoading = false;
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: const Color(0xFFCDE7E0),
                            content: CustomSnackBarModel(
                              message: "Check your internet connection",
                            ),
                          ),
                        );

                        setState(() {});
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomCheckacountRow(
                    question: "Already have an account?",
                    option: "Sign In now",
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
