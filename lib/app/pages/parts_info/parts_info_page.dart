import 'package:flutter/material.dart';
import 'package:flutter_barraginha/domain/entities/info_part.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class PartsInfoPage extends StatelessWidget {
  final InfoPart info;
  const PartsInfoPage(
    this.info, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 160,
            color: Theme.of(context).colorScheme.primary,
            padding: const EdgeInsets.only(bottom: 20),
            child: Center(
              child: Text(
                'Informações do Trecho',
                style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 25,
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30, left: 20),
                        child: Text(
                          'Básico',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Tamanho',
                                style: Theme.of(context).textTheme.headline5,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'Raio: ${_formatNumberToBr(info.radius)}m',
                                style: Theme.of(context).textTheme.subtitle1,
                                textAlign: TextAlign.left,
                              ),
                              const SizedBox(height: 3),
                              Text(
                                'Profundidade: ${_formatNumberToBr(info.depth)}m',
                                style: Theme.of(context).textTheme.subtitle1,
                                textAlign: TextAlign.left,
                              ),
                              const SizedBox(height: 3),
                              Text(
                                'Volume: ${_formatNumberToBr(info.barrageVolume)}L',
                                style: Theme.of(context).textTheme.subtitle1,
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              'Bolsões',
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              '${info.barrageNumbersAdjusted}',
                              style: Theme.of(context).textTheme.subtitle1,
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Distância',
                                style: Theme.of(context).textTheme.headline5,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                '${_formatNumberToBr(info.distance)}m',
                                style: Theme.of(context).textTheme.subtitle1,
                                textAlign: TextAlign.end,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30, left: 20),
                        child: Text(
                          'Extra',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Solo',
                                style: Theme.of(context).textTheme.headline5,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                '${info.soilType.text}',
                                style: Theme.of(context).textTheme.subtitle1,
                                textAlign: TextAlign.left,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Declividade',
                                style: Theme.of(context).textTheme.headline5,
                                textAlign: TextAlign.left,
                              ),
                              const SizedBox(height: 3),
                              Text(
                                '${_formatNumberToBr(info.declivity)}m',
                                style: Theme.of(context).textTheme.subtitle1,
                                textAlign: TextAlign.left,
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              'Altitude',
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Ponto 1: ${_formatNumberToBr(info.pointA.altitude!)}m',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            Text(
                              'Ponto 2: ${_formatNumberToBr(info.pointB.altitude!)}m',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Coordenadas',
                                style: Theme.of(context).textTheme.headline5,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'Ponto1',
                                style: Theme.of(context).textTheme.subtitle1,
                                textAlign: TextAlign.end,
                              ),
                              Text(
                                'Lat: ${_formatNumberToBr(info.pointA.latitude!)}',
                                style: Theme.of(context).textTheme.subtitle1,
                                textAlign: TextAlign.end,
                              ),
                              Text(
                                'Long: ${_formatNumberToBr(info.pointA.longitude!)}',
                                style: Theme.of(context).textTheme.subtitle1,
                                textAlign: TextAlign.end,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Ponto2',
                                style: Theme.of(context).textTheme.subtitle1,
                                textAlign: TextAlign.end,
                              ),
                              Text(
                                'Lat: ${_formatNumberToBr(info.pointB.latitude!)}',
                                style: Theme.of(context).textTheme.subtitle1,
                                textAlign: TextAlign.end,
                              ),
                              Text(
                                'Long: ${_formatNumberToBr(info.pointB.longitude!)}',
                                style: Theme.of(context).textTheme.subtitle1,
                                textAlign: TextAlign.end,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatNumberToBr(num n) =>
      NumberFormat.decimalPattern('pt-BR').format(n);
}
