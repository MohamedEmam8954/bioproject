import 'package:flutter/material.dart';

void showMessage(BuildContext context,
    {required String content, String? title}) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("ok"))
          ],
          title: Text(title.toString()),
          content: Text(
            content.toString(),
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        );
      });
}
