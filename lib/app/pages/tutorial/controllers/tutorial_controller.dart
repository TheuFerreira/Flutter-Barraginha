// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/cupertino.dart';
import 'package:flutter_barraginha/app/pages/tutorial/components/page_widget.dart';
import 'package:flutter_barraginha/domain/use_cases/update_show_tutorial_case.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'tutorial_controller.g.dart';

class TutorialController = _TutorialControllerBase with _$TutorialController;

abstract class _TutorialControllerBase with Store {
  @observable
  late List<PageWidget> pages = ObservableList<PageWidget>.of(const [
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
  ]);

  @observable
  int selectedPage = 0;

  @observable
  bool showPrevious = true;

  @observable
  bool showContinue = false;

  final _updateShowTutorialCase = Modular.get<UpdateShowTutorialCase>();

  @action
  void updatePage(int index) {
    showContinue = false;
    if (index == pages.length - 1) {
      showContinue = true;
    }

    showPrevious = false;
    if (index == 0) {
      showPrevious = true;
    }

    selectedPage = index;
  }

  void continueToExit(BuildContext context) {
    _updateShowTutorialCase(false);
    Navigator.of(context).pop();
  }
}
