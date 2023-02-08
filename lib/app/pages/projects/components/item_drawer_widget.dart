import 'package:flutter/material.dart';

class ItemDrawerWidget extends StatelessWidget {
  final String title;
  final Icon icon;
  final Function()? onTap;

  const ItemDrawerWidget({
    Key? key,
    this.title = 'Title',
    required this.icon,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      onTap: onTap,
    );
  }
}
