import 'package:flutter/material.dart';
import 'package:flutter_barraginha/app/utils/options_type.dart';

class OptionWidget extends StatelessWidget {
  final IconData? icon;
  final String title;
  final OptionsType type;
  const OptionWidget({
    Key? key,
    this.icon,
    this.title = 'Title',
    this.type = OptionsType.none,
  }) : super(key: key);

  getType() {}

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
