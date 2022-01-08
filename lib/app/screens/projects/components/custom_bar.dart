import 'package:flutter/material.dart';

class CustomBar extends StatelessWidget {
  final Widget? top;
  final Widget? bottom;
  const CustomBar({
    Key? key,
    this.top,
    this.bottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 100,
                  color: Theme.of(context).colorScheme.primary,
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      children: [
                        top != null ? top! : const SizedBox(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 35,
            ),
          ],
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Card(
            color: Theme.of(context).colorScheme.secondary,
            elevation: 2,
            margin: const EdgeInsets.symmetric(
              horizontal: 80.0,
              vertical: 5,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 18.0),
              child: bottom,
            ),
          ),
        ),
      ],
    );
  }
}
