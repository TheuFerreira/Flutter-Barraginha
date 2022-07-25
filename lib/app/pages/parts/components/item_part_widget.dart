import 'package:flutter/material.dart';
import 'package:flutter_barraginha/app/pages/parts/item_part_controller.dart';
import 'package:flutter_barraginha/app/components/loading_widget.dart';
import 'package:flutter_barraginha/domain/entities/info_part.dart';
import 'package:flutter_barraginha/domain/entities/display_part.dart';
import 'package:flutter_barraginha/domain/entities/display_project_response.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';

class ItemPartWidget extends StatefulWidget {
  final DisplayProjectResponse project;
  final DisplayPart part;
  final String title;
  final Function(InfoPart)? onInfo;
  final Function(DisplayPart)? onEdit;
  final Function(DisplayPart part)? onLongPress;
  final Function(int barrageCount)? onCalculated;
  const ItemPartWidget(
    this.project,
    this.part, {
    Key? key,
    required this.title,
    this.onInfo,
    this.onEdit,
    this.onLongPress,
    this.onCalculated,
  }) : super(key: key);

  @override
  State<ItemPartWidget> createState() => _ItemPartWidgetState();
}

class _ItemPartWidgetState extends State<ItemPartWidget> {
  late ItemPartController _controller;

  @override
  void initState() {
    super.initState();

    _controller = ItemPartController(widget.project, widget.part);
    _controller.calculate().then((value) {
      if (value == false) {
        return;
      }

      int barrageNumber = _controller.info!.barrageNumbersAdjusted.toInt();
      widget.onCalculated!(barrageNumber);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 8.0,
      ),
      child: InkWell(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(24),
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        onLongPress: () => widget.onLongPress!(widget.part),
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
                            onPressed: () async {
                              final calculated = await _controller.calculate();
                              if (calculated == false) {
                                return;
                              }

                              int barrageNumber = _controller
                                  .info!.barrageNumbersAdjusted
                                  .toInt();
                              widget.onCalculated!(barrageNumber);
                            },
                            child: const Text('Calcular'),
                          );
                        }

                        final info = _controller.info!;
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
                                  'Raio: ${_formatNumberToBr(info.radius)}m',
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                                Text(
                                  'Profundidade: ${_formatNumberToBr(info.depth)}m',
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                                Text(
                                  'Volume: ${_formatNumberToBr(info.barrageVolume)}L',
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
                                  '${info.barrageNumbersAdjusted}',
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
                                  '${_formatNumberToBr(info.spacing)}m',
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
      ),
    );
  }

  String _formatNumberToBr(num n) =>
      NumberFormat.decimalPattern('pt-BR').format(n);
}
