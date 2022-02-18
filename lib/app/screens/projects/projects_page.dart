import 'package:flutter/material.dart';
import 'package:flutter_barraginha/app/screens/projects/controllers/projects_controller.dart';
import 'package:flutter_barraginha/app/shared/components/drawer_widget.dart';
import 'package:flutter_barraginha/app/shared/components/loading_widget.dart';
import 'package:flutter_barraginha/app/shared/components/nothing_here_widget.dart';
import 'package:flutter_barraginha/app/shared/components/text_field_widget.dart';
import 'package:flutter_barraginha/app/shared/database/responses/display_project_response.dart';
import 'package:flutter_barraginha/app/shared/enums/page_status.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'components/custom_bar.dart';
import 'components/item_project_widget.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({Key? key}) : super(key: key);

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  late ProjectsController controller;
  final searchController = TextEditingController();
  late DisplayProjectResponse project;

  @override
  void initState() {
    super.initState();

    controller = ProjectsController(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          IconButton(
            onPressed: () => controller.addNewProject(context, searchController),
            color: Colors.white,
            iconSize: 32,
            icon: const Icon(Icons.add_circle),
          ),
        ],
      ),
      body: Column(
        children: [
          CustomBar(
            top: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 30),
              child: SizedBox(
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
                  textColor: const Color(0xff666666),
                  onChanged: (value) => controller.search(value: value),
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
                        onTap: (project) => controller.toPartsPage(builder, project, searchController),
                        onLongPress: (project) => controller.showOptions(builder, project, searchController),
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
}
