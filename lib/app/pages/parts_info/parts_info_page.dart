import 'package:flutter/material.dart';
import 'package:flutter_barraginha/app/pages/parts_info/components/card_border_component.dart';
import 'package:flutter_barraginha/app/pages/parts_info/components/card_dimension_component.dart';
import 'package:flutter_barraginha/app/pages/parts_info/components/text_component.dart';
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: Navigator.of(context).pop,
          color: Colors.black,
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Informações do Trecho',
              style: GoogleFonts.roboto(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              CardDimensionComponent(
                barrageNumber: '${info.barrageNumbersAdjusted}',
                distance: '${_formatNumberToBr(info.distance)}m',
                radius: 'Raio: ${_formatNumberToBr(info.radius)}m',
                depth: 'Profundidade: ${_formatNumberToBr(info.depth)}m',
                barrageVolume:
                    'Volume: ${_formatNumberToBr(info.barrageVolume)}m³',
              ),
              const SizedBox(height: 24),
              CardBorderComponent(
                icon: Icons.landscape,
                title: 'Terreno',
                children: [
                  Expanded(
                    child: TextComponent(
                      title: 'Solo',
                      description: '${info.soilType.text}',
                    ),
                  ),
                  Expanded(
                    child: TextComponent(
                      title: 'Declividade',
                      description: '${_formatNumberToBr(info.declivity)}m',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              CardBorderComponent(
                icon: Icons.location_on,
                title: 'Localização ponto 1',
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: TextComponent(
                                title: 'Latitude',
                                description: _formatNumberToBr(
                                  info.pointA.latitude!,
                                  maximumFractionDigits: 10,
                                ),
                              ),
                            ),
                            Expanded(
                              child: TextComponent(
                                title: 'Logitude',
                                description: _formatNumberToBr(
                                  info.pointA.longitude!,
                                  maximumFractionDigits: 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: TextComponent(
                                title: 'Altitude',
                                description:
                                    '${_formatNumberToBr(info.pointA.altitude!)}m',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              CardBorderComponent(
                icon: Icons.location_on,
                title: 'Localização ponto 2',
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: TextComponent(
                                title: 'Latitude',
                                description: _formatNumberToBr(
                                  info.pointB.latitude!,
                                  maximumFractionDigits: 10,
                                ),
                              ),
                            ),
                            Expanded(
                              child: TextComponent(
                                title: 'Logitude',
                                description: _formatNumberToBr(
                                  info.pointB.longitude!,
                                  maximumFractionDigits: 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: TextComponent(
                                title: 'Altitude',
                                description:
                                    '${_formatNumberToBr(info.pointB.altitude!)}m',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }

  String _formatNumberToBr(num n, {int? maximumFractionDigits}) {
    final numberFormat = NumberFormat.decimalPattern('pt-BR');
    if (maximumFractionDigits != null) {
      numberFormat.maximumFractionDigits = maximumFractionDigits;
    }

    return numberFormat.format(n);
  }
}
