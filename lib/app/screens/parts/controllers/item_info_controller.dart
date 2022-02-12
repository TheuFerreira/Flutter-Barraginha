import 'package:flutter_barraginha/app/shared/database/responses/display_project_response.dart';
import 'package:mobx/mobx.dart';

part 'item_info_controller.g.dart';

class ItemInfoController = _ItemInfoControllerBase with _$ItemInfoController;

abstract class _ItemInfoControllerBase with Store {
  @observable
  String countParts = "0";

  @observable
  String countBarrage = "0";

  @observable
  String rainVolume = '';

  final DisplayProjectResponse _project;
  late int _countParts = 0;

  _ItemInfoControllerBase(this._project) {
    rainVolume = _project.rainVolume.toString().replaceAll('.', ',');
  }

  @action
  void setCountParts(int value) => countParts = value.toString();

  @action
  void resetCountBarrage() {
    _countParts = 0;
    countBarrage = _countParts.toString();
  }

  @action
  void addCountBarrage(int value) {
    _countParts += value;
    countBarrage = _countParts.toString();
  }
}
