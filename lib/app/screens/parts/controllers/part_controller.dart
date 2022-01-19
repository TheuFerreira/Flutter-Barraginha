import 'package:flutter_barraginha/app/screens/parts/models/responses/project_part_response.dart';
import 'package:flutter_barraginha/app/screens/parts/usecases/get_project_part_usecases.dart';
import 'package:flutter_barraginha/app/screens/parts/usecases/update_project_usecases.dart';
import 'package:flutter_barraginha/app/shared/models/part_model.dart';
import 'package:flutter_barraginha/app/shared/models/point_model.dart';
import 'package:flutter_barraginha/app/shared/services/calculator_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';

part 'part_controller.g.dart';

class PartController = _PartControllerBase with _$PartController;

abstract class _PartControllerBase with Store {
  @observable
  ProjectPartResponse? project;

  @observable
  List<PartModel> parts = ObservableList.of(
    const [
      PartModel(
        1,
        3,
        [
          PointModel(1, LatLng(38.71980474264239, 9.140625000000002), 172),
          PointModel(2, LatLng(38.7199219336158, 9.14040505886078), 162),
        ],
      ),
    ],
  );

  @observable
  Map<String, dynamic>? values;

  _PartControllerBase(int idProject) {
    GetProjectPartUseCase().getProjectPart(idProject).then((value) {
      project = value;

      CalculatorService.calculate(
        start: parts[0].points[0].position,
        end: parts[0].points[1].position,
        rainVolume: project!.rainVolume,
        roadWidth: parts[0].roadWidth!,
        soilType: 1.25, //project!.soilType.value,
      ).then((value) {
        values = value;
      });
    });
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
