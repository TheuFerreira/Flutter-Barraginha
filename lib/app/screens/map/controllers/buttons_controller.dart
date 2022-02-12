import 'package:flutter/material.dart';
import 'package:flutter_barraginha/app/screens/map/controllers/map_controller.dart';
import 'package:flutter_barraginha/app/shared/database/entities/point.dart';
import 'package:flutter_barraginha/app/shared/database/repositories/part_repository.dart';
import 'package:flutter_barraginha/app/shared/database/responses/display_part.dart';
import 'package:flutter_barraginha/app/shared/services/toast_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';

part 'buttons_controller.g.dart';

class ButtonsController = _ButtonsControllerBase with _$ButtonsController;

abstract class _ButtonsControllerBase with Store {
  final form = GlobalKey<FormState>();
  final roadWithController = TextEditingController();

  final DisplayPart _part;
  final MapController _mapController;
  final IPartRepository _partRepository = PartRepository();

  _ButtonsControllerBase(this._part, this._mapController) {
    if (_part.id != null) {
      roadWithController.text = _part.roadWidth.toString();
    }
  }

  String? validateRoadWidth(String? value) {
    if (value == null || value.isEmpty) {
      return 'Insira um valor';
    } else {
      String text = value.trim().replaceAll(',', '.');
      final result = double.tryParse(text);
      if (result == null) {
        return 'Insira um valor válido';
      }
    }
    return null;
  }

  void calculate() {
    if (form.currentState!.validate() == false) {
      return;
    }

    if (_mapController.markers.length < 2) {
      ToastService.show('Insira 2 pontos para calcular!');
      return;
    }

    String text = roadWithController.text.trim().replaceAll(',', '.');
    final roadWidth = double.parse(text);

    // TODO: Calculate and Save
    /*status = PageStatus.loading;
    final markerStart = markers[0];
    final markerEnd = markers[1];

    Point start = Point(
      latitude: markerStart.position.latitude,
      longitude: markerStart.position.longitude,
    );

    Point end = Point(
      latitude: markerEnd.position.latitude,
      longitude: markerEnd.position.longitude,
    );

    if (_part.points.isEmpty) {
      _part.points.add(start);
      _part.points.add(end);
    } else {
      _part.points[0] = start;
      _part.points[1] = end;
    }

    final project = await ProjectRepository().getById(_part.idProject!);
    project.soilType = SoilTypeRepository().getById(project.idSoilType!);

    final result = await CalculatorService.calculate(
      start: Point.copy(_part.points[0]),
      end: Point.copy(_part.points[1]),
      soilType: project.soilType!,
      roadWidth: roadWidth,
      rainVolume: project.rainVolume!,
    );

    if (result == null) {
      return null;
    }

    _part.points[0].altitude = result.pointA.altitude;
    _part.points[1].altitude = result.pointB.altitude;

    await _partRepository.save(_part);

    status = PageStatus.normal;
    return result;*/
  }

  Future save(BuildContext context) async {
    if (form.currentState!.validate() == false) {
      return;
    }

    List<Marker> markers = _mapController.markers;
    if (markers.length < 2) {
      ToastService.show('Insira 2 pontos para salvar!');
      return;
    }

    String text = roadWithController.text.trim().replaceAll(',', '.');
    _part.roadWidth = double.parse(text);

    final startPoint = Point(
      latitude: markers[0].position.latitude,
      longitude: markers[0].position.longitude,
    );

    final endPoint = Point(
      latitude: markers[1].position.latitude,
      longitude: markers[1].position.longitude,
    );

    if (_part.points.isEmpty) {
      _part.points.add(startPoint);
      _part.points.add(endPoint);
    } else {
      _part.points[0].latitude = startPoint.latitude;
      _part.points[0].longitude = startPoint.longitude;

      _part.points[1].latitude = endPoint.latitude;
      _part.points[1].longitude = endPoint.longitude;
    }

    await _partRepository.save(_part);

    ToastService.show('Trecho salvo com sucesso.');
    Navigator.pop(context, true);
  }
}
