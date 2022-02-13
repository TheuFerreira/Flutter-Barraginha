import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final String message;
  final Color? color;
  const LoadingWidget(this.message, {Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator(
          color: color ?? Theme.of(context).colorScheme.primary,
        ),
        const SizedBox(height: 12.0),
        Text(
          message,
          style: TextStyle(
            color: color ?? Colors.black,
          ),
        ),
      ],
    );
  }
}
