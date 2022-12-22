import 'package:flutter/material.dart';
import 'package:flutter_barraginha/app/pages/parts/parts_page.dart';
import 'package:flutter_barraginha/app/pages/projects/dialogs/context_dialog.dart';
import 'package:flutter_barraginha/app/pages/projects/dialogs/save_project_dialog.dart';
import 'package:flutter_barraginha/app/pages/tutorial/tutorial_page.dart';
import 'package:flutter_barraginha/domain/entities/display_project_response.dart';
import 'package:flutter_barraginha/app/utils/page_status.dart';
import 'package:flutter_barraginha/infra/services/dialog_service.dart';
import 'package:flutter_barraginha/domain/use_cases/add_new_project_case.dart';
import 'package:flutter_barraginha/domain/use_cases/get_show_tutorial_case.dart';
import 'package:flutter_barraginha/domain/use_cases/get_soil_type_by_id_case.dart';
import 'package:flutter_barraginha/domain/use_cases/search_projects_case.dart';
import 'package:flutter_barraginha/domain/use_cases/update_project_case.dart';
import 'package:flutter_barraginha/infra/services/geolocator_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
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

  final _getShowTutorialCase = Modular.get<GetShowTutorialCase>();
  final _addNewProjectCase = Modular.get<AddNewProjectCase>();
  final _updateProjectCase = Modular.get<UpdateProjectCase>();
  final _searchProjectsCase = Modular.get<SearchProjectsCase>();
  final _getSoilTypeByIdCase = Modular.get<GetSoilTypeByIdCase>();
  final IGeolocationService _geolocationService = GeolocatorService();

  _ProjectControllerBase(BuildContext context) {
    _getShowTutorialCase().then((value) async {
      if (value) {
        await Navigator.of(context).push(
          MaterialPageRoute(builder: (ctx) => const TutorialPage()),
        );
      }
      await _search();
    });
  }

  @action
  void addNewProject(
          BuildContext context, TextEditingController searchController) =>
      _addNewProject(context, searchController);
  Future _addNewProject(
      BuildContext context, TextEditingController searchController) async {
    final locationIsEnabled = await _enableLocation(context);
    if (!locationIsEnabled) {
      return;
    }

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

    final newProject = await _addNewProjectCase(project);

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

    await _search(value: searchController.text);
  }

  void showOptions(
    BuildContext context,
    DisplayProjectResponse project,
    TextEditingController searchController,
  ) {
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
    final locationIsEnabled = await _enableLocation(context);
    if (!locationIsEnabled) {
      return;
    }

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

    await _updateProjectCase(project);

    message = '';
    status = PageStatus.normal;

    await _search(value: searchController.text);
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

    await _updateProjectCase(project);

    message = '';
    status = PageStatus.normal;

    await _search(value: searchController.text);
  }

  @action
  void search({String value = ''}) => _search(value: value);
  Future _search({String value = ''}) async {
    if (isLoading) {
      return;
    }

    message = 'Pesquisando...';
    status = PageStatus.loading;

    projects = await _searchProjectsCase(search: value);
    for (DisplayProjectResponse project in projects) {
      project.soilType = _getSoilTypeByIdCase(project.idSoilType!);
    }

    message = '';
    status = PageStatus.normal;
  }

  Future<bool> _enableLocation(BuildContext context) async {
    final isLocationEnabled = await _geolocationService.isLocationEnabled();
    if (isLocationEnabled) {
      return true;
    }

    final result = await DialogService.showQuestionDialog(
      context,
      'GPS/Localização',
      'Para continuar, precisamos que você habilite o GPS/Localização do seu telefone!',
    );

    if (result != true) {
      return false;
    }

    _geolocationService.enableLocation();
    return true;
  }
}
