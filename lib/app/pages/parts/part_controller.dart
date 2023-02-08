// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_barraginha/app/pages/parts/item_info_controller.dart';
import 'package:flutter_barraginha/app/pages/map/map_page.dart';
import 'package:flutter_barraginha/app/pages/parts_info/parts_info_page.dart';
import 'package:flutter_barraginha/domain/entities/info_part.dart';
import 'package:flutter_barraginha/domain/entities/display_part.dart';
import 'package:flutter_barraginha/domain/entities/display_project_response.dart';
import 'package:flutter_barraginha/infra/services/dialog_service.dart';
import 'package:flutter_barraginha/domain/use_cases/delete_part_case.dart';
import 'package:flutter_barraginha/domain/use_cases/get_all_parts_by_id_project_case.dart';
import 'package:flutter_barraginha/infra/services/toast_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'part_controller.g.dart';

class PartController = _PartControllerBase with _$PartController;

abstract class _PartControllerBase with Store {
  @observable
  List<DisplayPart> parts = ObservableList<DisplayPart>.of([]);

  @observable
  num countBarrage = 0;

  final DisplayProjectResponse _project;
  final ItemInfoController _infoController;
  final _deletePartCase = Modular.get<DeletePartCase>();
  final _getAllPartsByIdProjectCase = Modular.get<GetAllPartsByIdProjectCase>();

  _PartControllerBase(this._project, this._infoController) {
    _loadAll().then((value) {
      _infoController.setCountParts(parts.length);
    });
  }

  Future addNew(BuildContext context) async {
    DisplayPart displayPart = DisplayPart(
      idProject: _project.id!,
    );

    final result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MapPage(displayPart),
      ),
    );
    if (result != true) {
      return;
    }

    _infoController.resetCountBarrage();
    await _loadAll();
    _infoController.setCountParts(parts.length);
  }

  @action
  void deletePart(BuildContext context, DisplayPart part, int index) =>
      _deletePart(context, part, index);
  Future _deletePart(BuildContext context, DisplayPart part, int index) async {
    final result = await DialogService.showQuestionDialog(
      context,
      "Excluir",
      "Tem certeza de que deseja excluir o Trecho ${index + 1}?",
    );

    if (result == false) {
      return;
    }

    await _deletePartCase(part);
    _infoController.resetCountBarrage();
    await _loadAll();

    _infoController.setCountParts(parts.length);
    ToastService.show('Trecho ${index + 1}, excluído.');
  }

  Future showEditPart(BuildContext context, DisplayPart part) async {
    final result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MapPage(part),
      ),
    );

    if (result != true) {
      return;
    }

    _infoController.resetCountBarrage();
    await _loadAll();
  }

  @action
  void loadAll() => _loadAll();
  Future _loadAll() async {
    parts = [];
    countBarrage = 0;
    parts = await _getAllPartsByIdProjectCase(_project);
  }

  void showInfoPart(BuildContext context, InfoPart info) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (builder) => PartsInfoPage(info),
      ),
    );
  }
}
