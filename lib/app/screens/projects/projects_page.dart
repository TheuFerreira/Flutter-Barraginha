import 'package:flutter/material.dart';
import 'package:flutter_barraginha/app/screens/parts/parts_page.dart';
import 'package:flutter_barraginha/app/screens/projects/components/drawer_widget.dart';
import 'package:flutter_barraginha/app/screens/projects/controllers/projects_controller.dart';
import 'package:flutter_barraginha/app/screens/projects/dialogs/context_dialog.dart';
import 'package:flutter_barraginha/app/screens/projects/dialogs/save_project_dialog.dart';
import 'package:flutter_barraginha/app/shared/components/loading_widget.dart';
import 'package:flutter_barraginha/app/shared/components/nothing_here_widget.dart';
import 'package:flutter_barraginha/app/shared/components/text_field_widget.dart';
import 'package:flutter_barraginha/app/shared/database/responses/display_project_response.dart';
import 'package:flutter_barraginha/app/shared/enums/page_status.dart';
import 'package:flutter_barraginha/app/shared/services/dialog_service.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'components/custom_bar.dart';
import 'components/item_project_widget.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({Key? key}) : super(key: key);

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  final controller = ProjectsController();
  final searchController = TextEditingController();
  late DisplayProjectResponse project;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          Observer(
            builder: (context) => IconButton(
              onPressed: controller.isLoading ? null : _onTapNewProject,
              color: Colors.white,
              iconSize: 32,
              icon: const Icon(Icons.add_circle),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          CustomBar(
            top: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 30),
              child: Observer(
                builder: (_) => SizedBox(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  child: TextFieldWidget(
                    controller: searchController,
                    suffixIcon: const Icon(
                      Icons.search,
                      color: Color(0xff666666),
                    ),
                    hintText: 'Pesquisar',
                    fillColor: const Color.fromARGB(255, 255, 255, 255),
                    textColor: Color(0xff666666),
                    onChanged: controller.isLoading ? null : controller.search,
                  ),
                ),
              ),
            ),
            bottom: Center(
              child: Text(
                'Meus Projetos',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Observer(
                builder: (_) {
                  final projects = controller.projects;
                  final status = controller.status;
                  final message = controller.message;

                  if (status == PageStatus.loading) {
                    return LoadingWidget(message);
                  } else if (projects.isEmpty) {
                    return const NothingHereWidget();
                  }

                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: projects.length,
                    itemBuilder: (builder, i) {
                      return ItemProjectWidget(
                        projects[i],
                        key: UniqueKey(),
                        onTap: _onTapItemProject,
                        onLongPress: _onLongPressItemProject,
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onTapNewProject() async {
    final result = await showDialog<DisplayProjectResponse?>(
      context: context,
      builder: (context) => SaveProjectDialog(
        DisplayProjectResponse(),
        title: 'Novo projeto',
      ),
    );

    if (result == null) {
      return;
    }

    final project = await controller.add(result);

    searchController.text = '';

    _onTapItemProject(project);
  }

  void _onTapItemProject(DisplayProjectResponse project) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => PartsPage(project),
      ),
    );

    await controller.search(searchController.text);
  }

  void _onLongPressItemProject(DisplayProjectResponse project) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ContextMenu(
          project: project,
          onEdit: onEdit,
          onDelete: onDelete,
        );
      },
    );
  }

  void onEdit(DisplayProjectResponse project) async {
    final result = await showDialog<DisplayProjectResponse?>(
      context: context,
      builder: (BuildContext context) => SaveProjectDialog(
        project,
        title: 'Editar projeto ${project.title}',
      ),
    );

    if (result == null) return;

    await controller.update(result);
    await controller.search(searchController.text);
  }

  void onDelete(DisplayProjectResponse project) async {
    final result = await DialogService.showQuestionDialog(
      context,
      'Excluir',
      'Deseja realmente excluir o projeto ${project.title}?',
    );

    if (!result) return;

    await controller.delete(project);
    await controller.search(searchController.text);
  }
}
