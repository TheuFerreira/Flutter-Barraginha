import 'package:flutter_barraginha/app/screens/projects/model/project_model.dart';
import 'package:flutter_barraginha/app/shared/models/page_status.dart';
import 'package:mobx/mobx.dart';

part 'projects_controller.g.dart';

class ProjectsController = _ProjectControllerBase with _$ProjectsController;

abstract class _ProjectControllerBase with Store {
  @observable
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

    Future.delayed(const Duration(seconds: 5)).then((value) {
      reload();
    });
  }

  @action
  void reload() {
    oldProjects
        .add(ProjectModel('Fazenda do Crocodilo', DateTime(2021, 5, 13), 20));
    oldProjects.add(ProjectModel('Avenida de SJE', DateTime(2020, 12, 20), 10));
    oldProjects.add(ProjectModel('Rua do Paulão', DateTime(2022, 01, 01), 5));
    oldProjects
        .add(ProjectModel('Fazenda Jão Kisse', DateTime(2020, 09, 17), 17));
    oldProjects.add(ProjectModel('Rua da Igreja', DateTime(2022, 02, 28), 2));

    projects = oldProjects;
    status = PageStatus.normal;
    message = '';
  }

  @action
  Future delete(int index) async {
    message = 'Deletando Projeto...';
    status = PageStatus.loading;

    await Future.delayed(const Duration(seconds: 3));

    oldProjects.removeAt(index);
    projects.removeAt(index);

    message = '';
    status = PageStatus.normal;
  }

  @action
  void search(String value) {
    projects = oldProjects
        .where(
          (element) => element.title.contains(value),
        )
        .toList();
  }
}
