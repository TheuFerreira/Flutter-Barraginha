import 'package:flutter/material.dart';
import 'package:flutter_barraginha/app/screens/projects/components/drawer_widget.dart';
import 'package:flutter_barraginha/app/screens/projects/controllers/projects_controller.dart';
import 'package:flutter_barraginha/app/screens/projects/dialogs/add_dialog_widget.dart';
import 'package:flutter_barraginha/app/screens/projects/model/project_model.dart';
import 'package:flutter_barraginha/app/shared/components/loading_widget.dart';
import 'package:flutter_barraginha/app/shared/components/text_field_widget.dart';
import 'package:flutter_barraginha/app/shared/models/page_status.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF439889),
        actions: [
          Observer(
            builder: (context) => IconButton(
              onPressed: controller.isLoading ? null : _onTapNewProject,
              icon: const Icon(
                Icons.add_circle,
                color: Colors.white,
              ),
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
            bottom: const Center(
              child: Text(
                'Meus Projetos',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Flexible(
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
                      onLongPress: () => _onLongPressItemProject(i),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _onTapNewProject() async {
    final result = await showDialog(
      context: context,
      builder: (context) => AddDialogWidget(),
    );

    if (result == null) {
      return;
    }

    final response = await controller.add(result as ProjectModel);
    if (response == null) {
      return;
    }

    // TODO: Next Page
  }

  void _onLongPressItemProject(int i) async {
    final result = await DialogService.showQuestionDialog(
      context,
      'Excluir',
      'Deseja Realmente Excluir?',
    );

    if (!result) return;
    await controller.delete(i);
  }
}
