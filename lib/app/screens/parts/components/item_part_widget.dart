import 'package:flutter/material.dart';
import 'package:flutter_barraginha/app/screens/parts/models/responses/part_response.dart';
import 'package:flutter_barraginha/app/shared/components/loading_widget.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ItemPartWidget extends StatelessWidget {
  final PartResponse part;
  final String title;
  final CalculateResponse? calculate;
  final Function()? onInfo;
  final Function()? onEdit;
  final Function(PartResponse)? onCalculate;
  const ItemPartWidget(
    this.part, {
    Key? key,
    required this.title,
    required this.calculate,
    this.onInfo,
    this.onEdit,
    this.onCalculate,
  }) : super(key: key);

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
                        title,
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
                  Observer(
                    builder: (_) {
                      final state = part.state;
                      if (state == StateResponse.loading) {
                        return const LoadingWidget('Calculando...');
                      } else if (state == StateResponse.calculate) {
                        return ElevatedButton(
                          onPressed: () => onCalculate!(part),
                          child: const Text('Calcular'),
                        );
                      }
                      final calculate = part.calculateResponse!;
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
                onPressed: onEdit,
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