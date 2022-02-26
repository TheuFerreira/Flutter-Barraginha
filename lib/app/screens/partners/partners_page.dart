import 'package:flutter/material.dart';
import 'package:flutter_barraginha/app/screens/partners/components/info_partner_widget.dart';
import 'package:flutter_barraginha/app/shared/components/drawer_widget.dart';
import 'package:flutter_barraginha/app/shared/components/large_app_bar_widget.dart';

class PartnersPage extends StatelessWidget {
  const PartnersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: const LargeAppBarWidget(title: 'Parceiros'),
      body: SingleChildScrollView(
        child: Center(
          child: Column(

            children: const [
              SizedBox(height: 40),
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
              SizedBox(height: 40,),
              InfoPartnerWidget
              (
                  imagePath: 'images/ifSje.png',
                title: 'IFMG - SJE',

                description: 'É uma instituição pública federal que tem como missão consolidar-se como um centro de educação, promovendo o desenvolvimento humano.',
              ),
              SizedBox(height: 40,)
            ],
          ),
        ),
      ),
    );
  }
}
