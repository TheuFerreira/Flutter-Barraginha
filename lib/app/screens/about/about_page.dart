import 'package:flutter/material.dart';
import 'package:flutter_barraginha/app/screens/about/controllers/about_controller.dart';
import 'package:flutter_barraginha/app/shared/components/drawer_widget.dart';
import 'package:flutter_barraginha/app/shared/components/large_app_bar_widget.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class AboutPage extends StatelessWidget {
  final AboutController _controller = AboutController();
  AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: const LargeAppBarWidget(title: 'Sobre'),
      body: const SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(40),
            child: Text(
              // TODO: About APP
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
              style: TextStyle(fontSize: 17),
              textAlign: TextAlign.justify,
            ),
          ),
        ),
      ),
      persistentFooterButtons: [
        Observer(
          builder: (context) {
            String text = _controller.info;
            return Text(
              text,
              style: const TextStyle(fontWeight: FontWeight.normal),
            );
          },
        ),
      ],
    );
  }
}
