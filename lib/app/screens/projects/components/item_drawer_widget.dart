import 'package:flutter/material.dart';

class ItemDrawerWidget extends StatelessWidget {
  final String title;
  final Function()? onTap;
  const ItemDrawerWidget({
    Key? key,
    this.title = 'Title',
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(
        Icons.live_help,
        size: 32.0,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 20.0,
        ),
      ),
      textColor: const Color(0xFF666666),
      iconColor: const Color(0xFF666666),
      onTap: onTap,
    );
  }
}