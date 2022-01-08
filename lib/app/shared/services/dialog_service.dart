import 'package:flutter/material.dart';
import 'package:flutter_barraginha/app/shared/dialogs/base_dialog.dart';

class DialogService {
  static Future<bool> showQuestionDialog(
    BuildContext context,
    String title,
    String description,
  ) async {
    final result = await showDialog(
      context: context,
      builder: (ctx) => BaseDialog(
        title: title,
        content: Text(
          description,
          style: Theme.of(context).textTheme.headline4,
        ),
        onConfirm: () => Navigator.pop(context, true),
        onCancel: () => Navigator.pop(context, false),
      ),
    );
    if (result == null) return false;

    return result as bool;
  }
}
