import 'package:flutter_barraginha/app/shared/services/info_service.dart';
import 'package:mobx/mobx.dart';

part 'about_controller.g.dart';

class AboutController = _AboutControllerBase with _$AboutController;

abstract class _AboutControllerBase with Store {
  @observable
  String info = '';

  final IInfoService _infoService = InfoService();

  _AboutControllerBase() {
    _setInfo();
  }

  @action
  Future _setInfo() async {
    String name = await _infoService.getName();
    String version = await _infoService.getVersion();

    info = '$name $version';
  }
}
