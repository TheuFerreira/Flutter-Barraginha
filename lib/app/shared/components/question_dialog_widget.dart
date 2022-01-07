import 'package:flutter/material.dart';

class QuestionDialogWidget extends StatelessWidget {
  final String title;
  final Widget? content;
  final Function()? onConfirm;
  const QuestionDialogWidget({
    Key? key,
    this.title = 'Title',
    this.content,
    @required this.onConfirm,
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
          onPressed: onConfirm,
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
