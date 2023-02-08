import 'package:flutter/material.dart';
import 'package:flutter_barraginha/domain/entities/display_project_response.dart';

import 'text_icon_widget.dart';

class ItemProjectWidget extends StatelessWidget {
  final DisplayProjectResponse project;
  final Function(DisplayProjectResponse project)? onTap;
  final Function(DisplayProjectResponse project)? onLongPress;

  const ItemProjectWidget(
    this.project, {
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
      ),
      child: InkWell(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(24),
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        onLongPress: () => onLongPress!(project),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                project.title ?? '',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () => onTap!(project),
                    icon: Icon(
                      Icons.arrow_forward,
                      size: 32,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextIconWidget(Icons.calendar_today, project.getShortDate()),
                  TextIconWidget(
                    Icons.timeline,
                    '${project.partCount} Trechos',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
