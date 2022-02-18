import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barraginha/app/screens/tutorial/tutorial_page.dart';

class Tutorial extends StatefulWidget {
  const Tutorial({Key? key}) : super(key: key);

  @override
  _TutorialState createState() => _TutorialState();
}

class _TutorialState extends State<Tutorial> {
  int selectedIndex = 0;
  final _pageController = PageController(initialPage: 0);
  late List<Widget> pages = [];

  @override
  void initState() {
    super.initState();

    pages = const [
      TutorialPage(
        title: 'Página principal',
        image: 'images/inicio.png',
        descr: 'Para editar ou excluir um projeto clique nele e segure',
      ),
      TutorialPage(
        title: 'Página de trechos',
        image: 'images/trechos.png',
        descr: 'Para editar ou excluir um trecho clique nele e segure',
      ),
      TutorialPage(
        title: 'Página de mapa',
        image: 'images/mapa.png',
        descr: 'Clique nos controles e depois no '
            'ponto para realizar a ação desejada',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
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
          SizedBox(
            height: 40,
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

class DotWidget extends StatelessWidget {
  final bool isSelected;
  const DotWidget({
    Key? key,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 8.0,
        right: 8.0,
        bottom: 10.0,
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 15,
        height: 15,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: isSelected == true ? Colors.white : Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }
}
