import 'package:flutter/material.dart';
import 'package:flutter_barraginha/app/screens/partners/components/info_partner_widget.dart';
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
              onPressed: () => Scaffold.of(context).openDrawer(),
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: const [
                InfoPartnerWidget(
                  imagePath: 'images/epamig.png',
                  title: 'EPAMIG',
                  description:
                      'A EPAMIG é uma empresa com a finalidade de desenvolver pesquisas relacionadas à agropecuária em Patos de Minas.',
                ),
                SizedBox(height: 40),
                InfoPartnerWidget(
                  imagePath: 'images/if.png',
                  title: 'IFMG - BAMBUÍ',
                  description:
                      'É uma instituição de ensino da Rede Federal de Educação, que oferta, cursos técnicos e superiores de forma gratuita.',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
