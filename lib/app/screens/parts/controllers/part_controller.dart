import 'package:flutter_barraginha/app/shared/database/dao/dao_project.dart';
import 'package:flutter_barraginha/app/shared/models/part_model.dart';
import 'package:flutter_barraginha/app/shared/models/project_model.dart';
import 'package:mobx/mobx.dart';

part 'part_controller.g.dart';

class PartController = _PartControllerBase with _$PartController;

abstract class _PartControllerBase with Store {
  @observable
  ProjectModel project;

  @observable
  List<PartModel> parts = ObservableList();

  _PartControllerBase(this.project);

  @action
  Future updateTitleProject(String newTitle) async {
    project.title = newTitle;
    project = await DAOProject().save(project);
  }

  @action
  Future updateRainVolumeProject(double newRainVolume) async {
    project.rainVolume = newRainVolume;
    project = await DAOProject().save(project);
  }
}
