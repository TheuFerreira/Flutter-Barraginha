import 'package:flutter_barraginha/app/screens/parts/models/responses/part_response.dart';
import 'package:flutter_barraginha/app/screens/parts/models/responses/project_part_response.dart';
import 'package:flutter_barraginha/app/screens/parts/usecases/get_parts_usercases.dart';
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

  @observable
  List<PartResponse> parts = ObservableList<PartResponse>();

  final int _idProject;

  _PartControllerBase(this._idProject) {
    loadAll();
  }

  @action
  Future loadAll() async {
    project = await GetProjectPartUseCase().getProjectPart(_idProject);
    parts = await GetPartsUsecases().getAll(_idProject);

    for (var part in parts) {
      calculatePart(part);
    }
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
