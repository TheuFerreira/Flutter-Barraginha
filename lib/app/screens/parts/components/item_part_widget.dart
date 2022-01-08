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
                        children: const [
                          Text(
                            'Tamanho',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Color(0xFF666666),
                            ),
                          ),
                          Text(
                            'Raio: 2m',
                            style: TextStyle(
                              height: 1.5,
                              fontSize: 16.0,
                              color: Color(0xFFA8A8A8),
                            ),
                          ),
                          Text(
                            'Profundidade: 2m',
                            style: TextStyle(
                              height: 1.5,
                              fontSize: 16.0,
                              color: Color(0xFFA8A8A8),
                            ),
                          ),
                          Text(
                            'Volume: 20000L',
                            style: TextStyle(
                              height: 1.5,
                              fontSize: 16.0,
                              color: Color(0xFFA8A8A8),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text(
                            'Bolsões',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Color(0xFF666666),
                            ),
                          ),
                          Text(
                            '6',
                            style: TextStyle(
                              height: 1.5,
                              fontSize: 16.0,
                              color: Color(0xFFA8A8A8),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Text(
                            'Distância',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Color(0xFF666666),
                            ),
                          ),
                          Text(
                            '200m',
                            style: TextStyle(
                              height: 1.5,
                              fontSize: 16.0,
                              color: Color(0xFFA8A8A8),
                            ),
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
