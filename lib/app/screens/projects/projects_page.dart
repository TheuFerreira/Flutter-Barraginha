import 'package:flutter/material.dart';
import 'package:flutter_barraginha/app/screens/parts/parts_page.dart';
import 'package:flutter_barraginha/app/screens/projects/components/drawer_widget.dart';
import 'package:flutter_barraginha/app/screens/projects/controllers/projects_controller.dart';
import 'package:flutter_barraginha/app/screens/projects/dialogs/save_project_dialog.dart';
import 'package:flutter_barraginha/app/shared/components/loading_widget.dart';
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
              padding: const EdgeInsets.symmetric(horizontal: 64.0),
              child: Observer(
                builder: (_) => SizedBox(
                  height: 36,
                  child: TextFieldWidget(
                    controller: searchController,
                    suffixIcon: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    hintText: 'Pesquisar',
                    fillColor: const Color.fromARGB(50, 255, 255, 255),
                    textColor: Colors.white,
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
      builder: (context) => SaveProjectDialog(DisplayProjectResponse()),
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

  void _onLongPressItemProject(DisplayProjectResponse project) async {
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
