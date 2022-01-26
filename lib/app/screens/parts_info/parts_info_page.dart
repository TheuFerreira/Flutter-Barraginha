import 'package:flutter/material.dart';
import 'package:flutter_barraginha/Consts/app_colors.dart';
import 'package:flutter_barraginha/Consts/text_styles.dart';
import 'package:flutter_barraginha/app/shared/database/entities/info_part.dart';

class PartsInfoPage extends StatelessWidget {
  final InfoPart info;
  const PartsInfoPage(
    this.info, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(color: AppColors.primaryClor),
                child: SafeArea(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10, left: 10),
                            child: IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Center(
                            child: Text(
                              'Informações do Trecho',
                              style: TextStyles.title,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30, left: 20),
                        child: Text(
                          'Básico',
                          style: TextStyles.titleBold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Tamanho',
                                  style: TextStyles.titleNormal,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  'Raio: ${info.radius}m',
                                  style: TextStyles.textNormal,
                                  textAlign: TextAlign.left,
                                ),
                                const SizedBox(height: 3),
                                Text(
                                  'Profundidade: 21m', //TODO: trocar por parametro,
                                  style: TextStyles.textNormal,
                                  textAlign: TextAlign.left,
                                ),
                                const SizedBox(height: 3),
                                Text(
                                  'Volume: ${info.barrageVolume}L',
                                  style: TextStyles.textNormal,
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
                                style: TextStyles.titleNormal,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                '${info.barrageNumbersAdjusted}',
                                style: TextStyles.textNormal,
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
                                  style: TextStyles.titleNormal,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  '${info.distance}m',
                                  style: TextStyles.textNormal,
                                  textAlign: TextAlign.end,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Divider(),
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30, left: 20),
                        child: Text(
                          'Extra',
                          style: TextStyles.titleBold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Solo',
                                  style: TextStyles.titleNormal,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  'Tipo01', //TODO: trocar por parametro,
                                  style: TextStyles.textNormal,
                                  textAlign: TextAlign.left,
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'Declividade',
                                  style: TextStyles.titleNormal,
                                  textAlign: TextAlign.left,
                                ),
                                const SizedBox(height: 3),
                                Text(
                                  '2111m', //TODO: trocar por parametro,
                                  style: TextStyles.textNormal,
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
                                style: TextStyles.titleNormal,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'Ponto 1: ${info.pointA.altitude}m',
                                style: TextStyles.textNormal,
                              ),
                              Text(
                                'Ponto 2: ${info.pointB.altitude}m',
                                style: TextStyles.textNormal,
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
                                  style: TextStyles.titleNormal,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  'Ponto1',
                                  style: TextStyles.textNormal,
                                  textAlign: TextAlign.end,
                                ),
                                Text(
                                  'Lat: ${info.pointA.latitude}',
                                  style: TextStyles.textNormal,
                                  textAlign: TextAlign.end,
                                ),
                                Text(
                                  'Long: ${info.pointA.longitude}',
                                  style: TextStyles.textNormal,
                                  textAlign: TextAlign.end,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Ponto2',
                                  style: TextStyles.textNormal,
                                  textAlign: TextAlign.end,
                                ),
                                Text(
                                  'Lat: ${info.pointB.latitude}',
                                  style: TextStyles.textNormal,
                                  textAlign: TextAlign.end,
                                ),
                                Text(
                                  'Long: ${info.pointB.longitude}',
                                  style: TextStyles.textNormal,
                                  textAlign: TextAlign.end,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
