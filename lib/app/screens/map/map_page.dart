import 'package:flutter/material.dart';
import 'package:flutter_barraginha/app/screens/map/controllers/map_controller.dart';
import 'package:flutter_barraginha/app/screens/map/controllers/options_controller.dart';
import 'package:flutter_barraginha/app/screens/parts_info/parts_info_page.dart';
import 'package:flutter_barraginha/app/shared/components/text_form_widget.dart';
import 'package:flutter_barraginha/app/shared/database/responses/display_part.dart';
import 'package:flutter_barraginha/app/shared/enums/page_status.dart';
import 'package:flutter_barraginha/app/shared/services/toast_service.dart';
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
  late MapController controller;
  late TextEditingController roadWithController;
  final roadWidthForm = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    controller = MapController(context, widget.part);
    roadWithController =
        TextEditingController(text: widget.part.roadWidth.toString());
  }

  @override
  void dispose() {
    controller.mapController!.dispose();
    super.dispose();
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
                height: 165,
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 24.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 64.0),
                      height: 62,
                      child: Form(
                        key: roadWidthForm,
                        child: TextFormWidget(
                          controller: roadWithController,
                          labelText: 'Estrada',
                          hintText: 'Largura da Estrada',
                          errorText: 'Insira um valor',
                          fillColor: const Color.fromARGB(50, 255, 255, 255),
                          textColor: Colors.white,
                          keyboardType: TextInputType.number,
                          validator: _validateRoadWidth,
                        ),
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
                          icon: const Icon(Icons.save_alt),
                          color: Colors.white,
                          onPressed: _save,
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

  String? _validateRoadWidth(String? value) {
    if (value == null) {
      return 'Insira um valor';
    } else if (value.isEmpty) {
      return 'O valor não pode estar em branco';
    } else {
      final result = double.tryParse(value.trim());
      if (result == null) {
        return 'Insira um valor válido';
      }
    }

    return null;
  }

  void _caculate() async {
    if (roadWidthForm.currentState!.validate() == false) {
      return;
    }

    String roadWidthText = roadWithController.text.trim();
    double roadWidth = double.parse(roadWidthText);

    final info = await controller.calculate(roadWidth);
    if (info == null) {
      ToastService.show("Houve um problema ao calcular");
      return;
    }

    ToastService.show("Calculado com sucesso");
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => PartsInfoPage(info),
      ),
    );
  }

  void _save() async {
    String roadWidthText = roadWithController.text.trim();
    double roadWidth = double.parse(roadWidthText);

    final result = await controller.save(roadWidth);
    if (result == false) return;

    Navigator.of(context).pop();
  }
}
