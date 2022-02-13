import 'package:flutter/material.dart';
import 'package:flutter_barraginha/app/screens/map/controllers/map_controller.dart';
import 'package:flutter_barraginha/app/screens/map/dialogs/calculating_dialog.dart';
import 'package:flutter_barraginha/app/shared/database/entities/point.dart';
import 'package:flutter_barraginha/app/shared/database/repositories/part_repository.dart';
import 'package:flutter_barraginha/app/shared/database/repositories/project_repository.dart';
import 'package:flutter_barraginha/app/shared/database/repositories/soil_type_repository.dart';
import 'package:flutter_barraginha/app/shared/database/responses/display_part.dart';
import 'package:flutter_barraginha/app/shared/services/calculator_service.dart';
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
  final IProjectRepository _projectRepository = ProjectRepository();
  final ISoilTypeRepository _soilTypeRepository = SoilTypeRepository();

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

  Future calculate(BuildContext context) async {
    if (form.currentState!.validate() == false) {
      return;
    }

    List<Marker> markers = _mapController.markers;
    if (markers.length < 2) {
      ToastService.show('Insira 2 pontos para calcular!');
      return;
    }

    _updateRoadWidth();
    _generatePoints(markers);

    final project = await _projectRepository.getById(_part.idProject!);
    project.soilType = _soilTypeRepository.getById(project.idSoilType!);

    CalculatingDialog.show(context);

    final result = await CalculatorService.calculate(
      start: Point.copy(_part.points[0]),
      end: Point.copy(_part.points[1]),
      soilType: project.soilType!,
      roadWidth: _part.roadWidth!,
      rainVolume: project.rainVolume!,
    );

    if (result == null) {
      ToastService.show("Houve um problema ao calcular");
      return;
    }

    CalculatingDialog.close(context);

    _part.points[0].altitude = result.pointA.altitude;
    _part.points[1].altitude = result.pointB.altitude;

    await _partRepository.save(_part);

    ToastService.show("Calculado com sucesso");
    Navigator.pop(context, true);
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

    _updateRoadWidth();
    _generatePoints(markers);

    await _partRepository.save(_part);

    ToastService.show('Trecho salvo com sucesso.');
    Navigator.pop(context, true);
  }

  void _updateRoadWidth() {
    String text = roadWithController.text.trim().replaceAll(',', '.');
    _part.roadWidth = double.parse(text);
  }

  void _generatePoints(List<Marker> markers) {
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
      if (_part.points[0].latitude != startPoint.latitude || _part.points[0].longitude != startPoint.longitude) {
        _part.points[0].altitude = null;
      }
      _part.points[0].latitude = startPoint.latitude;
      _part.points[0].longitude = startPoint.longitude;

      if (_part.points[1].latitude != endPoint.latitude || _part.points[1].longitude != endPoint.longitude) {
        _part.points[1].altitude = null;
      }
      _part.points[1].latitude = endPoint.latitude;
      _part.points[1].longitude = endPoint.longitude;
    }
  }
}
