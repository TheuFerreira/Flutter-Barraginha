import 'package:flutter/material.dart';
import 'package:flutter_barraginha/app/screens/parts/controllers/item_controller.dart';
import 'package:flutter_barraginha/app/shared/database/entities/info_part.dart';
import 'package:flutter_barraginha/app/shared/components/loading_widget.dart';
import 'package:flutter_barraginha/app/shared/database/responses/display_part.dart';
import 'package:flutter_barraginha/app/shared/database/responses/display_project_response.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ItemPartWidget extends StatefulWidget {
  final DisplayProjectResponse project;
  final DisplayPart part;
  final String title;
  final Function(InfoPart)? onInfo;
  final Function(DisplayPart)? onEdit;
  const ItemPartWidget(
    this.project,
    this.part, {
    Key? key,
    required this.title,
    this.onInfo,
    this.onEdit,
  }) : super(key: key);

  @override
  State<ItemPartWidget> createState() => _ItemPartWidgetState();
}

class _ItemPartWidgetState extends State<ItemPartWidget> {
  late ItemController _controller;

  @override
  void initState() {
    super.initState();

    _controller = ItemController(widget.project, widget.part);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 8.0,
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12.0,
                horizontal: 16.0,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.title,
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      Observer(
                        builder: (_) {
                          final state = _controller.state;

                          return IconButton(
                            icon: const Icon(Icons.info),
                            iconSize: 24,
                            color: const Color(0xFF666666),
                            onPressed: state != StateItem.none
                                ? null
                                : () => widget.onInfo!(_controller.info!),
                          );
                        },
                      ),
                    ],
                  ),
                  Observer(
                    builder: (_) {
                      final state = _controller.state;
                      if (state == StateItem.loading) {
                        return const LoadingWidget('Calculando...');
                      } else if (state == StateItem.calculate) {
                        return ElevatedButton(
                          onPressed: _controller.calculate,
                          child: const Text('Calcular'),
                        );
                      }

                      final calculate = _controller.info!;

                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Tamanho',
                                style: Theme.of(context).textTheme.headline5,
                              ),
                              Text(
                                'Raio: ${calculate.radius}m',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              Text(
                                'Profundidade: ${calculate.depth}m',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              Text(
                                'Volume: ${calculate.barrageVolume}m³',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Bolsões',
                                style: Theme.of(context).textTheme.headline5,
                              ),
                              Text(
                                '${calculate.barrageNumbersAdjusted}',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Distância',
                                style: Theme.of(context).textTheme.headline5,
                              ),
                              Text(
                                '${calculate.spacing}m',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                icon: const Icon(Icons.arrow_forward),
                iconSize: 32,
                color: const Color(0xFF00695C),
                onPressed: () => widget.onEdit!(widget.part),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
