import 'package:flutter/material.dart';

class ItemInfoWidget extends StatelessWidget {
  final String title;
  final String value;
  final Function()? onEdit;
  const ItemInfoWidget({
    Key? key,
    this.title = 'Title',
    this.value = '2',
    this.onEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      padding: const EdgeInsets.only(top: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: Theme.of(context).colorScheme.primary,
      ),
      child: Stack(
        fit: StackFit.expand,
        alignment: AlignmentDirectional.center,
        children: [
          Positioned(
            top: 0,
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ),
          if (onEdit != null)
            Positioned(
              bottom: 0,
              child: IconButton(
                color: Colors.white,
                iconSize: 16.0,
                icon: const Icon(Icons.edit),
                onPressed: onEdit,
              ),
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
