import 'package:flutter/material.dart';

class CardBorderComponent extends StatelessWidget {
  final IconData icon;
  final String title;
  final List<Widget>? children;
  const CardBorderComponent({
    Key? key,
    required this.icon,
    required this.title,
    this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                width: 1,
                color: const Color.fromARGB(255, 126, 126, 126),
              ),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headline3,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Icon(
                      icon,
                      size: 66,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    if (children != null)
                      for (int i = 0; i < children!.length; i++) children![i]
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
