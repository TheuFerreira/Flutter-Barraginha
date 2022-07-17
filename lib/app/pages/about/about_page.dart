import 'package:flutter/material.dart';
import 'package:flutter_barraginha/app/pages/about/controllers/about_controller.dart';
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
              'A drenagem das estradas rurais no Brasil era pouco discutida, '
              'mesmo com a importância econômica da agropecuária. Práticas '
              'antrópicas como por exemplo o desmatamento de árvores e o '
              'plantio de culturas sem o devido manejo, vem causando a erosão '
              'no solo, devido à falta de práticas conservacionistas que vem '
              'cada vez mais reduzindo a infiltração da água no solo, '
              'acelerando o escoamento superficial, não havendo o '
              'reabastecimento do lençol freático. Uma das formas para destinar'
              ' as águas pluviais nas estradas ambientalmente adequados é a '
              'utilizado do Bolsão de Contenção de Água. Tal técnica consiste '
              'em escavar bacias nas margens das estradas em locais '
              'pré-determinados para que possa armazenar a água pluvial, '
              'facilitando a infiltração da água no solo, uma alternativa de '
              'grande valor ambiental. Sendo assim, para facilitar o '
              'dimensionamento de um bolsão e também não depender de um '
              'profissional ir a campo, o aplicativo CalcuLand tem como '
              'objetivo calcular a quantidade de bolsões ao longo de uma '
              'estrada e suas dimensões.',
              style: TextStyle(fontSize: 17),
              textAlign: TextAlign.justify,
            ),
          ),
        ),
      ),
      persistentFooterButtons: [
        Observer(
          builder: (context) {
            final deviceInfo = _controller.deviceInfo;
            if (deviceInfo == null) {
              return Container();
            }

            return Text(
              deviceInfo.toString(),
              style: const TextStyle(fontWeight: FontWeight.normal),
            );
          },
        ),
      ],
    );
  }
}
