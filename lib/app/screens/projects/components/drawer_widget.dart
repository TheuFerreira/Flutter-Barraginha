import 'package:flutter/material.dart';
import 'package:flutter_barraginha/app/screens/projects/components/item_drawer_widget.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Theme.of(context).colorScheme.primary,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(75),
                      child: Container(
                        color: Theme.of(context).colorScheme.secondary,
                        height: 150,
                        width: 150,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      'Nome do App',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ItemDrawerWidget(
                  title: 'Tutorial',
                  onTap: () {
                    // TODO: Tutorial
                  },
                ),
                ItemDrawerWidget(
                  title: 'Parceiros',
                  onTap: () {
                    // TODO: Parceiros
                  },
                ),
                ItemDrawerWidget(
                  title: 'Sobre',
                  onTap: () {
                    // TODO: Sobre
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
