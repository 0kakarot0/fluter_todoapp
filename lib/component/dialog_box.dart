import 'package:flutter/material.dart';
import 'package:todoapp/component/my_button.dart';

class MyDialogBox extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  VoidCallback onSave;
  VoidCallback onCancel;

   MyDialogBox({
    super.key,
    required this.hintText,
    required this.controller,
    required this.onSave,
    required this.onCancel,
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
          buttonText: "Save",
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
