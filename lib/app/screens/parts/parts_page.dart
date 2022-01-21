import 'package:flutter/material.dart';
import 'package:flutter_barraginha/app/screens/map/map_page.dart';
import 'package:flutter_barraginha/app/screens/map/models/responses/map_response.dart';
import 'package:flutter_barraginha/app/screens/parts/controllers/part_controller.dart';
import 'package:flutter_barraginha/app/screens/parts/dialogs/update_rain_dialog.dart';
import 'package:flutter_barraginha/app/screens/projects/models/responses/project_list_response.dart';
import 'package:flutter_barraginha/app/shared/components/text_field_widget.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'components/item_info_widget.dart';
import 'components/item_part_widget.dart';

class PartsPage extends StatefulWidget {
  final ProjectListResponse project;
  const PartsPage(
    this.project, {
    Key? key,
  }) : super(key: key);

  @override
  _PartsPageState createState() => _PartsPageState();
}

class _PartsPageState extends State<PartsPage> {
  late PartController _controller;
  late TextEditingController _projectNameController;
  final partsScroll = ScrollController();

  @override
  void initState() {
    super.initState();

    _controller = PartController(widget.project.id);
    _projectNameController = TextEditingController(text: widget.project.title);
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
          child: SizedBox(
            height: 32,
            child: TextFieldWidget(
              controller: _projectNameController,
              textColor: const Color(0xFF666666),
              suffixIcon: const Icon(
                Icons.edit,
                size: 20.0,
                color: Color(0xFF666666),
              ),
              onSubmitted: _controller.updateTitleProject,
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
            height: 180,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 18.0),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Projeto',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
                const SizedBox(height: 8.0),
                Expanded(
                  child: Observer(
                    builder: (context) {
                      if (_controller.project == null) {
                        return Container();
                      }
                      final parts = _controller.project!.parts;
                      final rainVolume = _controller.project!.rainVolume;
                      return Row(
                        children: [
                          Flexible(
                            child: ItemInfoWidget(
                              title: 'Trechos',
                              value: parts.toString(),
                            ),
                          ),
                          const Expanded(
                            child: ItemInfoWidget(
                              title: 'Bolsões',
                              // TODO: Value total Bolsoes
                            ),
                          ),
                          Expanded(
                            child: ItemInfoWidget(
                              title: 'Volume de chuva',
                              value: rainVolume.toString(),
                              onEdit: () => _updateRainVolume(rainVolume),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 8.0),
              ],
            ),
          ),
          const Divider(
            color: Color(0xFFC0C0C0),
            thickness: 2,
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
                        return ListView.builder(
                          controller: partsScroll,
                          shrinkWrap: true,
                          itemCount: parts.length,
                          itemBuilder: (builder, i) {
                            return Observer(
                              builder: (ctx) {
                                final part = parts[i];
                                final calculate = part.calculateResponse;
                                return ItemPartWidget(
                                  part,
                                  title: 'Trecho ${i + 1}',
                                  calculate: calculate,
                                  onInfo: () {
                                    // TODO: Info Part
                                  },
                                  onEdit: () {
                                    // TODO: Edit Part
                                  },
                                  onCalculate: _controller.calculatePart,
                                );
                              },
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
    final project = _controller.project!;
    MapResponse map = MapResponse(
      idPart: null,
      idProject: project.id,
      rainVolume: project.rainVolume,
      roadWidth: 0.0,
    );

    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MapPage(map),
      ),
    );

    await _controller.loadAll();
  }

  void _updateRainVolume(num rainVolume) async {
    final result = await showDialog(
      context: context,
      builder: (ctx) => UpdateRainDialog(
        rainVolume.toString(),
      ),
    );
    if (result == null) return;

    await _controller.updateRainVolumeProject(result as double);
  }
}
