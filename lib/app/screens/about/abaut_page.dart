import 'package:flutter/material.dart';
import 'package:flutter_barraginha/app/screens/projects/components/drawer_widget.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      drawer: const DrawerWidget(),
      appBar: AppBar
      (
        toolbarHeight: 180,
        centerTitle: true,

        leading: Padding(
          padding: const EdgeInsets.only(bottom: 120),

          child: Builder
          (
            builder: (context) =>
             IconButton
            (
              icon: const Icon
              (
                Icons.reorder,
                size: 30,
              ),

              onPressed: ()
              {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
        ),

        title: Container
        (
          padding: const EdgeInsets.only(top: 30),

          child: const Text
          (
            'Sobre',
            style: TextStyle
            (
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),

      body: Column
      (
        crossAxisAlignment: CrossAxisAlignment.center,
        children: 
        [
          const Padding(
            padding: EdgeInsets.all(40),
            child: Text
            (
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
              'sed do eiusmod tempor incididunt ut labore et dolore magna'
              'aliqua. Ut enim ad minim veniam, quis nostrud exercitation '
              'ullamco laboris nisi ut aliquip ex ea commodo consequat. '
              'Duis aute irure dolor in reprehenderit in voluptate velit '
              'esse cillum dolore eu fugiat nulla pariatur. Excepteur sint'
              ' occaecat cupidatat non proident, sunt in culpa qui officia'
              ' deserunt mollit anim id est laborum.Lorem ipsum dolor sit'
              ' amet, consectetur adipiscing elit, sed do eiusmod tempor '
              'incididunt ut labore et dolore magna aliqua. Ut enim ad '
              'minim veniam, quis nostrud exercitation ullamco laboris nisi '
              'ut aliquip ex ea commodo consequat. Duis aute irure dolor '
              'in reprehenderit in voluptate velit esse cillum dolore eu '
              'ugiat nulla pariatur. Excepteur sint occaecat cupidatat '
              'non proident, sunt in culpa qui officia deserunt mollit '
              'anim id est laborum.',
              style: TextStyle
              (
                fontSize: 17
              ),
              textAlign: TextAlign.justify,
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row
              (
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children:
                const [
                  Text
                  (
                    'Nome do App v2021.001.7',
                    style: TextStyle
                    (
                      fontWeight: FontWeight.normal
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),

    );
  }
}
