import 'package:flutter/material.dart';
import 'package:flutter_barraginha/app/screens/map/controllers/map_controller.dart';
import 'package:flutter_barraginha/app/screens/map/controllers/options_controller.dart';
import 'package:flutter_barraginha/app/shared/enums/page_status.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late MapController controller;
  final optionsController = OptionsController();

  @override
  void initState() {
    super.initState();

    controller = MapController();
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
                                  onTap: controller.addMarker,
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
                                  onPressed: optionsController.onSelect,
                                  children: options,
                                  isSelected: optionsController.values,
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
              ),
            ],
          );
        },
      ),
    );
  }
}

// TODO: Edit, Move and Delete marker
// TODO: Calculate button