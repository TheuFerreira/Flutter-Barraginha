import 'package:flutter_barraginha/app/shared/database/entities/info_part.dart';
import 'package:flutter_barraginha/app/shared/database/entities/point.dart';
import 'package:flutter_barraginha/app/shared/database/responses/display_part.dart';
import 'package:flutter_barraginha/app/shared/database/responses/display_project_response.dart';
import 'package:flutter_barraginha/app/shared/services/calculator_service.dart';
import 'package:mobx/mobx.dart';

part 'item_controller.g.dart';

enum StateItem {
  loading,
  none,
  calculate,
}

class ItemController = _ItemControllerBase with _$ItemController;

abstract class _ItemControllerBase with Store {
  @observable
  InfoPart? info;

  @observable
  StateItem state = StateItem.loading;

  final DisplayProjectResponse _project;
  final DisplayPart _part;

  _ItemControllerBase(this._project, this._part, Function(int) onCaculated) {
    calculate(onCaculated);
  }

  @action
  Future calculate(Function(int) onCaculated) async {
    changeItemState(StateItem.loading);

    Point start = Point.copy(_part.points[0]);
    Point end = Point.copy(_part.points[1]);

    info = await CalculatorService.calculate(
      start: start,
      end: end,
      roadWidth: _part.roadWidth!,
      rainVolume: 1,
      soilType: _project.soilType!,
    );

    if (info == null) {
      changeItemState(StateItem.calculate);
      return;
    }

    onCaculated(info!.barrageNumbersAdjusted.toInt());

    changeItemState(StateItem.none);
  }

  @action
  void changeItemState(StateItem newState) {
    state = newState;
  }
}
