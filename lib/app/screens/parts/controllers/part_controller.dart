import 'package:flutter_barraginha/app/screens/parts/models/responses/part_response.dart';
import 'package:flutter_barraginha/app/screens/parts/models/responses/project_part_response.dart';
import 'package:flutter_barraginha/app/screens/parts/usecases/get_project_part_usecases.dart';
import 'package:flutter_barraginha/app/screens/parts/usecases/update_project_usecases.dart';
import 'package:flutter_barraginha/app/shared/services/calculator_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';

part 'part_controller.g.dart';

class PartController = _PartControllerBase with _$PartController;

abstract class _PartControllerBase with Store {
  @observable
  ProjectPartResponse? project;

  ObservableList<PartResponse> parts = ObservableList<PartResponse>.of([
    PartResponse(
      1,
      CoordinateResponse(
        1,
        38.71980474264239,
        9.140625000000002,
        172,
      ),
      CoordinateResponse(
        1,
        38.7199219336158,
        9.14040505886078,
        162,
      ),
      3,
      null,
    ),
  ]);

  _PartControllerBase(int idProject) {
    // TODO: Loading Screen
    GetProjectPartUseCase().getProjectPart(idProject).then(
      (value) {
        project = value;

        calculatePart(parts[0]);
      },
    );
  }

  @action
  Future calculatePart(PartResponse part) async {
    part.changeState(StateResponse.loading);

    LatLng start =
        LatLng(part.coordinate1.latitude, part.coordinate1.longitude);
    LatLng end = LatLng(part.coordinate2.latitude, part.coordinate2.longitude);

    final result = await CalculatorService.calculate(
      start: start,
      end: end,
      rainVolume: project!.rainVolume,
      roadWidth: part.roadWidth!,
      soilType: 1.25, //project!.soilType.value,
    );

    part.calculateResponse = CalculateResponse.fromMap(result);
    part.changeState(StateResponse.none);
  }

  @action
  Future updateTitleProject(String newTitle) async {
    project!.title = newTitle;
    project = await UpdateProjectUsecases().update(project!);
  }

  @action
  Future updateRainVolumeProject(num newRainVolume) async {
    project!.rainVolume = newRainVolume;
    project = await UpdateProjectUsecases().update(project!);
  }
}
