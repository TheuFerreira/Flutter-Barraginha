import 'package:flutter/material.dart';

class QuestionDialogWidget extends StatelessWidget {
  final String title;
  final Widget? content;
  const QuestionDialogWidget({
    Key? key,
    this.title = 'Title',
    this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      content: content,
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
  }
}
