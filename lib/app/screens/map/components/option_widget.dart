import 'package:flutter/material.dart';

class OptionWidget extends StatelessWidget {
  final IconData? icon;
  final String title;
  const OptionWidget({Key? key, this.icon, this.title = 'Title'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(icon),
          Text(title),
        ],
      ),
    );
  }
}
