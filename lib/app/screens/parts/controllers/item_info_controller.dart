import 'package:flutter_barraginha/app/shared/database/responses/display_project_response.dart';
import 'package:mobx/mobx.dart';

part 'item_info_controller.g.dart';

class ItemInfoController = _ItemInfoControllerBase with _$ItemInfoController;

abstract class _ItemInfoControllerBase with Store {
  String countParts = "0";

  String get countBarrage => _countBarrage.toString();

  @observable
  String rainVolume = '';

  final DisplayProjectResponse _project;
  final int _countBarrage = 0;

  _ItemInfoControllerBase(this._project) {
    rainVolume = _project.rainVolume.toString().replaceAll('.', ',');
  }
}
