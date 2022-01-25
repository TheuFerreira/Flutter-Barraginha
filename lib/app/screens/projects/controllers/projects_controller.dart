import 'package:flutter_barraginha/app/shared/database/repositories/project_repository.dart';
import 'package:flutter_barraginha/app/shared/database/repositories/soil_type_repository.dart';
import 'package:flutter_barraginha/app/shared/database/responses/display_project_response.dart';
import 'package:flutter_barraginha/app/shared/enums/page_status.dart';
import 'package:mobx/mobx.dart';

part 'projects_controller.g.dart';

class ProjectsController = _ProjectControllerBase with _$ProjectsController;

abstract class _ProjectControllerBase with Store {
  @observable
  List<DisplayProjectResponse> projects =
      ObservableList<DisplayProjectResponse>();

  @observable
  PageStatus status = PageStatus.normal;

  @observable
  String message = '';

  @computed
  bool get isLoading => status == PageStatus.loading;

  final IProjectRepository _projectRepository = ProjectRepository();
  final ISoilTypeRepository _soilType = SoilTypeRepository();

  _ProjectControllerBase() {
    search('');
  }

  @action
  Future delete(DisplayProjectResponse project) async {
    project.status = 0;

    message = 'Deletando Projeto...';
    status = PageStatus.loading;

    await _projectRepository.save(project);

    message = '';
    status = PageStatus.normal;
  }

  @action
  Future<DisplayProjectResponse> add(
    DisplayProjectResponse project,
  ) async {
    message = 'Criando novo Projeto...';
    status = PageStatus.loading;

    project.date = DateTime.now();
    project.status = 1;

    final newProject = await _projectRepository.save(project);

    message = '';
    status = PageStatus.normal;
    return newProject;
  }

  Future update(DisplayProjectResponse project) async {
    message = 'Atualizando Projeto...';
    status = PageStatus.loading;

    await _projectRepository.save(project);

    message = '';
    status = PageStatus.normal;
  }

  @action
  Future search(String value) async {
    message = 'Pesquisando...';
    status = PageStatus.loading;

    projects = await _projectRepository.search(search: value);
    for (DisplayProjectResponse project in projects) {
      project.soilType = _soilType.getById(project.idSoilType!);
    }

    message = '';
    status = PageStatus.normal;
  }
}
