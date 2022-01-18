import 'package:flutter/material.dart';
import 'package:flutter_barraginha/app/shared/models/part_model.dart';
import 'package:flutter_barraginha/app/shared/services/calculator_service.dart';

class ItemPartWidget extends StatefulWidget {
  final PartModel part;
  final String title;
  final Function()? onInfo;
  final Function()? onEdit;
  const ItemPartWidget(
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
  Map<String, dynamic>? map = {};
  @override
  void initState() {
    super.initState();

    final part = widget.part;
    final start = part.points[0];
    final end = part.points[1];
    final roadWidth = part.roadWidth!;
    final soilType = 1.25; // TODO: Mudar
    final rainVolume = 0.125; // TODO: Mudar
    CalculatorService.calculate(
      start: start.position,
      end: end.position,
      soilType: soilType,
      roadWidth: roadWidth,
      rainVolume: rainVolume,
    ).then(
      (value) => map = value,
    );
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
                      IconButton(
                        icon: const Icon(Icons.info),
                        iconSize: 24,
                        color: const Color(0xFF666666),
                        onPressed: () {
                          // TODO: Info
                        },
                      ),
                    ],
                  ),
                  if (map != null)
                    Row(
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
                              'Raio: ${map!['radius']}m',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            Text(
                              'Profundidade: ${map!['depth']}m',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            Text(
                              'Volume: ${map!['barrageVolume']}m³',
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
                              '${map!['barrageNumbersAdjusted']}',
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
                              '${map!['spacing']}m',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ],
                        ),
                      ],
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
                onPressed: widget.onEdit,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
showDialog(
                            context: context,
                            builder: (ctx) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const SizedBox(height: 16.0),
                                    Text(
                                      widget.title,
                                      style:
                                          Theme.of(context).textTheme.headline3,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0,
                                        vertical: 32.0,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Básico',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline3,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Tamanho',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline5,
                                                      ),
                                                      Text(
                                                        'Raio: ${map!['radius']}m',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .subtitle1,
                                                      ),
                                                      Text(
                                                        'Profundidade: ${map!['depth']}m',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .subtitle1,
                                                      ),
                                                      Text(
                                                        'Volume: ${map!['barrageVolume']}m³',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .subtitle1,
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        'Distância',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline5,
                                                      ),
                                                      Text(
                                                        '${map!['spacing']}m',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .subtitle1,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Bolsões',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline5,
                                                  ),
                                                  Text(
                                                    '${map!['barrageNumbersAdjusted']}',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .subtitle1,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Text(
                                                'Extra',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline3,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Solo',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline5,
                                                      ),
                                                      Text(
                                                        'Tipo de solo', // TODO: Tipo de Solo
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .subtitle1,
                                                      ),
                                                      Text(
                                                        'Declividade',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline5,
                                                      ),
                                                      Text(
                                                        '${map!['declivity']}m',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .subtitle1,
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    children: [
                                                      Text(
                                                        'Altitude',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline5,
                                                      ),
                                                      Text(
                                                        'Ponto 1: ${map!['altitudeA']}m',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .subtitle1,
                                                      ),
                                                      Text(
                                                        'Ponto 2: ${map!['altitudeB']}m',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .subtitle1,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Coordenadas',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline5,
                                                  ),
                                                  Text(
                                                    'Ponto 1: ${map!['spacing']}m', // TODO: Coordenada
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .subtitle1,
                                                  ),
                                                  Text(
                                                    'Ponto 2: ${map!['spacing']}m', // TODO: Coordenada
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .subtitle1,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Material(
                                            clipBehavior: Clip.hardEdge,
                                            shape: const RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                bottom: Radius.circular(16.0),
                                              ),
                                            ),
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            child: InkWell(
                                              onTap: () {},
                                              child: const Padding(
                                                padding: EdgeInsets.all(12.0),
                                                child: Center(
                                                  child: Text(
                                                    'Ok',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16.0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                        
*/