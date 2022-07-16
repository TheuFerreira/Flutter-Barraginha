import 'package:flutter/material.dart';
import 'package:flutter_barraginha/app/pages/tutorial/tutorial_page.dart';
import 'package:flutter_barraginha/app/screens/parts/parts_page.dart';
import 'package:flutter_barraginha/app/screens/projects/dialogs/context_dialog.dart';
import 'package:flutter_barraginha/app/screens/projects/dialogs/save_project_dialog.dart';
import 'package:flutter_barraginha/app/shared/database/repositories/project_repository.dart';
import 'package:flutter_barraginha/app/shared/database/repositories/soil_type_repository.dart';
import 'package:flutter_barraginha/app/shared/database/responses/display_project_response.dart';
import 'package:flutter_barraginha/app/shared/enums/page_status.dart';
import 'package:flutter_barraginha/app/shared/services/dialog_service.dart';
import 'package:flutter_barraginha/app/shared/services/preferences_service.dart';
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

  final IPreferencesService _preferencesService = PreferencesService();
  final IProjectRepository _projectRepository = ProjectRepository();
  final ISoilTypeRepository _soilType = SoilTypeRepository();

  _ProjectControllerBase(BuildContext context) {
    _preferencesService.getShowTutorial().then((value) async {
      if (value) {
        await Navigator.of(context).push(
          MaterialPageRoute(builder: (ctx) => const TutorialPage()),
        );
      }
      search();
    });
  }

  @action
  Future addNewProject(
      BuildContext context, TextEditingController searchController) async {
    final result = await showDialog<DisplayProjectResponse?>(
      context: context,
      builder: (ctx) => SaveProjectDialog(
        DisplayProjectResponse(),
        title: 'Novo projeto',
      ),
    );

    if (result == null) {
      return;
    }

    final project = await _insertProject(result);

    toPartsPage(context, project, searchController);
  }

  Future<DisplayProjectResponse> _insertProject(
      DisplayProjectResponse project) async {
    message = 'Criando novo Projeto...';
    status = PageStatus.loading;

    project.date = DateTime.now();
    project.status = 1;

    final newProject = await _projectRepository.save(project);
    newProject.soilType = SoilTypeRepository().getById(newProject.idSoilType!);

    message = '';
    status = PageStatus.normal;

    return newProject;
  }

  Future toPartsPage(
    BuildContext context,
    DisplayProjectResponse project,
    TextEditingController searchController,
  ) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => PartsPage(project),
      ),
    );

    await search(value: searchController.text);
  }

  void showOptions(BuildContext context, DisplayProjectResponse project,
      TextEditingController searchController) {
    showDialog(
      context: context,
      builder: (BuildContext ctx) => ContextMenu(
        project: project,
        onEdit: (prj) => _editProject(ctx, prj, searchController),
        onDelete: (prj) => _deleteProject(context, prj, searchController),
      ),
    );
  }

  @action
  Future _editProject(
    BuildContext context,
    DisplayProjectResponse project,
    TextEditingController searchController,
  ) async {
    final result = await showDialog<DisplayProjectResponse?>(
      context: context,
      builder: (BuildContext ctx) => SaveProjectDialog(
        project,
        title: 'Editar projeto ${project.title}',
      ),
    );

    if (result == null) return;

    message = 'Atualizando Projeto...';
    status = PageStatus.loading;

    await _projectRepository.save(project);

    message = '';
    status = PageStatus.normal;

    await search(value: searchController.text);
  }

  @action
  Future _deleteProject(
    BuildContext context,
    DisplayProjectResponse project,
    TextEditingController searchController,
  ) async {
    final result = await DialogService.showQuestionDialog(
      context,
      'Excluir',
      'Deseja realmente excluir o projeto ${project.title}?',
    );

    if (!result) return;

    project.status = 0;

    message = 'Deletando Projeto...';
    status = PageStatus.loading;

    await _projectRepository.save(project);

    message = '';
    status = PageStatus.normal;

    await search(value: searchController.text);
  }

  @action
  Future search({String value = ''}) async {
    if (isLoading) {
      return;
    }

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
