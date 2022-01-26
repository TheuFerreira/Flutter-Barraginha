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

  @computed
  num get countBarrage => 0;

  final IPartRepository _partRepository = PartRepository();

  _PartControllerBase(int idProject) {
    loadAll(idProject);
  }

  @action
  Future loadAll(int idProject) async {
    parts = await _partRepository.getAll(idProject);
  }
}
