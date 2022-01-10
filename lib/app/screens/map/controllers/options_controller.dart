import 'package:flutter/material.dart';
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

List<Widget> options = [
  Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        Icon(Icons.add),
        Text('Adicionar'),
      ],
    ),
  ),
  Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        Icon(Icons.edit),
        Text('Editar'),
      ],
    ),
  ),
  Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        Icon(Icons.control_camera),
        Text('Mover'),
      ],
    ),
  ),
  Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        Icon(Icons.delete),
        Text('Deletar'),
      ],
    ),
  ),
];