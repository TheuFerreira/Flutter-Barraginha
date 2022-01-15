import 'package:flutter_barraginha/app/shared/models/project_model.dart';
import 'package:flutter_barraginha/app/shared/database/dao/dao_project.dart';
import 'package:flutter_barraginha/app/shared/enums/page_status.dart';
import 'package:flutter_barraginha/app/shared/models/soil_type_model.dart';
import 'package:mobx/mobx.dart';

part 'projects_controller.g.dart';

class ProjectsController = _ProjectControllerBase with _$ProjectsController;

abstract class _ProjectControllerBase with Store {
  List<ProjectModel> oldProjects = [];

  @observable
  List<ProjectModel> projects = ObservableList<ProjectModel>();

  @observable
  PageStatus status = PageStatus.normal;

  @observable
  String message = '';

  @computed
  bool get isLoading => status == PageStatus.loading;

  final _dao = DAOProject();

  _ProjectControllerBase() {
    load();
  }

  @action
  Future load() async {
    status = PageStatus.loading;
    message = 'Carregando...';

    projects = await _dao.search();

    status = PageStatus.normal;
    message = '';
  }

  @action
  Future delete(ProjectModel project) async {
    message = 'Deletando Projeto...';
    status = PageStatus.loading;

    await _dao.delete(project);

    message = '';
    status = PageStatus.normal;
  }

  @action
  Future<ProjectModel> add(
    String title,
    double rainVolume,
    SoilTypeModel soilType,
  ) async {
    message = 'Criando novo Projeto...';
    status = PageStatus.loading;

    ProjectModel project = ProjectModel(
      title,
      DateTime.now(),
      rainVolume,
      soilType,
    );

    project = await _dao.save(project);

    message = '';
    status = PageStatus.normal;
    return project;
  }

  @action
  Future search(String value) async {
    message = 'Pesquisando...';
    status = PageStatus.loading;

    projects = await _dao.search(search: value);

    message = '';
    status = PageStatus.normal;
  }
}
