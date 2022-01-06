import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final String message;
  const LoadingWidget(this.message, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircularProgressIndicator(
          color: Color(0xFF439889),
        ),
        const SizedBox(height: 12.0),
        Text(message),
      ],
    );
  }
}
