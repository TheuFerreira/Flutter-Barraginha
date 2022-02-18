import 'package:flutter/material.dart';
import 'package:flutter_barraginha/app/screens/tutorial/components/dot_widget.dart';
import 'package:flutter_barraginha/app/screens/tutorial/components/page_widget.dart';

class TutorialPage extends StatefulWidget {
  const TutorialPage({Key? key}) : super(key: key);

  @override
  _TutorialPageState createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage> {
  int selectedIndex = 0;
  final _pageController = PageController(initialPage: 0);
  late List<PageWidget> pages = [];

  @override
  void initState() {
    super.initState();

    pages = const [
      PageWidget(
        title: 'Página principal',
        image: 'images/inicio.png',
        description: 'Para editar ou excluir um projeto clique nele e segure',
      ),
      PageWidget(
        title: 'Página de trechos',
        image: 'images/trechos.png',
        description: 'Para editar ou excluir um trecho clique nele e segure',
      ),
      PageWidget(
        title: 'Página de mapa',
        image: 'images/mapa.png',
        description: 'Clique nos controles e depois no '
            'ponto para realizar a ação desejada',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF1F1F1),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: pages.length,
              itemBuilder: (ctx, i) => pages[i],
              onPageChanged: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
            ),
          ),
          Container(
            color: Theme.of(context).colorScheme.primary,
            height: 40,
            width: double.infinity,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var i = 0; i < pages.length; i++) DotWidget(isSelected: i == selectedIndex),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
