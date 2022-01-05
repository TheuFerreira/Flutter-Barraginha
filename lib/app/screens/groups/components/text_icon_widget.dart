import 'package:flutter/material.dart';

class TextIconWidget extends StatelessWidget {
  final IconData icon;
  final String data;
  const TextIconWidget(
    this.icon,
    this.data, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: const Color(0xFF00695C),
        ),
        const SizedBox(width: 8.0),
        Text(
          data,
          style: const TextStyle(
            fontSize: 18.0,
            color: Color(0xFF666666),
          ),
        ),
      ],
    );
  }
}
