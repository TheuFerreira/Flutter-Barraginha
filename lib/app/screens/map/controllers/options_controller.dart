import 'package:flutter/material.dart';
import 'package:flutter_barraginha/app/screens/map/components/option_widget.dart';
import 'package:mobx/mobx.dart';

part 'options_controller.g.dart';

class OptionsController = _OptionsControllerBase with _$OptionsController;

abstract class _OptionsControllerBase with Store {
  @observable
  List<bool> values = ObservableList<bool>.of(
    options.map((e) => false).toList(),
  );

  @computed
  int get selected => values.indexWhere((element) => element == true);

  @action
  void onSelect(int index) {
    for (int i = 0; i < values.length; i++) {
      if (i == index) continue;
      values[i] = false;
    }
    values[index] = !values[index];
  }
}

List<Widget> options = const [
  OptionWidget(
    icon: Icons.add,
    title: 'Adicionar',
  ),
  OptionWidget(
    icon: Icons.edit,
    title: 'Editar',
  ),
  OptionWidget(
    icon: Icons.control_camera,
    title: 'Mover',
  ),
  OptionWidget(
    icon: Icons.delete,
    title: 'Deletar',
  ),
];
