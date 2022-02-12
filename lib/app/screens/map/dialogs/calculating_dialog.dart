import 'package:flutter/material.dart';

class CalculatingDialog {
  static show(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (ctx) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: const [
                CircularProgressIndicator(),
                SizedBox(width: 10),
                Text('Calculando, por favor aguarde...'),
              ],
            ),
          ),
        );
      },
    );
  }

  static close(BuildContext context) {
    Navigator.of(context).pop();
  }
}
