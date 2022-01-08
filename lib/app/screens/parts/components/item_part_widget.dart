import 'package:flutter/material.dart';

class ItemPartWidget extends StatelessWidget {
  const ItemPartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
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
                        'Trecho 1',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      IconButton(
                        icon: const Icon(Icons.info),
                        iconSize: 32,
                        color: const Color(0xFF666666),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
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
                            'Raio: 2m',
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          Text(
                            'Profundidade: 2m',
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          Text(
                            'Volume: 20000L',
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
                            '6',
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
                            '200m',
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
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
