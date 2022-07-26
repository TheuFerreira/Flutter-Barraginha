import 'package:flutter/material.dart';
import 'package:flutter_barraginha/app/components/text_component.dart';

class CardDimensionComponent extends StatelessWidget {
  final String barrageNumber;
  final String distance;
  final String radius;
  final String depth;
  final String barrageVolume;
  const CardDimensionComponent({
    Key? key,
    required this.barrageNumber,
    required this.distance,
    required this.radius,
    required this.depth,
    required this.barrageVolume,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final headline5 = textTheme.headline5!.copyWith(
      color: Colors.white,
    );
    final headline3 = textTheme.headline3!.copyWith(
      color: Colors.white,
    );
    final subtitle1 = textTheme.subtitle1!.copyWith(
      color: const Color.fromARGB(255, 224, 224, 224),
    );
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Column(
              children: [
                Text(
                  'Dimensões',
                  style: headline3,
                ),
                const SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: TextComponent(
                        title: 'Nº de Bolsões',
                        titleStyle: headline5,
                        description: barrageNumber,
                        descriptionStyle: subtitle1,
                      ),
                    ),
                    Expanded(
                      child: TextComponent(
                        title: 'Distância entre Bolsões',
                        titleStyle: headline5,
                        description: distance,
                        descriptionStyle: subtitle1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                TextComponent(
                  title: 'Tamanho dos Bolsões',
                  titleStyle: headline5,
                  child: Column(
                    children: [
                      Text(
                        radius,
                        style: subtitle1,
                      ),
                      Text(
                        depth,
                        style: subtitle1,
                      ),
                      Text(
                        barrageVolume,
                        style: subtitle1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
