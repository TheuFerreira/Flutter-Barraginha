import 'package:flutter/material.dart';
import 'package:flutter_barraginha/app/screens/projects/projects_page.dart';
import 'package:flutter_barraginha/app/screens/tutorial/components/navigation.dart';
import 'package:flutter_barraginha/app/screens/tutorial/tutorial_page.dart';
class Tutorial extends StatefulWidget {
  const Tutorial({Key? key}) : super(key: key);

  @override
  _TutorialState createState() => _TutorialState();
}

class _TutorialState extends State<Tutorial> {
  int selectedIndex = 0;
  late PageController pc;

  @override
  void initState()
  {
    // TODO: implement initState
    super.initState();
    pc = PageController(initialPage: selectedIndex);
  }


  void onItemTaped(int index)
  {
    setState(() {
      selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,

      body: PageView
        (
          controller: pc,
          children:
          // ignore: prefer_const_literals_to_create_immutables
          [
            const TutorialPage
            (
              title: 'Página principal',
              image: 'images/inicio.png',
              descr: 'Para editar ou excluir um projeto clique nele e segure'
            ),

            const TutorialPage
              (
                title: 'Página de trechos',
                image: 'images/trechos.png',
                descr: 'Para editar ou excluir um trecho clique nele e segure'
            ),

            const TutorialPage
              (
                title: 'Página de mapa',
                image: 'images/mapa.png',
                descr: 'Clique nos controles e depois no '
                       'ponto para realizar a ação desejada'
            ),
          ],

          onPageChanged: onItemTaped
      ),

      bottomNavigationBar: Navigation(index: selectedIndex, pc: pc,)
    );
  }
}
