import 'package:flutter/material.dart';

class LargeAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double height;
  const LargeAppBarWidget({
    Key? key,
    required this.title,
    this.height = 180,
  }) : super(key: key);

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: 180,
      leading: Padding(
        padding: const EdgeInsets.only(bottom: 120),
        child: IconButton(
          icon: const Icon(
            Icons.reorder,
            size: 30,
          ),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),
      centerTitle: true,
      title: Container(
        padding: const EdgeInsets.only(top: 30),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 180);
}
