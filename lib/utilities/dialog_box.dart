import 'package:flutter/material.dart';
import 'package:to_do_app/utilities/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  const DialogBox({required this.controller, required this.onSave, required this.onCancel, super.key});
  final VoidCallback onSave;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.amber,
      content: SizedBox(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: TextField(
                controller: controller,
                minLines: 1,
                maxLines: 2,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Input to-do task'),
              ),
            ),
            //const SizedBox(height: 30),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MyButton(text: "Cancel", onPressed: onCancel)),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MyButton(text: "Save", onPressed: onSave)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
