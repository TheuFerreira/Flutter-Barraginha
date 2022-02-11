import 'package:flutter/material.dart';
import 'package:flutter_barraginha/app/screens/map/map_page.dart';
import 'package:flutter_barraginha/app/screens/parts/controllers/item_info_controller.dart';
import 'package:flutter_barraginha/app/screens/parts/controllers/part_controller.dart';
import 'package:flutter_barraginha/app/screens/parts_info/parts_info_page.dart';
import 'package:flutter_barraginha/app/shared/components/nothing_here_widget.dart';
import 'package:flutter_barraginha/app/shared/database/entities/info_part.dart';
import 'package:flutter_barraginha/app/shared/database/responses/display_part.dart';
import 'package:flutter_barraginha/app/shared/database/responses/display_project_response.dart';
import 'package:flutter_barraginha/app/shared/services/dialog_service.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'components/item_info_widget.dart';
import 'components/item_part_widget.dart';

class PartsPage extends StatefulWidget {
  final DisplayProjectResponse project;

  const PartsPage(
    this.project, {
    Key? key,
  }) : super(key: key);

  @override
  _PartsPageState createState() => _PartsPageState();
}

class _PartsPageState extends State<PartsPage> {
  late ItemInfoController _infoController;
  late PartController _controller;
  final partsScroll = ScrollController();

  @override
  void initState() {
    super.initState();

    _infoController = ItemInfoController(widget.project);
    _controller = PartController(widget.project.id!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close),
          color: Colors.black,
          onPressed: () => Navigator.pop(context),
        ),
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48.0),
          child: Text(
            widget.project.title ?? '',
            style: const TextStyle(
              fontSize: 24,
              color: Color(0xFF666666),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle),
            iconSize: 32,
            color: Theme.of(context).colorScheme.secondary,
            onPressed: _addPart,
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30.0),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text(
                    'Projeto',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
                const SizedBox(height: 0.0),
                Expanded(
                  child: Observer(
                    builder: (context) {
                      return Row(
                        children: [
                          Expanded(
                            child: ItemInfoWidget(
                              title: 'Trechos',
                              value: _infoController.countParts,
                            ),
                          ),
                          Expanded(
                            child: ItemInfoWidget(
                              title: 'Bolsões',
                              value: _infoController.countBarrage,
                            ),
                          ),
                          Expanded(
                            child: ItemInfoWidget(
                              title: 'Volume de chuva',
                              value: _infoController.rainVolume,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 2.0),
              ],
            ),
          ),
          const Divider(
            color: Color(0xFFC0C0C0),
            thickness: 1.5,
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              controller: partsScroll,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'Trechos',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Observer(
                      builder: (context) {
                        final parts = _controller.parts;
                        if (parts.isEmpty) {
                          return const NothingHereWidget();
                        }
                        return ListView.builder(
                          controller: partsScroll,
                          shrinkWrap: true,
                          itemCount: parts.length,
                          itemBuilder: (builder, i) {
                            final part = parts[i];
                            return ItemPartWidget(
                              widget.project,
                              part,
                              title: 'Trecho ${i + 1}',
                              onInfo: _onInfo,
                              onEdit: _editPart,
                              onLongPress: (part) => _onLongPressPart(part, i),
                              onCalculated: _controller.addBarrageNumber,
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _addPart() async {
    final project = widget.project;
    DisplayPart part = DisplayPart(
      idProject: project.id!,
    );

    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MapPage(part),
      ),
    );

    await _controller.loadAll(project.id!);
  }

  void _onInfo(InfoPart info) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (builder) => PartsInfoPage(info),
      ),
    );
  }

  void _editPart(DisplayPart part) async {
    final project = widget.project;
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MapPage(part),
      ),
    );

    await _controller.loadAll(project.id!);
  }

  void _onLongPressPart(DisplayPart part, int i) async {
    final result = await DialogService.showQuestionDialog(
      context,
      "Excluir",
      "Tem certeza de que deseja excluir o Trecho ${i + 1}?",
    );

    if (result == false) return;
    await _controller.delete(part);
    await _controller.loadAll(widget.project.id!);
  }
}
