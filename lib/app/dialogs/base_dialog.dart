import 'package:flutter/material.dart';

class BaseDialog extends StatelessWidget {
  final String title;
  final Widget? content;
  final Function()? onCancel;
  final Function()? onConfirm;
  const BaseDialog({
    Key? key,
    this.title = 'Title',
    this.content,
    this.onCancel,
    this.onConfirm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              children: [
                const SizedBox(height: 16.0),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                ),
                if (content != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: content,
                  ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Material(
                    clipBehavior: Clip.hardEdge,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16.0),
                      ),
                    ),
                    color: const Color(0xFFF1F1F1),
                    child: InkWell(
                      onTap: onCancel,
                      child: const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Center(
                          child: Text(
                            'Cancelar',
                            style: TextStyle(
                              color: Color(0xFF666666),
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Material(
                    clipBehavior: Clip.hardEdge,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(16.0),
                      ),
                    ),
                    color: Theme.of(context).colorScheme.primary,
                    child: InkWell(
                      onTap: onConfirm,
                      child: const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Center(
                          child: Text(
                            'Continuar',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
