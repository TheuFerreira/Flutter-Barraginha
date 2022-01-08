import 'package:flutter/material.dart';
import 'package:flutter_barraginha/app/screens/projects/model/project_model.dart';

import 'text_icon_widget.dart';

class ItemProjectWidget extends StatelessWidget {
  final ProjectModel group;
  final Function()? onTap;
  final Function()? onLongPress;
  const ItemProjectWidget(
    this.group, {
    Key? key,
    this.onTap,
    this.onLongPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(
        top: 16.0,
        bottom: 16.0,
        left: 32.0,
        right: 32.0,
      ),
      child: InkWell(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(24),
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        onLongPress: onLongPress,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                group.title,
                style: Theme.of(context).textTheme.headline2,
              ),
              const SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: onTap,
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
                  TextIconWidget(Icons.calendar_today, group.getShortDate()),
                  TextIconWidget(Icons.timeline, '${group.parts} Trechos'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
