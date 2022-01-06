import 'package:flutter/material.dart';
import 'package:flutter_barraginha/app/shared/models/group_model.dart';

import 'components/custom_app_bar.dart';
import 'components/item_group_widget.dart';
import 'components/search_widget.dart';

class GroupsPage extends StatelessWidget {
  const GroupsPage({Key? key}) : super(key: key);

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
            middle: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 64.0),
              child: SearchWidget(),
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
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: groups.length,
              itemBuilder: (builder, i) {
                return ItemGroupWidget(groups[i]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
