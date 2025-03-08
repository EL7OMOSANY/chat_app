import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MessageTextField extends StatelessWidget {
  MessageTextField({super.key});
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(35),
      ),
      child: TextField(
        onSubmitted: (data) {
          FirebaseFirestore.instance.collection("messages").add({
            "message": controller.text,
            "time": DateTime.now(),
          });
          controller.clear();
        },
        controller: controller,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 24),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.teal, width: 4),
            borderRadius: BorderRadius.circular(25),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black, width: 3),
            borderRadius: BorderRadius.circular(25),
          ),
          suffixIcon: IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
