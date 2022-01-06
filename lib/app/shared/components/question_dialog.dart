import 'package:flutter/material.dart';

class QuestionDialog {
  Future<bool?> show(
    BuildContext context, {
    String title = 'Title',
    String description = 'Description',
  }) async {
    return await showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 24,
            ),
          ),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                description,
                style: const TextStyle(
                  color: Color(0xFF666666),
                ),
              ),
            ],
          ),
          actionsAlignment: MainAxisAlignment.spaceBetween,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: const Text(
                'Cancelar',
                style: TextStyle(
                  color: Color(0xFF666666),
                  fontSize: 16.0,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: const Text(
                'Continuar',
                style: TextStyle(
                  color: Color(0xFF666666),
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
