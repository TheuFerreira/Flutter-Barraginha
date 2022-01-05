import 'package:flutter/material.dart';

import 'text_icon_widget.dart';

class ItemGroupWidget extends StatelessWidget {
  final String title;
  final String date;
  final String parts;
  final Function()? onLongPress;
  const ItemGroupWidget({
    Key? key,
    this.title = 'Title',
    this.date = '01/01/2001',
    this.parts = '20 Trechos',
    this.onLongPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.only(bottom: 32.0, left: 32.0, right: 32.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: InkWell(
        onLongPress: onLongPress,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24.0,
                  color: Color(0xFF666666),
                ),
              ),
              const SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_forward,
                      size: 32,
                      color: Color(0xFF00695C),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextIconWidget(Icons.calendar_today, date),
                  TextIconWidget(Icons.timeline, parts),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
