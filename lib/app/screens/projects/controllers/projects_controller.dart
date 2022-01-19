import 'package:flutter_barraginha/app/screens/projects/models/requests/project_add_response.dart';
import 'package:flutter_barraginha/app/screens/projects/models/responses/project_list_response.dart';
import 'package:flutter_barraginha/app/screens/projects/usecases/project_add_usecases.dart';
import 'package:flutter_barraginha/app/screens/projects/usecases/project_list_usecases.dart';
import 'package:flutter_barraginha/app/screens/projects/usecases/project_remove_usecases.dart';
import 'package:flutter_barraginha/app/shared/enums/page_status.dart';
import 'package:flutter_barraginha/app/shared/models/soil_type_model.dart';
import 'package:mobx/mobx.dart';

part 'projects_controller.g.dart';

class ProjectsController = _ProjectControllerBase with _$ProjectsController;

abstract class _ProjectControllerBase with Store {
  @observable
  List<ProjectListResponse> projects = ObservableList<ProjectListResponse>();

  @observable
  PageStatus status = PageStatus.normal;

  @observable
  String message = '';

  @computed
  bool get isLoading => status == PageStatus.loading;

  _ProjectControllerBase() {
    search('');
  }

  @action
  Future delete(ProjectListResponse project) async {
    message = 'Deletando Projeto...';
    status = PageStatus.loading;

    await ProjectRemoveUsecases().delete(project);

    message = '';
    status = PageStatus.normal;
  }

  @action
  Future<ProjectListResponse> add(
    String title,
    double rainVolume,
    SoilTypeModel soilType,
  ) async {
    message = 'Criando novo Projeto...';
    status = PageStatus.loading;

    final project = ProjectAddResponse(
      title: title,
      date: DateTime.now(),
      rainVolume: rainVolume,
      idSoilType: soilType.id,
    );

    final newProject = await ProjectAddUsecases().add(project);

    message = '';
    status = PageStatus.normal;
    return newProject;
  }

  @action
  Future search(String value) async {
    message = 'Pesquisando...';
    status = PageStatus.loading;

    projects = await ProjectListUsecases().search(search: value);

    message = '';
    status = PageStatus.normal;
  }
}
