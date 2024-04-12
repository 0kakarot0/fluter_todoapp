import 'package:flutter/material.dart';
import 'package:todoapp/component/my_button.dart';

class MyDialogBox extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  VoidCallback onSave;
  VoidCallback onCancel;
  final String buttonText;

  MyDialogBox({
    super.key,
    required this.hintText,
    required this.controller,
    required this.onSave,
    required this.onCancel,
    required this.buttonText
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Create Task"),
      content: Container(
        height: 100,
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: hintText,
              ),
            ),
          ],
        ),
      ),
      actions: [
        MyButton(
          buttonText: buttonText,
          onPressed: onSave,
        ),

        MyButton(
          buttonText: "Cancel",
          onPressed: onCancel,
        )
      ],
    );
  }
}
