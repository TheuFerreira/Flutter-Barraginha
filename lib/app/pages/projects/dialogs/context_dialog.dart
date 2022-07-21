import 'package:flutter/material.dart';
import 'package:flutter_barraginha/domain/entities/display_project_response.dart';

class ContextMenu extends StatelessWidget {
  final DisplayProjectResponse project;
  final Function(DisplayProjectResponse)? onEdit;
  final Function(DisplayProjectResponse)? onDelete;
  const ContextMenu({
    Key? key,
    required this.project,
    this.onEdit,
    this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      clipBehavior: Clip.hardEdge,
      child: SizedBox(
        width: 300,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 75,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  onEdit!(project);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Editar',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ],
                ),
              ),
            ),
            const Divider(),
            SizedBox(
              height: 75,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  onDelete!(project);
                },
                child: Text(
                  'Excluir',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
