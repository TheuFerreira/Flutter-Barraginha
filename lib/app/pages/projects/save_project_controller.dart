import 'package:flutter/material.dart';
import 'package:flutter_barraginha/domain/entities/soil_type.dart';
import 'package:flutter_barraginha/domain/entities/display_project_response.dart';
import 'package:flutter_barraginha/domain/use_cases/get_all_soil_type_case.dart';
import 'package:flutter_barraginha/domain/use_cases/get_soil_type_by_id_case.dart';
import 'package:flutter_barraginha/infra/services/toast_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'save_project_controller.g.dart';

class SaveProjectController = _SaveProjectControllerBase
    with _$SaveProjectController;

abstract class _SaveProjectControllerBase with Store {
  final formController = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController volumeRainController;

  @observable
  SoilType? soilTypeSelected;

  @observable
  ObservableList<SoilType> soilTypes = ObservableList<SoilType>.of([]);

  final DisplayProjectResponse _project;
  final _getAllSoilTypeCase = Modular.get<GetAllSoilTypeCase>();
  final _getSoilTypeByIdCase = Modular.get<GetSoilTypeByIdCase>();

  _SaveProjectControllerBase(this._project) {
    nameController = TextEditingController(text: _project.title);
    volumeRainController = TextEditingController();
    if (_project.rainVolume != null) {
      volumeRainController.text = _project.rainVolume.toString();
    }

    getSoilType();
  }

  @action
  void getSoilType() {
    soilTypeSelected = _getSoilTypeByIdCase(_project.idSoilType!);
    soilTypes.addAll(_getAllSoilTypeCase());
  }

  @action
  void changeSoilType(SoilType? soilType) {
    soilTypeSelected = soilType!;
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Insira um nome';
    }

    return null;
  }

  String? validateVolumeRain(String? value) {
    if (value == null || value.isEmpty) {
      return 'Insira um valor';
    }

    String text = value.trim().replaceAll(',', '.');
    if (double.tryParse(text) == null) {
      return 'Insira um valor válido';
    }

    return null;
  }

  void onConfirm(BuildContext context) {
    if (formController.currentState!.validate() == false) {
      return;
    }

    final textRainVolume = volumeRainController.text.replaceAll(',', '.');
    final textName = nameController.text.trim();

    final project = _project;
    project.title = textName;
    project.rainVolume = double.parse(textRainVolume);
    project.idSoilType = soilTypeSelected!.id;
    project.status = 1;

    Navigator.pop(context, project);
  }

  void infoAboutRainVolume() {
    ToastService.show(
        'A intensidade de chuva é dada em mm levando emconsideração o pico máximo de chuva em um dia durante um período de 30 anos.');
  }
}
