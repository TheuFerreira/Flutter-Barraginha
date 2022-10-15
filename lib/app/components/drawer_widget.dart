import 'package:flutter/material.dart';
import 'package:flutter_barraginha/app/pages/about/about_page.dart';
import 'package:flutter_barraginha/app/pages/licenses/licenses_page.dart';
import 'package:flutter_barraginha/app/pages/partners/partners_page.dart';
import 'package:flutter_barraginha/app/pages/projects/components/item_drawer_widget.dart';
import 'package:flutter_barraginha/app/pages/projects/projects_page.dart';
import 'package:flutter_barraginha/app/pages/tutorial/tutorial_page.dart';

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
                padding: const EdgeInsets.only(top: 20, bottom: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Container(
                        color: Colors.white,
                        height: 200,
                        width: 200,
                        child: Image.asset('images/logoApp.png'),
                      ),
                    ),
                    const SizedBox(height: 14.0),
                    const Text(
                      'Calculand',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                      ),
                    ),
                    const SizedBox(height: 10)
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ItemDrawerWidget(
                  title: 'Início',
                  icon: const Icon(Icons.home),
                  onTap: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const ProjectsPage()),
                  ),
                ),
                ItemDrawerWidget(
                  title: 'Tutorial',
                  icon: const Icon(Icons.live_help),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => const TutorialPage()),
                  ),
                ),
                ItemDrawerWidget(
                  title: 'Parceiros',
                  icon: const Icon(Icons.people),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (ctx) => const PartnersPage()),
                  ),
                ),
                ItemDrawerWidget(
                  title: 'Sobre',
                  icon: const Icon(Icons.info),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (builder) => AboutPage()),
                  ),
                ),
                ItemDrawerWidget(
                  title: 'Licenças',
                  icon: const Icon(Icons.android),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (builder) => const LicensesPage()),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
