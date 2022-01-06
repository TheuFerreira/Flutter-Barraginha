import 'package:flutter/material.dart';
import 'package:flutter_barraginha/app/screens/projects/components/text_field_widget.dart';
import 'package:flutter_barraginha/app/screens/projects/controllers/projects_controller.dart';
import 'package:flutter_barraginha/app/screens/projects/model/project_model.dart';
import 'package:flutter_barraginha/app/shared/components/loading_widget.dart';
import 'package:flutter_barraginha/app/shared/components/question_dialog_widget.dart';
import 'package:flutter_barraginha/app/shared/models/page_status.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'components/custom_bar.dart';
import 'components/item_project_widget.dart';
import 'components/search_widget.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({Key? key}) : super(key: key);

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  final controller = ProjectsController();

  final _nameTextController = TextEditingController();
  final _volumeTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF439889),
        actions: [
          Builder(
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
                builder: (_) => SearchWidget(
                  onChanged: controller.isLoading ? null : controller.search,
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
      builder: (_) {
        return QuestionDialogWidget(
          title: 'Nome do projeto',
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFieldWidget(
                controller: _nameTextController,
                labelText: 'Nome do Projeto',
                hintText: 'Ex: Roça do Zé',
              ),
              const SizedBox(height: 16.0),
              TextFieldWidget(
                controller: _volumeTextController,
                labelText: 'Volume de Chuva',
                hintText: 'Ex: 22',
                textInputType: TextInputType.number,
              ),
            ],
          ),
        );
      },
    );

    if (result == null || result == false) {
      return;
    }

    final textRainVolume = _volumeTextController.text;
    final textName = _nameTextController.text.trim();
    if (textRainVolume.isEmpty || textName.isEmpty) {
      return;
    }

    final rainVolume = int.parse(textRainVolume);

    final project = ProjectModel(
      textName,
      DateTime.now(),
      rainVolume,
      0,
    );
    final response = await controller.add(project);
    if (response == null) {
      return;
    }

    _volumeTextController.text = '';
    _nameTextController.text = '';

    // TODO: Convert response to Project Model

    // TODO: Next Page
  }

  void _onLongPressItemProject(int i) async {
    final result = await showDialog(
      context: context,
      builder: (_) => QuestionDialogWidget(
        title: 'Excluir',
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Deseja Realmente Excluir?',
              style: TextStyle(
                color: Color(0xFF666666),
              ),
            ),
          ],
        ),
      ),
    );

    if (result == null || result == false) return;
    await controller.delete(i);
  }
}
