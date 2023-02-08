// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class Loader extends StatefulWidget {
  final Color dotColor;
  final Duration duration;
  final Icon dotIcon;
  final double dotSize;
  final double dotPadding;

  const Loader({
    Key? key,
    this.dotColor = Colors.white,
    this.duration = const Duration(milliseconds: 1000),
    this.dotIcon = const Icon(Icons.blur_on),
    this.dotSize = 20,
    this.dotPadding = 15,
  }) : super(key: key);

  @override
  _Loader createState() => _Loader();
}

class _Loader extends State<Loader> with SingleTickerProviderStateMixin {
  late Animation<double> animation_1;
  late Animation<double> animation_2;
  late Animation<double> animation_3;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(duration: widget.duration, vsync: this);

    animation_1 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 0.80, curve: Curves.ease),
      ),
    );

    animation_2 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.1, 0.9, curve: Curves.ease),
      ),
    );

    animation_3 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.2, 1.0, curve: Curves.ease),
      ),
    );

    controller.addListener(() => setState(() {}));
    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Transform.translate(
          offset: Offset(
            0.0,
            -30 *
                (animation_1.value <= 0.50
                    ? animation_1.value
                    : 1.0 - animation_1.value),
          ),
          child: Dot(
            radius: widget.dotSize,
            color: widget.dotColor,
            icon: widget.dotIcon,
          ),
        ),
        Transform.translate(
          offset: Offset(
            0.0,
            -30 *
                (animation_2.value <= 0.50
                    ? animation_2.value
                    : 1.0 - animation_2.value),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: widget.dotPadding),
            child: Dot(
              radius: widget.dotSize,
              color: widget.dotColor,
              icon: widget.dotIcon,
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(
            0.0,
            -30 *
                (animation_3.value <= 0.50
                    ? animation_3.value
                    : 1.0 - animation_3.value),
          ),
          child: Dot(
            radius: widget.dotSize,
            color: widget.dotColor,
            icon: widget.dotIcon,
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class Dot extends StatelessWidget {
  final double? radius;
  final Color? color;
  final Icon? icon;

  const Dot({
    Key? key,
    this.radius,
    this.color,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Transform.rotate(
        angle: 0.0,
        child: Container(
          width: radius,
          height: radius,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
