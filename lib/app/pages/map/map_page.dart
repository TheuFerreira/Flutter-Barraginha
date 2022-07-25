import 'package:flutter/material.dart';
import 'package:flutter_barraginha/app/pages/map/buttons_controller.dart';
import 'package:flutter_barraginha/app/pages/map/map_controller.dart';
import 'package:flutter_barraginha/app/pages/map/options_controller.dart';
import 'package:flutter_barraginha/app/components/loader.dart';
import 'package:flutter_barraginha/app/components/text_form_widget.dart';
import 'package:flutter_barraginha/domain/entities/display_part.dart';
import 'package:flutter_barraginha/app/utils/page_status.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  final DisplayPart part;
  const MapPage(
    this.part, {
    Key? key,
  }) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final _optionsController = OptionsController();
  late MapController _mapController;
  late ButtonsController _buttonsController;

  @override
  void initState() {
    super.initState();

    _mapController = MapController(context, widget.part, _optionsController);
    _buttonsController = ButtonsController(widget.part, _mapController);
  }

  @override
  void dispose() {
    if (_mapController.googleMapController != null) {
      _mapController.googleMapController!.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Observer(
        builder: (context) {
          final status = _mapController.status;
          if (status == PageStatus.loading) {
            return Container(
              color: Theme.of(context).colorScheme.primary,
              child: const Center(
                child: Loader(),
              ),
            );
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
                            elevation: 3,
                            clipBehavior: Clip.antiAlias,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(24),
                                bottomRight: Radius.circular(24),
                              ),
                            ),
                            child: Observer(
                              builder: (context) {
                                final markers = _mapController.markers;
                                final initialPosition =
                                    _mapController.initialPosition;

                                if (initialPosition == null) {
                                  // TODO: Error loading Google Maps
                                  return Container();
                                }

                                return GoogleMap(
                                  initialCameraPosition: initialPosition,
                                  mapType: MapType.terrain,
                                  markers: Set.from(markers),
                                  onMapCreated: (map) =>
                                      _mapController.googleMapController = map,
                                  onTap: (position) => _mapController.clickMap(
                                      context, position),
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
                                builder: (context) {
                                  final values = _optionsController.values;
                                  return ToggleButtons(
                                    fillColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                    color: Colors.white,
                                    selectedColor:
                                        Theme.of(context).colorScheme.primary,
                                    renderBorder: false,
                                    onPressed: _optionsController.onSelect,
                                    children: options,
                                    isSelected: values.map((e) => e).toList(),
                                  );
                                },
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
                height: 165,
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 24.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      height: 62,
                      child: Form(
                        key: _buttonsController.form,
                        child: TextFormWidget(
                          controller: _buttonsController.roadWithController,
                          labelText: 'Largura da Estrada em m',
                          errorText: 'Insira um valor',
                          fillColor: const Color.fromARGB(255, 255, 255, 255),
                          textColor: const Color(0xff666666),
                          keyboardType: TextInputType.number,
                          validator: _buttonsController.validateRoadWidth,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.close),
                          color: Theme.of(context).colorScheme.primary,
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () =>
                                _buttonsController.calculate(context),
                            child: const Text(
                              'Calcular',
                              style: TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.save_alt),
                          color: Theme.of(context).colorScheme.primary,
                          onPressed: () => _buttonsController.save(context),
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
}
