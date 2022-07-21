import 'package:flutter_barraginha/domain/entities/display_project_response.dart';
import 'package:mobx/mobx.dart';

part 'item_info_controller.g.dart';

class ItemInfoController = _ItemInfoControllerBase with _$ItemInfoController;

abstract class _ItemInfoControllerBase with Store {
  @observable
  String countParts = "0";

  @observable
  int countBarrage = 0;

  @observable
  String rainVolume = '';

  final DisplayProjectResponse _project;

  _ItemInfoControllerBase(this._project) {
    rainVolume = _project.rainVolume.toString().replaceAll('.', ',');
  }

  @action
  void setCountParts(int value) => countParts = value.toString();

  @action
  void resetCountBarrage() {
    countBarrage = 0;
  }

  @action
  void addCountBarrage(int value) {
    countBarrage += value;
  }
}
