import 'package:flutter/material.dart';
import 'package:flutter_barraginha/app/screens/map/components/option_widget.dart';
import 'package:flutter_barraginha/app/screens/map/enums/options_type.dart';
import 'package:mobx/mobx.dart';

part 'options_controller.g.dart';

class OptionsController = _OptionsControllerBase with _$OptionsController;

abstract class _OptionsControllerBase with Store {
  @observable
  List<bool> values = ObservableList<bool>.of(
    options.map((e) => false).toList(),
  );

  @computed
  OptionsType get selected {
    final index = values.indexWhere((element) => element == true);
    if (index == -1) {
      return OptionsType.none;
    }

    return options[index].type;
  }

  @action
  void onSelect(int index) {
    for (int i = 0; i < values.length; i++) {
      if (i == index) continue;
      values[i] = false;
    }
    values[index] = !values[index];
  }
}

List<OptionWidget> options = const [
  OptionWidget(
    icon: Icons.add,
    title: 'Adicionar',
    type: OptionsType.add,
  ),
  OptionWidget(
    icon: Icons.edit,
    title: 'Editar',
    type: OptionsType.edit,
  ),
  OptionWidget(
    icon: Icons.control_camera,
    title: 'Mover',
    type: OptionsType.move,
  ),
  OptionWidget(
    icon: Icons.delete,
    title: 'Deletar',
    type: OptionsType.delete,
  ),
];
