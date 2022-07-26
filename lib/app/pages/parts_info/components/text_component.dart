import 'package:flutter/material.dart';

class TextComponent extends StatelessWidget {
  final String title;
  final String? description;
  final Widget? child;
  final TextStyle? titleStyle;
  final TextStyle? descriptionStyle;
  const TextComponent({
    Key? key,
    required this.title,
    this.description,
    this.child,
    this.titleStyle,
    this.descriptionStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: titleStyle ?? Theme.of(context).textTheme.headline5,
        ),
        const SizedBox(height: 6),
        if (description != null)
          Text(
            description!,
            style: descriptionStyle ?? Theme.of(context).textTheme.subtitle1,
          ),
        if (child != null) child!
      ],
    );
  }
}
