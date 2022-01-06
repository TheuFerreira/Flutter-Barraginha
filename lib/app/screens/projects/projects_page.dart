import 'package:flutter/material.dart';
import 'package:flutter_barraginha/app/screens/projects/controllers/projects_controller.dart';
import 'package:flutter_barraginha/app/shared/components/loading_widget.dart';
import 'package:flutter_barraginha/app/shared/components/question_dialog.dart';
import 'package:flutter_barraginha/app/shared/models/page_status.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'components/custom_app_bar.dart';
import 'components/item_project_widget.dart';
import 'components/search_widget.dart';

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
      body: Column(
        children: [
          CustomAppBar(
            top: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.view_headline,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add_circle,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ],
            ),
            middle: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 64.0),
              child: SearchWidget(
                onChanged: controller.search,
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
                      onLongPress: () async {
                        final result = await QuestionDialog().show(
                          context,
                          title: 'Excluir',
                          description: 'Deseja Realmente Excluir?',
                        );

                        if (result == null || result == false) return;
                        controller.delete(i);
                      },
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
}
