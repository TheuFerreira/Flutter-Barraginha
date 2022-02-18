import 'package:flutter/material.dart';

class DotWidget extends StatelessWidget {
  final bool isSelected;
  const DotWidget({
    Key? key,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 8.0,
        right: 8.0,
        bottom: 10.0,
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 15,
        height: 15,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: isSelected == true ? Colors.white : Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }
}
