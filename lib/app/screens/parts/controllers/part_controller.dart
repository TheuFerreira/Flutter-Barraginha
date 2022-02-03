import 'dart:developer';

import 'package:flutter_barraginha/app/shared/database/repositories/part_repository.dart';
import 'package:flutter_barraginha/app/shared/database/responses/display_part.dart';
import 'package:mobx/mobx.dart';

part 'part_controller.g.dart';

class PartController = _PartControllerBase with _$PartController;

abstract class _PartControllerBase with Store {
  @observable
  List<DisplayPart> parts = ObservableList<DisplayPart>.of([]);

  @computed
  int get countParts => parts.length;

  @observable
  num countBarrage = 0;

  final IPartRepository _partRepository = PartRepository();

  _PartControllerBase(int idProject) {
    loadAll(idProject);
  }

  @action
  Future delete(DisplayPart part) async {
    part.status = 0;

    await _partRepository.save(part);
  }

  @action
  Future loadAll(int idProject) async {
    parts = [];
    countBarrage = 0;
    parts = await _partRepository.getAll(idProject);
  }

  @action
  void addBarrageNumber(num barrageNumber) {
    countBarrage += barrageNumber;
  }
}
