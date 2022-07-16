import 'package:flutter/material.dart';
import 'package:flutter_barraginha/app/pages/tutorial/clippers/bottom_custom_clipper.dart';

class BottomContainerWidget extends StatelessWidget {
  final Widget? child;
  final Color backgroundColor;

  const BottomContainerWidget({
    Key? key,
    this.child,
    this.backgroundColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        RotatedBox(
          quarterTurns: 2,
          child: ClipPath(
            clipper: BottomCustomClipper(),
            child: Container(
              height: 85,
              decoration: BoxDecoration(
                color: backgroundColor,
              ),
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          top: 80,
          child: Container(
            color: backgroundColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(child: child),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
