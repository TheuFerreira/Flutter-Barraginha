import 'package:flutter/material.dart';
import 'package:flutter_barraginha/app/screens/map/map_page.dart';
import 'package:flutter_barraginha/app/screens/parts/controllers/item_info_controller.dart';
import 'package:flutter_barraginha/app/screens/parts_info/parts_info_page.dart';
import 'package:flutter_barraginha/app/shared/database/entities/info_part.dart';
import 'package:flutter_barraginha/app/shared/database/repositories/part_repository.dart';
import 'package:flutter_barraginha/app/shared/database/responses/display_part.dart';
import 'package:flutter_barraginha/app/shared/database/responses/display_project_response.dart';
import 'package:flutter_barraginha/app/shared/services/dialog_service.dart';
import 'package:flutter_barraginha/app/shared/services/toast_service.dart';
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
  final IPartRepository _partRepository = PartRepository();

  _PartControllerBase(this._project, this._infoController) {
    loadAll().then((value) {
      _infoController.setCountParts(parts.length);
    });
  }

  Future addNew(BuildContext context) async {
    DisplayPart displayPart = DisplayPart(
      idProject: _project.id!,
    );

    // TODO: Check if has changed
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MapPage(displayPart),
      ),
    );

    _infoController.resetCountBarrage();
    await loadAll();
    _infoController.setCountParts(parts.length);
  }

  @action
  Future deletePart(BuildContext context, DisplayPart part, int index) async {
    final result = await DialogService.showQuestionDialog(
      context,
      "Excluir",
      "Tem certeza de que deseja excluir o Trecho ${index + 1}?",
    );

    if (result == false) {
      return;
    }

    part.status = 0;

    await _partRepository.save(part);
    _infoController.resetCountBarrage();
    await loadAll();

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
    await loadAll();
  }

  @action
  Future loadAll() async {
    parts = [];
    countBarrage = 0;
    parts = await _partRepository.getAll(_project.id!);
  }

  void showInfoPart(BuildContext context, InfoPart info) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (builder) => PartsInfoPage(info),
      ),
    );
  }
}
