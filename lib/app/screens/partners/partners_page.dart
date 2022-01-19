import 'package:flutter/material.dart';
import 'package:flutter_barraginha/app/screens/projects/components/drawer_widget.dart';

class PartnersPage extends StatelessWidget {
  const PartnersPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(bottom: 120),
          child: Builder(
            builder: (context) => IconButton(
              icon: const Icon(
                Icons.reorder,
                size: 30,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
        ),
        centerTitle: true,
        title: Container(
          child: const Text(
            'Parceiros',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
          ),
          padding: const EdgeInsets.only(top: 30),
        ),
        toolbarHeight: 180,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 40,
              bottom: 40,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: const Icon(
                    Icons.person,
                    size: 90,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        spreadRadius: 0,
                        blurRadius: 1,
                        blurStyle: BlurStyle.normal,
                        offset: Offset.fromDirection(90),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 290,
                  height: 120,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: const [
                        Text(
                          'Pessoa 1',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'orem ipsum phasellus elementum condimentum justo vehicula diam, dictum donec id erat vel fusce pulvinar, aenean ',
                          style: TextStyle(
                            color: Colors.black38,
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        spreadRadius: 0,
                        blurRadius: 1,
                        blurStyle: BlurStyle.normal,
                        offset: Offset.fromDirection(90),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 1,
          )
        ],
      ),
    );
  }
}