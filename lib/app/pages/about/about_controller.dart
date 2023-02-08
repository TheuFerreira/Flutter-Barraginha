// ignore_for_file: library_private_types_in_public_api

import 'package:flutter_barraginha/domain/entities/device_info_result.dart';
import 'package:flutter_barraginha/domain/use_cases/get_info_device_case.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'about_controller.g.dart';

class AboutController = _AboutControllerBase with _$AboutController;

abstract class _AboutControllerBase with Store {
  @observable
  DeviceInfoResult? deviceInfo;

  final _getInfoDeviceCase = Modular.get<GetInfoDeviceCase>();

  _AboutControllerBase() {
    _setInfo();
  }

  @action
  Future _setInfo() async {
    deviceInfo = await _getInfoDeviceCase();
  }
}
