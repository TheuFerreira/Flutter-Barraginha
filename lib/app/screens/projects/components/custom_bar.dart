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
                  height: 140,
                  
                  // ignore: prefer_const_constructors
                  decoration: BoxDecoration
                  (
                    color: Theme.of(context).colorScheme.primary,
                    boxShadow: 
                    [
                      BoxShadow
                      (
                        color: Colors.black26,
                        blurRadius: 1,
                        spreadRadius: 1,
                        offset: Offset.fromDirection(90),
                        blurStyle: BlurStyle.normal
                      )
                    ],
                   // border: Border(bottom: BorderSide(color: Colors.black12, width: 1, style: BorderStyle.solid))
                  ),
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
              horizontal: 60.0,
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
