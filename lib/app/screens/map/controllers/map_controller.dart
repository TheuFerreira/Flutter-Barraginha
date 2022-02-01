import 'package:flutter/material.dart';
import 'package:flutter_barraginha/app/screens/map/controllers/options_controller.dart';
import 'package:flutter_barraginha/app/screens/map/dialogs/edit_marker_dialog.dart';
import 'package:flutter_barraginha/app/screens/map/enums/options_type.dart';
import 'package:flutter_barraginha/app/shared/database/entities/point.dart';
import 'package:flutter_barraginha/app/shared/database/repositories/part_repository.dart';
import 'package:flutter_barraginha/app/shared/database/responses/display_part.dart';
import 'package:flutter_barraginha/app/shared/enums/page_status.dart';
import 'package:flutter_barraginha/app/shared/services/dialog_service.dart';
import 'package:flutter_barraginha/app/shared/services/geolocator_service.dart';
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
  final DisplayPart _part;
  final IPartRepository _partRepository = PartRepository();

  _MapControllerBase(BuildContext context, this._part) {
    status = PageStatus.loading;
    if (_part.id == null) {
      getCurrentLocation();
    } else {
      _loadPositions(context);
    }
  }

  @action
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

  Future _loadPositions(BuildContext context) async {
    final pos1 = LatLng(
      _part.points[0].latitude!.toDouble(),
      _part.points[0].longitude!.toDouble(),
    );

    final pos2 = LatLng(
      _part.points[1].latitude!.toDouble(),
      _part.points[1].longitude!.toDouble(),
    );

    addMarker(context, pos1);
    addMarker(context, pos2);

    initialPosition = CameraPosition(
      target: pos1,
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

  @action
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
          ToastService.show('Clique em um ponto do mapa.');
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

    /*_map.coordinate1 = CoordinateResponse(
      latitude: start.position.latitude,
      longitude: start.position.longitude,
    );

    _map.coordinate2 = CoordinateResponse(
      latitude: end.position.latitude,
      longitude: end.position.longitude,
    );*/

    final soilType = 1.25; // TODO: Tipo de solo;
    final rainVolume = 72.0; // TODO: Intensidade de chuva

    /*await CalculatorService.calculate(
      start: start.position,
      end: end.position,
      rainVolume: rainVolume,
      roadWidth: roadWidth,
      soilType: soilType,
    );*/
  }

  Future save(double roadWidth) async {
    if (markers.isEmpty || markers.length > 2) {
      ToastService.show('Insira 2 pontos para salvar!');
      return;
    }
    final start = markers[0];
    final end = markers[1];

    _part.roadWidth = roadWidth;

    if (_part.points.isEmpty) {
      Point pointA = Point(
        latitude: start.position.latitude,
        longitude: start.position.longitude,
      );

      Point pointB = Point(
        latitude: end.position.latitude,
        longitude: end.position.longitude,
      );

      _part.points.add(pointA);
      _part.points.add(pointB);
    } else {
      _part.points[0].latitude = start.position.latitude;
      _part.points[0].longitude = start.position.longitude;

      _part.points[1].latitude = end.position.latitude;
      _part.points[1].longitude = end.position.longitude;
    }

    await _partRepository.save(_part);
  }
}
