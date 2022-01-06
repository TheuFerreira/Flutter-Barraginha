import 'package:flutter_barraginha/app/screens/projects/model/project_model.dart';
import 'package:flutter_barraginha/app/shared/models/page_status.dart';
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

  _ProjectControllerBase() {
    status = PageStatus.loading;
    message = 'Carregando...';

    // TODO: Load Projects from DB
    Future.delayed(const Duration(seconds: 5)).then((value) {
      reload();
    });
  }

  @action
  void reload() {
    oldProjects.add(ProjectModel(
        'Fazenda do Crocodilo', DateTime(2021, 5, 13), 22, 20,
        id: 1));
    oldProjects.add(
        ProjectModel('Avenida de SJE', DateTime(2020, 12, 20), 40, 10, id: 2));
    oldProjects.add(
        ProjectModel('Rua do Paulão', DateTime(2022, 01, 01), 20, 5, id: 3));
    oldProjects.add(ProjectModel(
        'Fazenda Jão Kisse', DateTime(2020, 09, 17), 50, 17,
        id: 4));
    oldProjects.add(
        ProjectModel('Rua da Igreja', DateTime(2022, 02, 28), 2, 2, id: 5));

    projects = oldProjects;
    status = PageStatus.normal;
    message = '';
  }

  @action
  Future delete(int index) async {
    message = 'Deletando Projeto...';
    status = PageStatus.loading;

    // TODO: Delete Project from DB
    await Future.delayed(const Duration(seconds: 3));

    oldProjects.removeAt(index);
    projects = oldProjects;

    message = '';
    status = PageStatus.normal;
  }

  @action
  Future add(ProjectModel project) async {
    message = 'Criando novo Projeto...';
    status = PageStatus.loading;

    // TODO: Add Project to DB
    await Future.delayed(const Duration(seconds: 3));
    oldProjects.insert(0, project);
    projects = oldProjects;

    message = '';
    status = PageStatus.normal;
  }

  @action
  void search(String value) {
    // TODO: Search Project in DB
    projects = oldProjects
        .where(
          (element) => element.title.contains(value),
        )
        .toList();
  }
}
