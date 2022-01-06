import 'package:flutter/material.dart';
import 'package:flutter_barraginha/app/screens/groups/controllers/groups_controller.dart';
import 'package:flutter_barraginha/app/shared/components/loading_widget.dart';
import 'package:flutter_barraginha/app/shared/components/question_dialog.dart';
import 'package:flutter_barraginha/app/shared/models/page_status.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'components/custom_app_bar.dart';
import 'components/item_group_widget.dart';
import 'components/search_widget.dart';

class GroupsPage extends StatefulWidget {
  const GroupsPage({Key? key}) : super(key: key);

  @override
  State<GroupsPage> createState() => _GroupsPageState();
}

class _GroupsPageState extends State<GroupsPage> {
  final controller = GroupsController();

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
                final groups = controller.groups;
                final status = controller.status;
                final message = controller.message;

                if (status == PageStatus.loading) {
                  return LoadingWidget(message);
                }

                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: groups.length,
                  itemBuilder: (builder, i) {
                    return ItemGroupWidget(
                      groups[i],
                      key: UniqueKey(),
                      onLongPress: () async {
                        final result = await QuestionDialog().show(
                          context,
                          title: 'Excluir',
                          description: 'Deseja Realmente Excluir?',
                        );

                        if (result == null || result == false) return;
                        controller.deleteGroup(i);
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
