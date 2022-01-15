import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_barraginha/app/screens/map/controllers/options_controller.dart';
import 'package:flutter_barraginha/app/screens/map/dialogs/edit_marker_dialog.dart';
import 'package:flutter_barraginha/app/screens/map/enums/options_type.dart';
import 'package:flutter_barraginha/app/shared/enums/page_status.dart';
import 'package:flutter_barraginha/app/shared/services/dialog_service.dart';
import 'package:flutter_barraginha/app/shared/services/geolocator_service.dart';
import 'package:flutter_barraginha/app/shared/services/google_earth_service.dart';
import 'package:flutter_barraginha/app/shared/services/toast_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';

part 'map_controller.g.dart';

class MapController = _MapControllerBase with _$MapController;

abstract class _MapControllerBase with Store {
  @observable
  List<Marker> markers = ObservableList<Marker>();

  @observable
  CameraPosition? initialPosition;

  @observable
  PageStatus status = PageStatus.loading;

  OptionsController options = OptionsController();
  MarkerId? markerToMove;
  GoogleMapController? mapController;

  _MapControllerBase() {
    status = PageStatus.loading;
    getCurrentLocation();
  }

  Future getCurrentLocation() async {
    final position = await GeolocatorService().getCurrentLocation();
    if (position == null) {
      ToastService.show('Um problema aconteceu');
      return;
    }

    initialPosition = CameraPosition(
      target: LatLng(
        position.latitude,
        position.longitude,
      ),
      zoom: 15,
    );

    status = PageStatus.normal;
  }

  @action
  void clickMap(BuildContext context, LatLng position) {
    final selectedOption = options.selected;
    if (selectedOption == OptionsType.add) {
      addMarker(context, position);
    } else if (selectedOption == OptionsType.move) {
      moveMarker(position);
    }
  }

  void addMarker(BuildContext context, LatLng position) {
    if (markers.length == 2) {
      ToastService.show('Máximo de 2 Marcadores Adicionados!');
      return;
    }

    MarkerId markerId = MarkerId(position.toString());

    Marker marker = Marker(
      markerId: markerId,
      position: position,
      draggable: true,
      onTap: () {
        final selectedOption = options.selected;
        if (selectedOption == OptionsType.edit) {
          editMarker(context, markerId);
        } else if (selectedOption == OptionsType.delete) {
          deleteMarker(context, markerId);
        } else if (selectedOption == OptionsType.move) {
          markerToMove = markerId;
          ToastService.show('Clique em um marcador do mapa.');
        }
      },
    );

    markers.add(marker);
  }

  void editMarker(BuildContext context, MarkerId id) async {
    final index = _getIndexOfMarkerById(id);
    final oldPosition = markers[index].position;

    final newPosition = await showDialog<LatLng>(
      context: context,
      builder: (ctx) => EditMarkerDialog(oldPosition),
    );

    if (newPosition == null) {
      return;
    }

    markers[index] = markers[index].copyWith(positionParam: newPosition);
    mapController!.moveCamera(CameraUpdate.newLatLng(newPosition));
  }

  void deleteMarker(BuildContext context, MarkerId id) async {
    final result = await DialogService.showQuestionDialog(
      context,
      'Excluir marcador',
      'Tem certeza de que deseja excluir o marcador marcado?',
    );

    if (result == false) {
      return;
    }

    final index = _getIndexOfMarkerById(id);
    final marker = markers[index];
    markers.remove(marker);

    ToastService.show('Marcador excluido!!!');
  }

  Future moveMarker(LatLng position) async {
    if (markerToMove == null) {
      ToastService.show('Clique em um marcador primeiro!!!');
      return;
    }

    final index = _getIndexOfMarkerById(markerToMove!);
    markers[index] = markers[index].copyWith(positionParam: position);
    mapController!.moveCamera(CameraUpdate.newLatLng(position));
    markerToMove = null;
  }

  int _getIndexOfMarkerById(MarkerId id) {
    return markers.indexWhere(
      (element) => element.markerId == id,
    );
  }

  Future calculate() async {
    final start = markers[0];
    final end = markers[1];

    final altitudeA = await GoogleEarthService.getAltitude(start.position);
    final altitudeB = await GoogleEarthService.getAltitude(end.position);
    final distance = GeolocatorService()
        .getDistanceBetweenTwoPoints(start.position, end.position);

    final k = 1.25; // TODO: Tipo de solo;
    final le = 4; // TODO: Largura da estrada
    final i = 72; // TODO: Intensidade de chuva

    final dn = altitudeA! - altitudeB!;
    final dh = sqrt(pow(distance, 2) - pow(dn, 2));
    final d = (dn * 100) / dh;
    final eh = 45.18 * k * pow(d, -0.42);
    final ev = 0.4518 * k * pow(k, 0.58);
    final nBolsoesCalc = dh / eh;
    final nBolsoesAjust = nBolsoesCalc; // TODO: Arredondar
    final espBolsoes = distance / nBolsoesAjust;
    final ve = espBolsoes * le * i;
    final p = pow((ve / 6.52), 1 / 3);
    final r = 2.41 * p;
    final vb = 3.14 * pow(p, 2) * (r - (p / 3));

    // TODO: ERRORS
  }
}
