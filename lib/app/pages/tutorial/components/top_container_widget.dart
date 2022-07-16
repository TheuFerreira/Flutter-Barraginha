import 'package:flutter/material.dart';
import 'package:flutter_barraginha/app/pages/tutorial/clippers/top_custom_clipper.dart';

class TopContainerWidget extends StatelessWidget {
  final Widget child;
  const TopContainerWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Center(child: child),
              ],
            ),
          ),
        ),
        ClipPath(
          clipper: TopCustomClipper(),
          child: Container(
            height: 95,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
