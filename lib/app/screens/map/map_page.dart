import 'package:flutter/material.dart';
import 'package:flutter_barraginha/app/screens/map/controllers/map_controller.dart';
import 'package:flutter_barraginha/app/screens/map/controllers/options_controller.dart';
import 'package:flutter_barraginha/app/screens/map/models/responses/map_response.dart';
import 'package:flutter_barraginha/app/shared/components/text_field_widget.dart';
import 'package:flutter_barraginha/app/shared/enums/page_status.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  final MapResponse map;
  const MapPage(
    this.map, {
    Key? key,
  }) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late MapController controller;
  late TextEditingController roadWithController;

  @override
  void initState() {
    super.initState();

    controller = MapController(context, widget.map);
    roadWithController =
        TextEditingController(text: widget.map.roadWidth.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Observer(
        builder: (context) {
          final status = controller.status;
          if (status == PageStatus.loading) {
            return const Text('Carregando');
          }

          return Column(
            children: [
              Expanded(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Column(
                      children: [
                        Expanded(
                          child: Card(
                            margin: const EdgeInsets.all(0),
                            color: Colors.white,
                            elevation: 6,
                            clipBehavior: Clip.antiAlias,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(24),
                                bottomRight: Radius.circular(24),
                              ),
                            ),
                            child: Observer(
                              builder: (context) {
                                final markers = controller.markers;
                                final initialPosition =
                                    controller.initialPosition!;

                                return GoogleMap(
                                  initialCameraPosition: initialPosition,
                                  mapType: MapType.terrain,
                                  markers: Set.from(markers),
                                  onMapCreated: (map) =>
                                      controller.mapController = map,
                                  onTap: (position) =>
                                      controller.clickMap(context, position),
                                );
                              },
                            ),
                          ),
                        ),
                        Stack(
                          children: const [
                            SizedBox(height: 30),
                          ],
                        ),
                      ],
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Observer(
                                builder: (context) => ToggleButtons(
                                  fillColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  color: Colors.white,
                                  selectedColor:
                                      Theme.of(context).colorScheme.primary,
                                  renderBorder: false,
                                  onPressed: controller.options.onSelect,
                                  children: options,
                                  isSelected: controller.options.values,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 150,
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 24.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 64.0),
                      height: 36,
                      child: TextFieldWidget(
                        controller: roadWithController,
                        hintText: 'Largura da Estrada',
                        fillColor: const Color.fromARGB(50, 255, 255, 255),
                        textColor: Colors.white,
                        keyboardType: TextInputType.number,
                        onChanged: (value) {},
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.close),
                          color: Colors.white,
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        ElevatedButton(
                          onPressed: _caculate,
                          child: const Text(
                            'Calcular',
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.settings),
                          color: Colors.white,
                          onPressed: () {
                            // TODO: Ontap Settings
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _caculate() {
    String roadWidthText = roadWithController.text.trim();
    double roadWidth = double.parse(roadWidthText);
    controller.calculate();
  }
}
