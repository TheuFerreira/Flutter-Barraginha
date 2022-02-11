import 'package:flutter/material.dart';
import 'package:flutter_barraginha/app/shared/database/entities/soil_type.dart';
import 'package:flutter_barraginha/app/shared/database/repositories/soil_type_repository.dart';
import 'package:flutter_barraginha/app/shared/database/responses/display_project_response.dart';
import 'package:mobx/mobx.dart';

part 'save_project_controller.g.dart';

class SaveProjectController = _SaveProjectControllerBase with _$SaveProjectController;

abstract class _SaveProjectControllerBase with Store {
  final formController = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController volumeRainController;

  @observable
  SoilType? soilTypeSelected;

  @observable
  List<SoilType> soilTypes = ObservableList<SoilType>();

  final DisplayProjectResponse _project;
  final ISoilTypeRepository _soilTypeRepository = SoilTypeRepository();

  _SaveProjectControllerBase(this._project) {
    nameController = TextEditingController(text: _project.title);
    volumeRainController = TextEditingController();
    if (_project.rainVolume != null) {
      volumeRainController.text = _project.rainVolume.toString();
    }

    soilTypeSelected = _soilTypeRepository.getById(_project.idSoilType!);

    getAllSoilType();
  }

  @action
  void getAllSoilType() {
    soilTypes = _soilTypeRepository.getAll();
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
}
