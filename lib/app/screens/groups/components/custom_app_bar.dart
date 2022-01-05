import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final Widget? top;
  final Widget? middle;
  final Widget? bottom;
  const CustomAppBar({
    Key? key,
    this.top,
    this.middle,
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
                  height: 200,
                  color: const Color(0xFF439889),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      children: [
                        top != null ? top! : const SizedBox(),
                        const SizedBox(height: 16.0),
                        middle != null ? middle! : const SizedBox(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 45,
            ),
          ],
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Card(
            color: const Color(0xFF00695C),
            elevation: 2,
            margin: const EdgeInsets.symmetric(
              horizontal: 64.0,
              vertical: 5,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: bottom,
            ),
          ),
        ),
      ],
    );
  }
}
