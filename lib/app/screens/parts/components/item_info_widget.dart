import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class ItemInfoWidget extends StatelessWidget {
  final String title;
  final String value;

  const ItemInfoWidget({
    Key? key,
    this.title = 'Title',
    this.value = '0',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 3.5,
      height: MediaQuery.of(context).size.width / 3.5,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      padding: const EdgeInsets.only(top: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            spreadRadius: 0,
            blurRadius: 1,
            blurStyle: BlurStyle.normal,
            offset: Offset.fromDirection(90),
          ),
        ],
        color: Theme.of(context).colorScheme.primary,
      ),
      child: Stack(
        fit: StackFit.expand,
        alignment: AlignmentDirectional.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 20,
                child: Marquee(
                  text: title,
                  blankSpace: 100,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 32.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
