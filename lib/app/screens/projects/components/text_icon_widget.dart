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
          color: Theme.of(context).colorScheme.secondary,
        ),
        const SizedBox(width: 8.0),
        Text(
          data,
          style: Theme.of(context).textTheme.headline4,
        ),
      ],
    );
  }
}
