import 'package:flutter/material.dart';
import 'package:flutter_barraginha/app/screens/map/controllers/map_controller.dart';
import 'package:flutter_barraginha/app/screens/map/dialogs/calculating_dialog.dart';
import 'package:flutter_barraginha/app/pages/parts_info/parts_info_page.dart';
import 'package:flutter_barraginha/app/shared/database/entities/point.dart';
import 'package:flutter_barraginha/app/shared/database/repositories/project_repository.dart';
import 'package:flutter_barraginha/app/shared/database/responses/display_part.dart';
import 'package:flutter_barraginha/app/shared/services/dialog_service.dart';
import 'package:flutter_barraginha/app/shared/services/toast_service.dart';
import 'package:flutter_barraginha/domain/repositories/part_repository.dart';
import 'package:flutter_barraginha/domain/use_cases/calculate_case.dart';
import 'package:flutter_barraginha/domain/use_cases/calculate_distance_between_coordinates_case.dart';
import 'package:flutter_barraginha/domain/use_cases/get_altitude_by_coordinate_case.dart';
import 'package:flutter_barraginha/domain/use_cases/get_soil_type_by_id_case.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';

part 'buttons_controller.g.dart';

class ButtonsController = _ButtonsControllerBase with _$ButtonsController;

abstract class _ButtonsControllerBase with Store {
  final form = GlobalKey<FormState>();
  final roadWithController = TextEditingController();

  final DisplayPart _part;
  final MapController _mapController;
  final _partRepository = Modular.get<PartRepository>();
  final IProjectRepository _projectRepository = ProjectRepository();
  final _getSoilTypeByIdCase = Modular.get<GetSoilTypeByIdCase>();
  final _calculateCase = Modular.get<CalculateCase>();
  final _getAltitudeByCoordinateCase =
      Modular.get<GetAltitudeByCoordinateCase>();
  final _calculateDistanceBetweenCoordinatesCase =
      Modular.get<CalculateDistanceBetweenCoordinatesCase>();

  _ButtonsControllerBase(this._part, this._mapController) {
    if (_part.id != null) {
      roadWithController.text = _part.roadWidth.toString().replaceAll('.', ',');
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
    project.soilType = _getSoilTypeByIdCase(project.idSoilType!);

    CalculatingDialog.show(context);

    try {
      final start = Point.copy(_part.points[0]);
      final end = Point.copy(_part.points[1]);

      start.altitude = await _getAltitudeByCoordinateCase(
        start.altitude,
        start.latitude!.toDouble(),
        start.longitude!.toDouble(),
      );
      end.altitude = await _getAltitudeByCoordinateCase(
        end.altitude,
        end.latitude!.toDouble(),
        end.longitude!.toDouble(),
      );

      final startLatLng = LatLng(
        start.latitude!.toDouble(),
        start.longitude!.toDouble(),
      );

      final endLatLng = LatLng(
        end.latitude!.toDouble(),
        end.longitude!.toDouble(),
      );

      final distance = _calculateDistanceBetweenCoordinatesCase(
        startLatLng,
        endLatLng,
      );

      final info = await _calculateCase(
        start: start,
        end: end,
        soilType: project.soilType!,
        roadWidth: _part.roadWidth!,
        rainVolume: project.rainVolume!,
        distance: distance,
      );

      CalculatingDialog.close(context);

      _part.points[0].altitude = info.pointA.altitude;
      _part.points[1].altitude = info.pointB.altitude;

      await _partRepository.save(_part);

      final resultDialog = await DialogService.showQuestionDialog(
        context,
        'Calculado com sucesso.',
        'Deseja ver os resultados?',
      );

      if (resultDialog == true) {
        await Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => PartsInfoPage(info),
          ),
        );
      }

      Navigator.pop(context, true);
    } catch (e) {
      ToastService.show("Houve um problema ao calcular");
      CalculatingDialog.close(context);
    }
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
      if (_part.points[0].latitude != startPoint.latitude ||
          _part.points[0].longitude != startPoint.longitude) {
        _part.points[0].altitude = null;
      }
      _part.points[0].latitude = startPoint.latitude;
      _part.points[0].longitude = startPoint.longitude;

      if (_part.points[1].latitude != endPoint.latitude ||
          _part.points[1].longitude != endPoint.longitude) {
        _part.points[1].altitude = null;
      }
      _part.points[1].latitude = endPoint.latitude;
      _part.points[1].longitude = endPoint.longitude;
    }
  }
}
